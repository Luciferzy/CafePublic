function txtOnblur(num) {
    var source = String(num).split("."); //按小数点分成2部分
    source[0] = source[0].replace(new RegExp('(\\d)(?=(\\d{3})+$)', 'ig'), "$1,"); //只将整数部分进行都好分割
    return source.join("."); //再将小数部分合并进来
}
function txtOnfocus(n) {
    var oldMny = n.replace(/,/g, '');
    return oldMny;
}
function ChangeTd() {
    var divs = document.getElementsByName("cTd");
    for (var i = 0; i < divs.length; i++) {
        var obj = divs[i];
        var num = parseFloat(obj.innerHTML);
        obj.style.color = num < 0 ? "red" : "";
    }
}
function ChangeInput() {
    var divs = document.getElementsByName("iTd");
    for (var i = 0; i < divs.length; i++) {
        var obj = divs[i];
        var num = parseFloat(obj.value);
        obj.style.color = num < 0 ? "red" : "";
    }
}
function getCookieN(name) {
    var strCookie = document.cookie;
    var arrCookie = strCookie.split("; ");
    for (var i = 0; i < arrCookie.length; i++) {
        var arr = arrCookie[i].split("=");
        if (arr[0] == name) return arr[1];
    }
    return "";
}
function setCookie(name, value, seconds) {
    seconds = seconds || 0; //seconds有值就直接赋值，没有为0，这个根php不一样。
    var expires = "";
    if (seconds != 0) { //设置cookie生存时间
        var date = new Date();
        date.setTime(date.getTime() + (seconds * 1000));
        expires = "; expires=" + date.toGMTString();
    }
    document.cookie = name + "=" + escape(value) + expires + "; path=/"; //转码并赋值
}
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';'); //把cookie分割成组
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i]; //取得字符串
        while (c.charAt(0) == ' ') { //判断一下字符串有没有前导空格
            c = c.substring(1, c.length); //有的话，从第二位开始取
        }
        if (c.indexOf(nameEQ) == 0) { //如果含有我们要的name
            return unescape(c.substring(nameEQ.length, c.length)); //解码并截取我们要值
        }
    }
    return false;
}
//清除cookie
function clearCookie(name) {
    setCookie(name, "", -1);
}
function BingLocation(fTable, InfosOne, InfosTwo) {
    var strHtml = '<ul id="faq">';
    for (var i = 0; i < fTable.length; i++) {
        strHtml += '<li><dl><dt><a>' + fTable[i].firstChild.nodeValue + '</a></dt>';
        InfosTwo.length = 0;
        var j = 0;
        for (var m = 0; m < InfosOne.length; m++) {
            if (InfosOne[m].Area == fTable[i].firstChild.nodeValue) {
                InfosTwo[j] = new Object();
                InfosTwo[j].Street = InfosOne[m].Street;
                j = j + 1;
            }
        }
        for (var k = 0; k < InfosTwo.length; k = k + 1) {
            if (k + 1 < InfosTwo.length) {
                strHtml += '<dd>' + InfosTwo[k].Street + '</dd><dd>' + InfosTwo[k + 1].Street + '</dd>';
            }
            else if (k < InfosTwo.length) {
                strHtml += '<dd>' + InfosTwo[k].Street + '</dd><dd>&nbsp;</dd>';
            }
        }
        strHtml += '</dl></li>';
    }
    strHtml += '</ul>';
    document.getElementById("divLocation").innerHTML = strHtml;
    showTree("faq");
}
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + "-" + month + "-" + strDate;
    return currentdate;
}
//加载花场分类信息
var lastFaqClick = null;
function gs(d, a) {
    if (d.currentStyle) {
        var curVal = d.currentStyle[a]
    } else {
        var curVal = document.defaultView.getComputedStyle(d, null)[a]
    }
    return curVal;
}
function showTree(faq) {
    lastFaqClick = null;
    var faq = document.getElementById(faq);
    var dls = faq.getElementsByTagName("dl");
    for (var i = 0, dl; dl = dls[i]; i++) {
        var dt = dl.getElementsByTagName("dt")[0]; //取得标题
        dt.id = "faq_dt_" + (Math.random() * 100);
        dt.onclick = function () {
            var p = this.parentNode; //取得父节点
            if (lastFaqClick != null && lastFaqClick.id != this.id) {
                var dds = lastFaqClick.parentNode.getElementsByTagName("dd");
                for (var i = 0, dd; dd = dds[i]; i++)
                    dd.style.display = 'none';
            }
            lastFaqClick = this;
            var dds = p.getElementsByTagName("dd"); //取得对应子节点，也就是说明部分
            var tmpDisplay = 'none';
            if (gs(dds[0], 'display') == 'none')
                tmpDisplay = 'block';
            for (var i = 0; i < dds.length; i++)
                dds[i].style.display = tmpDisplay;
        }
    }
}

