/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function showProjectInfo()
{
    var xmlhttp;
    if(window.XMLHttpRequest){
        xmlhttp = new XMLHttpRequest();
    }else{
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState==4 && xmlhttp.status==200){
            document.getElementById(1).innerHTML = xmlhttp.responseText;
        }
    }

    var pname = document.getElementById("pname").value;
	
    xmlhttp.open("GET","issue.htm?name="+pname,true);
    xmlhttp.send(); 
}
