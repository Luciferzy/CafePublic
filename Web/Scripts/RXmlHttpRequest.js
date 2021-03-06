

function RXmlHttpRequest(){	

	this.xmlhttp=null;
	this.clsid=null;	

	this.createXmlHttp=function(clsid){

		try{
			this.xmlhttp=new ActiveXObject(clsid);
			this.clsid=clsid;
		}catch(e){}
	}

	this.getMSXmlHttp=function(){
		var clsids=['Msxml2.XMLHTTP.6.0','Msxml2.XMLHTTP.5.0','Msxml2.XMLHTTP.4.0','Msxml2.XMLHTTP.3.0','Msxml2.XMLHTTP.2.6','Microsoft.XMLHTTP.1.0','Microsoft.XMLHTTP.1','Microsoft.XMLHTTP']; 
		for(var i=0; i<clsids.length&&this.xmlhttp==null;i++){

			this.createXmlHttp(clsids[i]);
		} 
	}

    
	if(window.ActiveXObject){
		/*Microsoft IE*/

		this.getMSXmlHttp();
	}else{
		/*Mozilla | Netscape | Safari | Firefox*/
		this.xmlhttp=new XMLHttpRequest();
	}	


	this.get=function(){	
		return this.xmlhttp;
		
	}	

	this.toString=function(){
		return 'RXmlHttpRequest';

	}

}