//清空Select原所有项，并用Table填充
function FillSelectItemWithTable(SelectName, table) {
    var select = document.getElementById(SelectName);
    for (var i = select.length - 1; i >= 0; i--) {
        select.remove(i);
    }
    for (var i = 0; i < table.length; i++) {
        select.options.add(new Option(table[i].firstChild.nodeValue));
    }
    select.selectedIndex = 0;
}
//自动选择相同项
function AutoSelectItem(SelectName, sValue) {
    var i = 0;
    var select = document.getElementById(SelectName);
    for (i = 0; i < select.children.length; i++) {
        if (select.children[i].text == sValue) {
            break;
        }
    }
    select.selectedIndex = i;
}
//保留小数点后两位
function changeTwoDecimal(floatvar) {
    var f_x = parseFloat(floatvar);
    if (isNaN(f_x)) {
        alert('function:changeTwoDecimal->parameter error');
        return false;
    }
    var f_x = Math.round(floatvar * 100) / 100;
    return f_x;
}
//获取Cookie
function getCookie(cookie_name) {
    var allcookies = document.cookie;
    var cookie_pos = allcookies.indexOf(cookie_name);
    if (cookie_pos != -1) {
        cookie_pos += cookie_name.length + 1;
        var cookie_end = allcookies.indexOf(";", cookie_pos);
        if (cookie_end == -1) {
            cookie_end = allcookies.length;
        }
        var value = unescape(allcookies.substring(cookie_pos, cookie_end));
    }
    return value;
}
//关闭新打开页面
function Cancel_SaveOrEdit() {
    window.opener = null;
    window.open('', '_self');
    window.close();
}
//元素范围内全选
function CheckAll(gv, name) {
    var elements = document.getElementById(gv).getElementsByTagName("input");
    for (i = 0; i < elements.length; i++) {
        if (elements[i].type == "checkbox") {

            if (name.checked == true) {
                elements[i].checked = true;
            }
            else {
                elements[i].checked = false;
            }
        }
    }
}
function CheckSales(gv, name, ctype) {
    var elements = document.getElementById(gv).getElementsByTagName("input");
    for (i = 0; i < elements.length; i++) {
        if (elements[i].type == "checkbox" && elements[i].id.indexOf(ctype) == 0) {
            if (name.checked == true) {
                elements[i].checked = true;
            }
            else {
                elements[i].checked = false;
            }
        }
    }
}
//显示供应市场详细信息
function popDiv(divid) {
    var node = document.getElementById(divid);
    node.style.display = "block";
}
//隐藏供应市场详细信息
function hiddenDiv(divid) {
    var node = document.getElementById(divid);
    node.style.display = "none";
}

///验证是否符合Email格式
function CheckEmail(emailstr) {

    var s = emailstr.split(',');

    var p = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.){1,4}[a-z]{2,5}$/i;

    for (i = 0; i < s.length; ++i) {

        if (!p.test(s[i])) {

            return "[" + s[i] + "]不是有效的Email";

        }

    }
    return "验证成功!";
}
///验证手机号码是否符合规则

