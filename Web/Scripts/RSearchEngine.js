//importClass('rapi.rbase.RXmlHttpRequest');

function RSearchEngine(serviceUrl){

    this.serviceUrl=serviceUrl;
	this.xmlHttp=new RXmlHttpRequest().get();

	
	//公用Get请求
    this.GetStringInfo=function(str,target,callback)
	{
	    var url=this.serviceUrl+str; //+'?act=LoadQueInfo&Field1='+str
		if(target)
		{
			this.xmlHttp.onreadystatechange=function(){callback.apply(target);};
		}
		else
		{
			this.xmlHttp.onreadystatechange=callback;
		}

        //向服务器发送请求
        this.xmlHttp.open('GET', url, true);
		this.xmlHttp.send(null);
	}

	
	//公用提交  执行存储过程
	this.PostStringInfo=function(strInfo,target,callback)
	{
	    var url=this.serviceUrl;

		if(target)
		{
			this.xmlHttp.onreadystatechange=function(){callback.apply(target);};
		}
		else
		{
			this.xmlHttp.onreadystatechange=callback;
		}

		this.xmlHttp.open('POST',url,true);
//		sthis.xmlHttp.setRequestHeader("Content-Length",strInfo.length);
//		this.xmlHttp.setRequestHeader("CONTENT-TYPE", "application/x-www-form-urlencoded");
    	this.xmlHttp.setRequestHeader("CONTENT-TYPE", "text/xml");
		this.xmlHttp.send(strInfo);
	}
	
	
	this.getXmlHttp=function()
	{
		return this.xmlHttp;
	}
}