function callajax(URL,ID){
    alert("cle");
    var data = getAllData("oForm");
    var xmlhttp;
    if(window.XMLHttpRequest){
        xmlhttp = new XMLHttpRequest();
    }else{
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
	
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState==4 && xmlhttp.status==200){
            document.getElementById(ID).innerHTML = xmlhttp.responseText;
            
        }
    }
    	
    xmlhttp.open("POST",URL + data,true);
    xmlhttp.send();
        
}

function getAllData(oForm)
{
    var form  = document.getElementById(oForm);
    var data ="";
    for(var i =0;i<form.length;i++)
    {
        data += "&" + form[i].name + "=" + form[i].value;    
    }
    return data;
}