function CheckMobilePhone(txt, len) {

    var s = txt.split(',');

    var telno = "";

    var mobilepart = "";

    //         var len = 0;//号码长度

    for (var i = 0; i < s.length; i++) {

        if ((s[i].indexOf("(") != -1) && (s[i].indexOf(")") != -1) && (s[i].indexOf(")") == s[i].length - 1)) {

            telno = s[i].substring(0, s[i].indexOf("("));

        }

        else {

            telno = s[i];

        }

        if (telno.length < 11) {

            if (len == 7 || len == 8) {

                if (telno.length != len) {

                    return "[" + s[i] + "]手机号码位数不正确！";

                }

            }

            else {

                if (telno.length != 7 && telno.length != 8) {

                    return "[" + s[i] + "]手机号码位数不正确！";

                }

            }

            if (CheckNum(telno) == false) {

                return "[" + s[i] + "]不是正确的手机号码！";

            }

        }

        else {

            //                 mobilepart = telno.substring(0,3);

            //                 if (mobilepart == "130" || mobilepart == "131" ||

            //                     mobilepart == "132" || mobilepart == "133" ||

            //                     mobilepart == "134" || mobilepart == "135" ||

            //                     mobilepart == "136" || mobilepart == "137" ||

            //                     mobilepart == "138" || mobilepart == "139" ||

            //                     mobilepart == "150" || mobilepart == "158" ||

            //                     mobilepart == "159" || mobilepart == "156")//手机号码

            //                 {

            if (telno.length != 11) {

                return "[" + s[i] + "]手机号码位数不正确！";

            }

            else {

                if (CheckNum(telno) == false) {

                    return "[" + s[i] + "]不是正确的手机号码！";

                }

            }

            //                  }

            //                  else

            //                  {

            //                      return "[" + s[i] + "]不是正确的手机号码！";

            //                  }

        }

    }

    return "验证成功！";

}

