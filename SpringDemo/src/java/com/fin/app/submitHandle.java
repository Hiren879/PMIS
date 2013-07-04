/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fin.app;

import com.fin.db.dbutility.DBConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

/**
 *
 * @author HR
 */
public class submitHandle extends MultiActionController {

    DBConnection db;

    public ModelAndView submit(HttpServletRequest req, HttpServletResponse rep) throws SQLException {
        ModelAndView mv = new ModelAndView();

        String project = req.getParameter("pname");
        String client = req.getParameter("cname");
        String module = req.getParameter("mname");
        String contact = req.getParameter("cno");
        String prepby = req.getParameter("prepby");
        String prepdate = req.getParameter("pdate");
        String cat = req.getParameter("category");
        String issudesc = req.getParameter("idesc");
        String reason = req.getParameter("reason");
        String event = req.getParameter("event");
        String correction = req.getParameter("caction");
        int timetaken = Integer.parseInt(req.getParameter("time"));
        String impact = req.getParameter("impt");
        String remark = req.getParameter("remark");

        int pid;
        ArrayList list = new ArrayList();
        db = new DBConnection();
        pid = db.queryint("select max(PID)+1 from projectsummery");
        if(pid==0){
            pid = 1;
        }
        db.queryi("insert into projectsummery values(" + pid + ",'" + project + "','" + client + "','" + contact + "','" + prepby + "','" + prepdate + "')");
        db.queryi("insert into issuelog values(" + pid + ",'" + module + "','','" + issudesc + "','" + reason + "','" + event + "','" + correction + "'," + timetaken + ",'" + impact + "','" + remark + "')");
        db.queryi("insert into lessonlearned values(" + pid + ",'" + cat + "','','')");
        ResultSet rs = null;
        rs = db.querys("SELECT i.PID,i.modulename,i.issuecreatoindate,i.issueldesc,i.reason,i.event,i.correctiveeaction,i.timetaken,i.impact,i.remark,p.Pname,p.Cname,p.contactno,p.prepby,p.prepdate from issuelog i right join projectsummery p on i.PID=p.PID");

        while (rs.next()) {
            Map mp = new HashMap();
            mp.put("Pname", rs.getString("Pname"));
            mp.put("Cname", rs.getString("Cname"));
            mp.put("contactno", rs.getString("contactno"));
            mp.put("prepby", rs.getString("prepby"));
            mp.put("prepdate", rs.getString("prepdate"));
            mp.put("modulename", rs.getString("modulename"));
            mp.put("issuecreatoindate", rs.getString("issuecreatoindate"));
            mp.put("issueldesc", rs.getString("issueldesc"));
            mp.put("reason", rs.getString("reason"));
            mp.put("event", rs.getString("event"));
            mp.put("correctiveeaction", rs.getString("correctiveeaction"));
            mp.put("impact", rs.getString("impact"));
            mp.put("timetaken", rs.getString("timetaken"));
            mp.put("remark", rs.getString("remark"));
            list.add(mp);
        }
        mv.addObject("listitems", list);
        mv.setViewName("Display");
        return mv;
    }

    public ModelAndView submitlesson(HttpServletRequest req, HttpServletResponse rep) throws SQLException {
        ModelAndView mv = new ModelAndView();
        int pid;
        String project = req.getParameter("pname");
        String issue = req.getParameter("issuename");
        String client = req.getParameter("cname");
        String contact = req.getParameter("cno");
        String prepby = req.getParameter("prepby");
        String prepdate = req.getParameter("pdate");
        String issuedate = req.getParameter("idate");
        String cmnt = req.getParameter("comments");
        String tandt = req.getParameter("tandt");

        db = new DBConnection();
        ArrayList list1 = new ArrayList();
        
        if (issue.equalsIgnoreCase("NO ISSUE")) {

            int ppid = db.queryint("select MAX(p.PID) from projectsummery p");
            ppid = ppid + 1;
            db.queryi(("insert into projectsummery values(" + ppid + ",'" + project + "','" + client + "','" + contact + "','" + prepby + "','" + prepdate + "')"));
            db.queryi("insert into lessonlearned values(" + ppid + ",'NO ISSUE','" + cmnt + "','" + tandt + "')");
            
            ResultSet rs = null;
            rs = db.querys("SELECT p.Pname,p.Cname,p.contactno,i.issueldesc,l.category,l.randc,l.tandt FROM projectsummery as p left join lessonlearned as l on l.PID = p.PID left join issuelog as i on i.PID = p.PID");
            while (rs.next()) {
                Map mp2 = new HashMap();
                mp2.put("pname", rs.getString("Pname"));
                mp2.put("issue", rs.getString("issueldesc"));
                mp2.put("cname", rs.getString("Cname"));
                mp2.put("contactno", rs.getString("contactno"));
                mp2.put("category", rs.getString("category"));
                mp2.put("cmnt", rs.getString("randc"));
                mp2.put("tools", rs.getString("tandt"));
                list1.add(mp2);
            }
        } else {


            int ppid = db.queryint("select p.PID from projectsummery as p where p.Pname='" + project + "'");
            pid = db.queryint("select p.PID from projectsummery as p inner join issuelog as i on (p.PID=" + ppid + ") where i.issueldesc=" + issue + "'");
            db.queryud("update lessonlearned set randc='" + cmnt + "',tandt='" + tandt + "'where PID=" + pid);
            db.queryud("update issuelog set issuecreatoindate='" + issuedate + "'where PID="+ pid);
            ResultSet rs = null;
            rs = db.querys("SELECT p.Pname,p.Cname,p.contactno,i.issueldesc,l.category,l.randc,l.tandt FROM projectsummery as p inner join lessonlearned as l on l.PID = p.PID left join issuelog as i on i.PID = p.PID");


            while (rs.next()) {
                Map mp2 = new HashMap();
                mp2.put("pname", rs.getString("Pname"));
                mp2.put("issue", rs.getString("issueldesc"));
                mp2.put("cname", rs.getString("Cname"));
                mp2.put("contactno", rs.getString("contactno"));
                mp2.put("category", rs.getString("category"));
                mp2.put("cmnt", rs.getString("randc"));
                mp2.put("tools", rs.getString("tandt"));
                list1.add(mp2);
            }
        }
        mv.addObject("listitems1", list1);
        mv.setViewName("DisplayIsuue");
        return mv;
    }
}