///验证是否为时间格式**:**
function CheckTime(StrTime) {
    var PreStrTime;
    var LastStrTime;
    if (StrTime.indexOf(":") == -1) {
        return false;
    }
    else {
        PreStrTime = StrTime.substring(0, StrTime.indexOf(":"));
        LastStrTime = StrTime.substring(StrTime.indexOf(":") + 1, StrTime.length);
        if (!CheckNum(PreStrTime) || !CheckNum(LastStrTime))
            return false;
        if ((PreStrTime < 0) || (PreStrTime > 24))
            return false;
        if ((LastStrTime < 0) || (LastStrTime > 59))
            return false;
        if ((PreStrTime == 24) && (LastStrTime > 0))
            return false;
    }
    return true;
}
///验证是否为数字
function CheckNum(txt) {
    for (var i = 0; i < txt.length; i++) {
        var midChar = txt.substring(i, i + 1);
        if ((midChar >= '0' && midChar <= '9')) {
            //数字
        }
        else {
            return false;
        }
    }
    return true;
}
///验证是否为浮点数字
function CheckFloatNum(txt) {
    if (txt.indexOf(".") == -1) {
        return false;
    }
    else {
        for (var i = 0; i < txt.length; i++) {
            var midChar = txt.substring(i, i + 1);
            if ((midChar >= '0' && midChar <= '9') || midChar == '.') {

                //数字
            }
            else {
                return false;
            }
        }
    }
    return true;
}
//花色选择
function ChangeColor(form, ColorName, ColorCN) {
    var ColorValue = " ";
    if (ColorName == 'aliceblue') ColorValue = "#F0F8FF";
    if (ColorName == 'antiquewhite') ColorValue = "#FAEBD7";
    if (ColorName == 'aqua') ColorValue = "#00FFFF";
    if (ColorName == 'aquamarine') ColorValue = "#7FFFD4";
    if (ColorName == 'azure') ColorValue = "#F0FFFF";
    if (ColorName == 'beige') ColorValue = "#F5F5DC";
    if (ColorName == 'bisque') ColorValue = "#FFE4C4";
    if (ColorName == 'black') ColorValue = "#000000";
    if (ColorName == 'blanchedalmond') ColorValue = "#FFEBCD";
    if (ColorName == 'blue') ColorValue = "#0000FF";
    if (ColorName == 'blueviolet') ColorValue = "#8A2BE2";
    if (ColorName == 'brown') ColorValue = "#A52A2A";
    if (ColorName == 'burlywood') ColorValue = "#DEB887";
    if (ColorName == 'cadetblue') ColorValue = "#5F9EA0";
    if (ColorName == 'chartreuse') ColorValue = "#7FFF00";
    if (ColorName == 'chocolate') ColorValue = "#D2691E";
    if (ColorName == 'coral') ColorValue = "#FF7F50";
    if (ColorName == 'cornflowerblue') ColorValue = "#6495ED";
    if (ColorName == 'cornsilk') ColorValue = "#FFF8DC";
    if (ColorName == 'crimson') ColorValue = "#DC143C";
    if (ColorName == 'cyan') ColorValue = "#00FFFF";
    if (ColorName == 'darkblue') ColorValue = "#00008B";
    if (ColorName == 'darkcyan') ColorValue = "#008B8B";
    if (ColorName == 'darkgoldenrod') ColorValue = "#B8860B";
    if (ColorName == 'darkgray') ColorValue = "#A9A9A9";
    if (ColorName == 'darkgreen') ColorValue = "#006400";
    if (ColorName == 'darkkhaki') ColorValue = "#BDB76B";
    if (ColorName == 'darkmagenta') ColorValue = "#8B008B";
    if (ColorName == 'darkolivegreen') ColorValue = "#556B2F";
    if (ColorName == 'darkorange') ColorValue = "#FF8C00";
    if (ColorName == 'darkorchid') ColorValue = "#9932CC";
    if (ColorName == 'darkred') ColorValue = "#8B0000";
    if (ColorName == 'darksalmon') ColorValue = "#E9967A";
    if (ColorName == 'darkseagreen') ColorValue = "#8FBC8F";
    if (ColorName == 'darkslateblue') ColorValue = "#483D8B";
    if (ColorName == 'darkslategray') ColorValue = "#2F4F4F";
    if (ColorName == 'darkturquoise') ColorValue = "#00CED1";
    if (ColorName == 'darkviolet') ColorValue = "#9400D3";
    if (ColorName == 'deeppink') ColorValue = "#FF1493";
    if (ColorName == 'deepskyblue') ColorValue = "#00BFFF";
    if (ColorName == 'dimgray') ColorValue = "#696969";
    if (ColorName == 'dodgerblue') ColorValue = "#1E90FF";
    if (ColorName == 'firebrick') ColorValue = "#B22222";
    if (ColorName == 'floralwhite') ColorValue = "#FFFAF0";
    if (ColorName == 'forestgreen') ColorValue = "#228B22";
    if (ColorName == 'fuchsia') ColorValue = "#FF00FF";
    if (ColorName == 'gainsboro') ColorValue = "#DCDCDC";
    if (ColorName == 'ghostwhite') ColorValue = "#F8F8FF";
    if (ColorName == 'gold') ColorValue = "#FFD700";
    if (ColorName == 'goldenrod') ColorValue = "#DAA520";
    if (ColorName == 'gray') ColorValue = "#808080";
    if (ColorName == 'green') ColorValue = "#008000";
    if (ColorName == 'greenyellow') ColorValue = "#ADFF2F";
    if (ColorName == 'honeydew') ColorValue = "#F0FFF0";
    if (ColorName == 'hotpink') ColorValue = "#FF69B4";
    if (ColorName == 'indianred') ColorValue = "#CD5C5C";
    if (ColorName == 'indigo') ColorValue = "#4B0082";
    if (ColorName == 'ivory') ColorValue = "#FFFFF0";
    if (ColorName == 'khaki') ColorValue = "#F0E68C";
    if (ColorName == 'lavender') ColorValue = "#E6E6FA";
    if (ColorName == 'lavenderblush') ColorValue = "#FFF0F5";
    if (ColorName == 'lawngreen') ColorValue = "#7CFC00";
    if (ColorName == 'lemonchiffon') ColorValue = "#FFFACD";
    if (ColorName == 'lightblue') ColorValue = "#ADD8E6";
    if (ColorName == 'lightcoral') ColorValue = "#F08080";
    if (ColorName == 'lightcyan') ColorValue = "#E0FFFF";
    if (ColorName == 'lightgoldenrodyellow') ColorValue = "#FAFAD2";
    if (ColorName == 'lightgreen') ColorValue = "#90EE90";
    if (ColorName == 'lightgrey') ColorValue = "#D3D3D3";
    if (ColorName == 'lightpink') ColorValue = "#FFB6C1";
    if (ColorName == 'lightsalmon') ColorValue = "#FFA07A";
    if (ColorName == 'lightseagreen') ColorValue = "#20B2AA";
    if (ColorName == 'lightskyblue') ColorValue = "#87CEFA";
    if (ColorName == 'lightslategray') ColorValue = "#778899";
    if (ColorName == 'lightsteelblue') ColorValue = "#B0C4DE";
    if (ColorName == 'lightyellow') ColorValue = "#FFFFE0";
    if (ColorName == 'lime') ColorValue = "#00FF00";
    if (ColorName == 'limegreen') ColorValue = "#32CD32";
    if (ColorName == 'linen') ColorValue = "#FAF0E6";
    if (ColorName == 'magenta') ColorValue = "#FF00FF";
    if (ColorName == 'maroon') ColorValue = "#800000";
    if (ColorName == 'mediumaquamarine') ColorValue = "#66CDAA";
    if (ColorName == 'mediumblue') ColorValue = "#0000CD";
    if (ColorName == 'mediumorchid') ColorValue = "#BA55D3";
    if (ColorName == 'mediumpurple') ColorValue = "#9370DB";
    if (ColorName == 'mediumseagreen') ColorValue = "#3CB371";
    if (ColorName == 'mediumslateblue') ColorValue = "#7B68EE";
    if (ColorName == 'mediumspringgreen') ColorValue = "#00FA9A";
    if (ColorName == 'mediumturquoise') ColorValue = "#48D1CC";
    if (ColorName == 'mediumvioletred') ColorValue = "#C71585";
    if (ColorName == 'midnightblue') ColorValue = "#191970";
    if (ColorName == 'mintcream') ColorValue = "#F5FFFA";
    if (ColorName == 'mistyrose') ColorValue = "#FFE4E1";
    if (ColorName == 'moccasin') ColorValue = "#FFE4B5";
    if (ColorName == 'navajowhite') ColorValue = "#FFDEAD";
    if (ColorName == 'navy') ColorValue = "#000080";
    if (ColorName == 'oldlace') ColorValue = "#FDF5E6";
    if (ColorName == 'olive') ColorValue = "#808000";
    if (ColorName == 'olivedrab') ColorValue = "#6B8E23";
    if (ColorName == 'orange') ColorValue = "#FFA500";
    if (ColorName == 'orangered') ColorValue = "#FF4500";
    if (ColorName == 'orchid') ColorValue = "#DA70D6";
    if (ColorName == 'palegoldenrod') ColorValue = "#EEE8AA";
    if (ColorName == 'palegreen') ColorValue = "#98FB98";
    if (ColorName == 'paleturquoise') ColorValue = "#AFEEEE";
    if (ColorName == 'palevioletred') ColorValue = "#DB7093";
    if (ColorName == 'papayawhip') ColorValue = "#FFEFD5";
    if (ColorName == 'peachpuff') ColorValue = "#FFDAB9";
    if (ColorName == 'peru') ColorValue = "#CD853F";
    if (ColorName == 'pink') ColorValue = "#FFC0CB";
    if (ColorName == 'plum') ColorValue = "#DDA0DD";
    if (ColorName == 'powderblue') ColorValue = "#B0E0E6";
    if (ColorName == 'purple') ColorValue = "#800080";
    if (ColorName == 'red') ColorValue = "#FF0000";
    if (ColorName == 'rosybrown') ColorValue = "#BC8F8F";
    if (ColorName == 'royalblue') ColorValue = "#4169E1";
    if (ColorName == 'saddlebrown') ColorValue = "#8B4513";
    if (ColorName == 'salmon') ColorValue = "#FA8072";
    if (ColorName == 'sandybrown') ColorValue = "#F4A460";
    if (ColorName == 'seagreen') ColorValue = "#2E8B57";
    if (ColorName == 'seashell') ColorValue = "#FFF5EE";
    if (ColorName == 'sienna') ColorValue = "#A0522D";
    if (ColorName == 'silver') ColorValue = "#C0C0C0";
    if (ColorName == 'skyblue') ColorValue = "#87CEEB";
    if (ColorName == 'slateblue') ColorValue = "#6A5ACD";
    if (ColorName == 'slategray') ColorValue = "#708090";
    if (ColorName == 'snow') ColorValue = "#FFFAFA";
    if (ColorName == 'springgreen') ColorValue = "#00FF7F";
    if (ColorName == 'steelblue') ColorValue = "#4682B4";
    if (ColorName == 'tan') ColorValue = "#D2B48C";
    if (ColorName == 'teal') ColorValue = "#008080";
    if (ColorName == 'thistle') ColorValue = "#D8BFD8";
    if (ColorName == 'tomato') ColorValue = "#FF6347";
    if (ColorName == 'turquoise') ColorValue = "#40E0D0";
    if (ColorName == 'violet') ColorValue = "#EE82EE";
    if (ColorName == 'wheat') ColorValue = "#F5DEB3";
    if (ColorName == 'white') ColorValue = "#FFFFFF";
    if (ColorName == 'whitesmoke') ColorValue = "#F5F5F5";
    if (ColorName == 'yellow') ColorValue = "#FFFF00";
    if (ColorName == 'yellowgreen') ColorValue = "#9ACD32";
    //            document.bgColor = ColorName;
    document.getElementById("tabColor").bgColor = ColorName;
    document.getElementById("txtColor").value = ColorCN;
//    form.CName.value = ColorCN;
//    form.CValue.value = ColorValue;
    document.getElementById("txtColorCName").value = ColorCN;
    document.getElementById("txtColorCValue").value = ColorValue;
}
//图片预览
function previewImage(file) {
    var MAXWIDTH = 180;
    var MAXHEIGHT = 180;
    var div = document.getElementById('preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=imghead>';
        var img = document.getElementById('imghead');
        img.onload = function () {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            img.style.marginLeft = rect.left + 'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function (evt) { img.src = evt.target.result; }
        reader.readAsDataURL(file.files[0]);
    }
    else {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imghead>';
        var img = document.getElementById('imghead');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;margin-left:" + rect.left + "px;" + sFilter + src + "\"'></div>";
    }
}
function clacImgZoomParam(maxWidth, maxHeight, width, height) {
    var param = { top: 0, left: 0, width: width, height: height };
    if (width > maxWidth || height > maxHeight) {
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;
        if (rateWidth > rateHeight) {
            param.width = maxWidth;
            param.height = Math.round(height / rateWidth);
        } else {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }
    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}
function check(btid) {
    var bt = document.getElementById(btid);
    var key = event.keyCode;
    if (key == 13)
        stopDefault();
    bt.click();
}
function stopDefault(e) {
    //如果提供了事件对象，则这是一个非IE浏览器   
    if (e && e.preventDefault) {
        //阻止默认浏览器动作(W3C)  
        e.preventDefault();
    } else {
        //IE中阻止函数器默认动作的方式   
        window.event.returnValue = false;
    }
    return false;
}

