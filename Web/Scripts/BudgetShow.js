function setShow() {
    Check.length = 0;
    var Str = "?act=getbudgetsetshow&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
    nmEntity.PostStringInfo(Str, this, this.setShowListBack);
}
function setShowListBack() {
    var xmlHttp = nmEntity.getXmlHttp();
    if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
        if (xmlHttp.status == 200) {
            var xmldoc = xmlHttp.responseXML;
            var cYearNode = xmldoc.getElementsByTagName("cYear");
            var isJanPlanNode = xmldoc.getElementsByTagName("isJanPlan");
            var isJanRealNode = xmldoc.getElementsByTagName("isJanReal");
            var isFebPlanNode = xmldoc.getElementsByTagName("isFebPlan");
            var isFebRealNode = xmldoc.getElementsByTagName("isFebReal");
            var isMarPlanNode = xmldoc.getElementsByTagName("isMarPlan");
            var isMarRealNode = xmldoc.getElementsByTagName("isMarReal");
            var isAprPlanNode = xmldoc.getElementsByTagName("isAprPlan");
            var isAprRealNode = xmldoc.getElementsByTagName("isAprReal");
            var isMayPlanNode = xmldoc.getElementsByTagName("isMayPlan");
            var isMayRealNode = xmldoc.getElementsByTagName("isMayReal");
            var isJunPlanNode = xmldoc.getElementsByTagName("isJunPlan");
            var isJunRealNode = xmldoc.getElementsByTagName("isJunReal");
            var isJulPlanNode = xmldoc.getElementsByTagName("isJulPlan");
            var isJulRealNode = xmldoc.getElementsByTagName("isJulReal");
            var isAugPlanNode = xmldoc.getElementsByTagName("isAugPlan");
            var isAugRealNode = xmldoc.getElementsByTagName("isAugReal");
            var isSepPlanNode = xmldoc.getElementsByTagName("isSepPlan");
            var isSepRealNode = xmldoc.getElementsByTagName("isSepReal");
            var isOctPlanNode = xmldoc.getElementsByTagName("isOctPlan");
            var isOctRealNode = xmldoc.getElementsByTagName("isOctReal");
            var isNovPlanNode = xmldoc.getElementsByTagName("isNovPlan");
            var isNovRealNode = xmldoc.getElementsByTagName("isNovReal");
            var isDecPlanNode = xmldoc.getElementsByTagName("isDecPlan");
            var isDecRealNode = xmldoc.getElementsByTagName("isDecReal");
            if (isTwo == 1) {
                var kcYearNode = xmldoc.getElementsByTagName("kcYear");
                var kisJanPlanNode = xmldoc.getElementsByTagName("kisJanPlan");
                var kisJanRealNode = xmldoc.getElementsByTagName("kisJanReal");
                var kisFebPlanNode = xmldoc.getElementsByTagName("kisFebPlan");
                var kisFebRealNode = xmldoc.getElementsByTagName("kisFebReal");
                var kisMarPlanNode = xmldoc.getElementsByTagName("kisMarPlan");
                var kisMarRealNode = xmldoc.getElementsByTagName("kisMarReal");
                var kisAprPlanNode = xmldoc.getElementsByTagName("kisAprPlan");
                var kisAprRealNode = xmldoc.getElementsByTagName("kisAprReal");
                var kisMayPlanNode = xmldoc.getElementsByTagName("kisMayPlan");
                var kisMayRealNode = xmldoc.getElementsByTagName("kisMayReal");
                var kisJunPlanNode = xmldoc.getElementsByTagName("kisJunPlan");
                var kisJunRealNode = xmldoc.getElementsByTagName("kisJunReal");
                var kisJulPlanNode = xmldoc.getElementsByTagName("kisJulPlan");
                var kisJulRealNode = xmldoc.getElementsByTagName("kisJulReal");
                var kisAugPlanNode = xmldoc.getElementsByTagName("kisAugPlan");
                var kisAugRealNode = xmldoc.getElementsByTagName("kisAugReal");
                var kisSepPlanNode = xmldoc.getElementsByTagName("kisSepPlan");
                var kisSepRealNode = xmldoc.getElementsByTagName("kisSepReal");
                var kisOctPlanNode = xmldoc.getElementsByTagName("kisOctPlan");
                var kisOctRealNode = xmldoc.getElementsByTagName("kisOctReal");
                var kisNovPlanNode = xmldoc.getElementsByTagName("kisNovPlan");
                var kisNovRealNode = xmldoc.getElementsByTagName("kisNovReal");
                var kisDecPlanNode = xmldoc.getElementsByTagName("kisDecPlan");
                var kisDecRealNode = xmldoc.getElementsByTagName("kisDecReal");
            }
            if (cYearNode.length > 0) {
                Check[0] = new Object();
                Check[0].isJanPlan = isJanPlanNode[0].childNodes.length > 0 ? isJanPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isJanReal = isJanRealNode[0].childNodes.length > 0 ? isJanRealNode[0].firstChild.nodeValue : 0;
                Check[0].isFebPlan = isFebPlanNode[0].childNodes.length > 0 ? isFebPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isFebReal = isFebRealNode[0].childNodes.length > 0 ? isFebRealNode[0].firstChild.nodeValue : 0;
                Check[0].isMarPlan = isMarPlanNode[0].childNodes.length > 0 ? isMarPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isMarReal = isMarRealNode[0].childNodes.length > 0 ? isMarRealNode[0].firstChild.nodeValue : 0;
                Check[0].isAprPlan = isAprPlanNode[0].childNodes.length > 0 ? isAprPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isAprReal = isAprRealNode[0].childNodes.length > 0 ? isAprRealNode[0].firstChild.nodeValue : 0;
                Check[0].isMayPlan = isMayPlanNode[0].childNodes.length > 0 ? isMayPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isMayReal = isMayRealNode[0].childNodes.length > 0 ? isMayRealNode[0].firstChild.nodeValue : 0;
                Check[0].isJunPlan = isJunPlanNode[0].childNodes.length > 0 ? isJunPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isJunReal = isJunRealNode[0].childNodes.length > 0 ? isJunRealNode[0].firstChild.nodeValue : 0;
                Check[0].isJulPlan = isJulPlanNode[0].childNodes.length > 0 ? isJulPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isJulReal = isJulRealNode[0].childNodes.length > 0 ? isJulRealNode[0].firstChild.nodeValue : 0;
                Check[0].isAugPlan = isAugPlanNode[0].childNodes.length > 0 ? isAugPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isAugReal = isAugRealNode[0].childNodes.length > 0 ? isAugRealNode[0].firstChild.nodeValue : 0;
                Check[0].isSepPlan = isSepPlanNode[0].childNodes.length > 0 ? isSepPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isSepReal = isSepRealNode[0].childNodes.length > 0 ? isSepRealNode[0].firstChild.nodeValue : 0;
                Check[0].isOctPlan = isOctPlanNode[0].childNodes.length > 0 ? isOctPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isOctReal = isOctRealNode[0].childNodes.length > 0 ? isOctRealNode[0].firstChild.nodeValue : 0;
                Check[0].isNovPlan = isNovPlanNode[0].childNodes.length > 0 ? isNovPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isNovReal = isNovRealNode[0].childNodes.length > 0 ? isNovRealNode[0].firstChild.nodeValue : 0;
                Check[0].isDecPlan = isDecPlanNode[0].childNodes.length > 0 ? isDecPlanNode[0].firstChild.nodeValue : 0;
                Check[0].isDecReal = isDecRealNode[0].childNodes.length > 0 ? isDecRealNode[0].firstChild.nodeValue : 0;
                if (isTwo == 1) {
                    Check[0].kisJanPlan = kisJanPlanNode[0].childNodes.length > 0 ? kisJanPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisJanReal = kisJanRealNode[0].childNodes.length > 0 ? kisJanRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisFebPlan = kisFebPlanNode[0].childNodes.length > 0 ? kisFebPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisFebReal = kisFebRealNode[0].childNodes.length > 0 ? kisFebRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisMarPlan = kisMarPlanNode[0].childNodes.length > 0 ? kisMarPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisMarReal = kisMarRealNode[0].childNodes.length > 0 ? kisMarRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisAprPlan = kisAprPlanNode[0].childNodes.length > 0 ? kisAprPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisAprReal = kisAprRealNode[0].childNodes.length > 0 ? kisAprRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisMayPlan = kisMayPlanNode[0].childNodes.length > 0 ? kisMayPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisMayReal = kisMayRealNode[0].childNodes.length > 0 ? kisMayRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisJunPlan = kisJunPlanNode[0].childNodes.length > 0 ? kisJunPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisJunReal = kisJunRealNode[0].childNodes.length > 0 ? kisJunRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisJulPlan = kisJulPlanNode[0].childNodes.length > 0 ? kisJulPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisJulReal = kisJulRealNode[0].childNodes.length > 0 ? kisJulRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisAugPlan = kisAugPlanNode[0].childNodes.length > 0 ? kisAugPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisAugReal = kisAugRealNode[0].childNodes.length > 0 ? kisAugRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisSepPlan = kisSepPlanNode[0].childNodes.length > 0 ? kisSepPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisSepReal = kisSepRealNode[0].childNodes.length > 0 ? kisSepRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisOctPlan = kisOctPlanNode[0].childNodes.length > 0 ? kisOctPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisOctReal = kisOctRealNode[0].childNodes.length > 0 ? kisOctRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisNovPlan = kisNovPlanNode[0].childNodes.length > 0 ? kisNovPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisNovReal = kisNovRealNode[0].childNodes.length > 0 ? kisNovRealNode[0].firstChild.nodeValue : 0;
                    Check[0].kisDecPlan = kisDecPlanNode[0].childNodes.length > 0 ? kisDecPlanNode[0].firstChild.nodeValue : 0;
                    Check[0].kisDecReal = kisDecRealNode[0].childNodes.length > 0 ? kisDecRealNode[0].firstChild.nodeValue : 0;
                }
            }
            if (isTwo == 1) {
                showCheckTwo();
            } else {
                showCheckOne();
            }
        }
        else {
            window.status = '服务器出错，请稍后重试...';
        }
    }
    else {
        window.status = '正在查询，请稍候...';
    }
}
function showCheckOne() {
    YearS = Info[0].cYear;
    YearE = Info[0].cYear;
    var strHtml = '<table class="table2" style="font-size:10pt;"><tbody>';
    strHtml += '<tr><td style="color:Blue;font-size: 18px;text-align:left;">' + YearS + '</td><td style="color:Blue;font-size: 18px;text-align:left;">' + YearS + '</td></tr>';
    Check[0].isJanPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">01月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">01月计划</span></td>';
    Check[0].isJanReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">01月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">01月实际</span></td></tr>';
    Check[0].isFebPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">02月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">02月计划</span></td>';
    Check[0].isFebReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">02月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">02月实际</span></td></tr>';
    Check[0].isMarPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">03月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">03月计划</span></td>';
    Check[0].isMarReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">03月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">03月实际</span></td></tr>';
    Check[0].isAprPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">04月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">04月计划</span></td>';
    Check[0].isAprReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">04月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">04月实际</span></td></tr>';
    Check[0].isMayPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">05月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">05月计划</span></td>';
    Check[0].isMayReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">05月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">05月实际</span></td></tr>';
    Check[0].isJunPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">06月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">06月计划</span></td>';
    Check[0].isJunReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">06月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">06月实际</span></td></tr>';
    Check[0].isJulPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">07月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">07月计划</span></td>';
    Check[0].isJulReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">07月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">07月实际</span></td></tr>';
    Check[0].isAugPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">08月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">08月计划</span></td>';
    Check[0].isAugReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">08月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">08月实际</span></td></tr>';
    Check[0].isSepPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">09月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">09月计划</span></td>';
    Check[0].isSepReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">09月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">09月实际</span></td></tr>';
    Check[0].isOctPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">10月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">10月计划</span></td>';
    Check[0].isOctReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">10月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">10月实际</span></td></tr>';
    Check[0].isNovPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">11月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">11月计划</span></td>';
    Check[0].isNovReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">11月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">11月实际</span></td></tr>';
    Check[0].isDecPlan == "1" ? strHtml += '<tr><td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">12月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">12月计划</span></td>';
    Check[0].isDecReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">12月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">12月实际</span></td></tr>';
    strHtml += '</tbody></table>';
    document.getElementById("divDetail").innerHTML = strHtml;
    popDiv("divAdd");
}
function showCheckTwo() {
    YearS = Info[0].cYear;
    YearE = Info[0].kcYear;
    var strHtml = '<table class="table2" style="font-size:10pt;"><tbody>';
    strHtml += '<tr><td style="color:Blue;font-size: 18px;text-align:left;">' + YearS + '</td><td style="color:Blue;font-size: 18px;text-align:left;">' + YearS + '</td><td style="color:Blue;font-size: 18px;text-align:left;">' + YearE + '</td><td style="color:Blue;font-size: 18px;text-align:left;">' + YearE + '</td></tr>';
    Check[0].isJanPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">01月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">01月计划</span></td>';
    Check[0].isJanReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">01月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJanReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">01月实际</span></td>';
    Check[0].kisJanPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJanPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">01月计划</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJanPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">01月计划</span></td>';
    Check[0].kisJanReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJanReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">01月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJanReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">01月实际</span></td></tr>';
    Check[0].isFebPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">02月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">02月计划</span></td>';
    Check[0].isFebReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">02月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isFebReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">02月实际</span></td>';
    Check[0].kisFebPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisFebPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">02月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisFebPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">02月计划</span></td>';
    Check[0].kisFebReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisFebReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">02月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisFebReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">02月实际</span></td></tr>';
    Check[0].isMarPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">03月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">03月计划</span></td>';
    Check[0].isMarReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">03月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMarReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">03月实际</span></td>';
    Check[0].kisMarPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMarPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">03月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMarPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">03月计划</span></td>';
    Check[0].kisMarReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMarReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">03月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMarReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">03月实际</span></td></tr>';
    Check[0].isAprPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">04月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">04月计划</span></td>';
    Check[0].isAprReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">04月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAprReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">04月实际</span></td>';
    Check[0].kisAprPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAprPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">04月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAprPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">04月计划</span></td>';
    Check[0].kisAprReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAprReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">04月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAprReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">04月实际</span></td></tr>';
    Check[0].isMayPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">05月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">05月计划</span></td>';
    Check[0].isMayReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">05月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isMayReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">05月实际</span></td>';
    Check[0].kisMayPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMayPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">05月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMayPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">05月计划</span></td>';
    Check[0].kisMayReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMayReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">05月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisMayReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">05月实际</span></td></tr>';
    Check[0].isJunPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">06月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">06月计划</span></td>';
    Check[0].isJunReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">06月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJunReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">06月实际</span></td>';
    Check[0].kisJunPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJunPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">06月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJunPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">06月计划</span></td>';
    Check[0].kisJunReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJunReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">06月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJunReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">06月实际</span></td></tr>';
    Check[0].isJulPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">07月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">07月计划</span></td>';
    Check[0].isJulReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">07月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isJulReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">07月实际</span></td>';
    Check[0].kisJulPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJulPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">07月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJulPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">07月计划</span></td>';
    Check[0].kisJulReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJulReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">07月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisJulReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">07月实际</span></td></tr>';
    Check[0].isAugPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">08月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">08月计划</span></td>';
    Check[0].isAugReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">08月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isAugReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">08月实际</span></td>';
    Check[0].kisAugPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAugPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">08月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAugPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">08月计划</span></td>';
    Check[0].kisAugReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAugReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">08月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisAugReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">08月实际</span></td></tr>';
    Check[0].isSepPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">09月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">09月计划</span></td>';
    Check[0].isSepReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">09月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isSepReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">09月实际</span></td>';
    Check[0].kisSepPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisSepPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">09月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisSepPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">09月计划</span></td>';
    Check[0].kisSepReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisSepReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">09月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisSepReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">09月实际</span></td></tr>';
    Check[0].isOctPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">10月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">10月计划</span></td>';
    Check[0].isOctReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">10月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isOctReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">10月实际</span></td>';
    Check[0].kisOctPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisOctPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">10月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisOctPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">10月计划</span></td>';
    Check[0].kisOctReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisOctReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">10月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisOctReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">10月实际</span></td></tr>';
    Check[0].isNovPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">11月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">11月计划</span></td>';
    Check[0].isNovReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">11月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isNovReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">11月实际</span></td>';
    Check[0].kisNovPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisNovPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">11月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisNovPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">11月计划</span></td>';
    Check[0].kisNovReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisNovReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">11月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisNovReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">11月实际</span></td></tr>';
    Check[0].isDecPlan == "1" ? strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">12月计划</span></td>' : strHtml += '<tr><td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">12月计划</span></td>';
    Check[0].isDecReal == "1" ? strHtml += ' <td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">12月实际</span></td>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="isDecReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">12月实际</span></td>';
    Check[0].kisDecPlan == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisDecPlan" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">12月计划</span></td>' : strHtml += '<td  class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisDecPlan" type="checkbox" /><span style="color:Blue;font-size: 12px;">12月计划</span></td>';
    Check[0].kisDecReal == "1" ? strHtml += '<td     class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisDecReal" type="checkbox" checked="checked" /><span style="color:Blue;font-size: 12px;">12月实际</span></td></tr>' : strHtml += '<td class="td2"><img alt="" src="../../images/Index/icon_dh.gif" /><input id="kisDecReal" type="checkbox" /><span style="color:Blue;font-size: 12px;">12月实际</span></td></tr>';
    strHtml += '</tbody></table>';
    document.getElementById("divDetail").innerHTML = strHtml;
    popDiv("divAdd");
}
function SaveShow() {
    if (isTwo == 1) {
        SaveShowTwoYear()
    }
    else {
        SaveShowOneYear()
    }
}
function SaveShowOneYear() {
    var isJanPlan = 0;
    var isJanReal = 0;
    var isFebPlan = 0;
    var isFebReal = 0;
    var isMarPlan = 0;
    var isMarReal = 0;
    var isAprPlan = 0;
    var isAprReal = 0;
    var isMayPlan = 0;
    var isMayReal = 0;
    var isJunPlan = 0;
    var isJunReal = 0;
    var isJulPlan = 0;
    var isJulReal = 0;
    var isAugPlan = 0;
    var isAugReal = 0;
    var isSepPlan = 0;
    var isSepReal = 0;
    var isOctPlan = 0;
    var isOctReal = 0;
    var isNovPlan = 0;
    var isNovReal = 0;
    var isDecPlan = 0;
    var isDecReal = 0;
    isJanPlan = document.getElementById("isJanPlan").checked == true ? 1 : 0;
    isJanReal = document.getElementById("isJanReal").checked == true ? 1 : 0;
    isFebPlan = document.getElementById("isFebPlan").checked == true ? 1 : 0;
    isFebReal = document.getElementById("isFebReal").checked == true ? 1 : 0;
    isMarPlan = document.getElementById("isMarPlan").checked == true ? 1 : 0;
    isMarReal = document.getElementById("isMarReal").checked == true ? 1 : 0;
    isAprPlan = document.getElementById("isAprPlan").checked == true ? 1 : 0;
    isAprReal = document.getElementById("isAprReal").checked == true ? 1 : 0;
    isMayPlan = document.getElementById("isMayPlan").checked == true ? 1 : 0;
    isMayReal = document.getElementById("isMayReal").checked == true ? 1 : 0;
    isJunPlan = document.getElementById("isJunPlan").checked == true ? 1 : 0;
    isJunReal = document.getElementById("isJunReal").checked == true ? 1 : 0;
    isJulPlan = document.getElementById("isJulPlan").checked == true ? 1 : 0;
    isJulReal = document.getElementById("isJulReal").checked == true ? 1 : 0;
    isAugPlan = document.getElementById("isAugPlan").checked == true ? 1 : 0;
    isAugReal = document.getElementById("isAugReal").checked == true ? 1 : 0;
    isSepPlan = document.getElementById("isSepPlan").checked == true ? 1 : 0;
    isSepReal = document.getElementById("isSepReal").checked == true ? 1 : 0;
    isOctPlan = document.getElementById("isOctPlan").checked == true ? 1 : 0;
    isOctReal = document.getElementById("isOctReal").checked == true ? 1 : 0;
    isNovPlan = document.getElementById("isNovPlan").checked == true ? 1 : 0;
    isNovReal = document.getElementById("isNovReal").checked == true ? 1 : 0;
    isDecPlan = document.getElementById("isDecPlan").checked == true ? 1 : 0;
    isDecReal = document.getElementById("isDecReal").checked == true ? 1 : 0;
    var Str = "?act=salebudgetshowoneyear&isJanPlan=" + isJanPlan +
                                         "&isJanReal=" + isJanReal +
                                         "&isFebPlan=" + isFebPlan +
                                         "&isFebReal=" + isFebReal +
                                         "&isMarPlan=" + isMarPlan +
                                         "&isMarReal=" + isMarReal +
                                         "&isAprPlan=" + isAprPlan +
                                         "&isAprReal=" + isAprReal +
                                         "&isMayPlan=" + isMayPlan +
                                         "&isMayReal=" + isMayReal +
                                         "&isJunPlan=" + isJunPlan +
                                         "&isJunReal=" + isJunReal +
                                         "&isJulPlan=" + isJulPlan +
                                         "&isJulReal=" + isJulReal +
                                         "&isAugPlan=" + isAugPlan +
                                         "&isAugReal=" + isAugReal +
                                         "&isSepPlan=" + isSepPlan +
                                         "&isSepReal=" + isSepReal +
                                         "&isOctPlan=" + isOctPlan +
                                         "&isOctReal=" + isOctReal +
                                         "&isNovPlan=" + isNovPlan +
                                         "&isNovReal=" + isNovReal +
                                         "&isDecPlan=" + isDecPlan +
                                         "&isDecReal=" + isDecReal +"&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
    nmEntity.PostStringInfo(Str, this, this.SetInfoCallBack);
}
function SaveShowTwoYear() {
    var isJanPlan = 0;
    var isJanReal = 0;
    var isFebPlan = 0;
    var isFebReal = 0;
    var isMarPlan = 0;
    var isMarReal = 0;
    var isAprPlan = 0;
    var isAprReal = 0;
    var isMayPlan = 0;
    var isMayReal = 0;
    var isJunPlan = 0;
    var isJunReal = 0;
    var isJulPlan = 0;
    var isJulReal = 0;
    var isAugPlan = 0;
    var isAugReal = 0;
    var isSepPlan = 0;
    var isSepReal = 0;
    var isOctPlan = 0;
    var isOctReal = 0;
    var isNovPlan = 0;
    var isNovReal = 0;
    var isDecPlan = 0;
    var isDecReal = 0;
    var kisJanPlan = 0;
    var kisJanReal = 0;
    var kisFebPlan = 0;
    var kisFebReal = 0;
    var kisMarPlan = 0;
    var kisMarReal = 0;
    var kisAprPlan = 0;
    var kisAprReal = 0;
    var kisMayPlan = 0;
    var kisMayReal = 0;
    var kisJunPlan = 0;
    var kisJunReal = 0;
    var kisJulPlan = 0;
    var kisJulReal = 0;
    var kisAugPlan = 0;
    var kisAugReal = 0;
    var kisSepPlan = 0;
    var kisSepReal = 0;
    var kisOctPlan = 0;
    var kisOctReal = 0;
    var kisNovPlan = 0;
    var kisNovReal = 0;
    var kisDecPlan = 0;
    var kisDecReal = 0;
    isJanPlan = document.getElementById("isJanPlan").checked == true ? 1 : 0;
    isJanReal = document.getElementById("isJanReal").checked == true ? 1 : 0;
    isFebPlan = document.getElementById("isFebPlan").checked == true ? 1 : 0;
    isFebReal = document.getElementById("isFebReal").checked == true ? 1 : 0;
    isMarPlan = document.getElementById("isMarPlan").checked == true ? 1 : 0;
    isMarReal = document.getElementById("isMarReal").checked == true ? 1 : 0;
    isAprPlan = document.getElementById("isAprPlan").checked == true ? 1 : 0;
    isAprReal = document.getElementById("isAprReal").checked == true ? 1 : 0;
    isMayPlan = document.getElementById("isMayPlan").checked == true ? 1 : 0;
    isMayReal = document.getElementById("isMayReal").checked == true ? 1 : 0;
    isJunPlan = document.getElementById("isJunPlan").checked == true ? 1 : 0;
    isJunReal = document.getElementById("isJunReal").checked == true ? 1 : 0;
    isJulPlan = document.getElementById("isJulPlan").checked == true ? 1 : 0;
    isJulReal = document.getElementById("isJulReal").checked == true ? 1 : 0;
    isAugPlan = document.getElementById("isAugPlan").checked == true ? 1 : 0;
    isAugReal = document.getElementById("isAugReal").checked == true ? 1 : 0;
    isSepPlan = document.getElementById("isSepPlan").checked == true ? 1 : 0;
    isSepReal = document.getElementById("isSepReal").checked == true ? 1 : 0;
    isOctPlan = document.getElementById("isOctPlan").checked == true ? 1 : 0;
    isOctReal = document.getElementById("isOctReal").checked == true ? 1 : 0;
    isNovPlan = document.getElementById("isNovPlan").checked == true ? 1 : 0;
    isNovReal = document.getElementById("isNovReal").checked == true ? 1 : 0;
    isDecPlan = document.getElementById("isDecPlan").checked == true ? 1 : 0;
    isDecReal = document.getElementById("isDecReal").checked == true ? 1 : 0;
    kisJanPlan = document.getElementById("kisJanPlan").checked == true ? 1 : 0;
    kisJanReal = document.getElementById("kisJanReal").checked == true ? 1 : 0;
    kisFebPlan = document.getElementById("kisFebPlan").checked == true ? 1 : 0;
    kisFebReal = document.getElementById("kisFebReal").checked == true ? 1 : 0;
    kisMarPlan = document.getElementById("kisMarPlan").checked == true ? 1 : 0;
    kisMarReal = document.getElementById("kisMarReal").checked == true ? 1 : 0;
    kisAprPlan = document.getElementById("kisAprPlan").checked == true ? 1 : 0;
    kisAprReal = document.getElementById("kisAprReal").checked == true ? 1 : 0;
    kisMayPlan = document.getElementById("kisMayPlan").checked == true ? 1 : 0;
    kisMayReal = document.getElementById("kisMayReal").checked == true ? 1 : 0;
    kisJunPlan = document.getElementById("kisJunPlan").checked == true ? 1 : 0;
    kisJunReal = document.getElementById("kisJunReal").checked == true ? 1 : 0;
    kisJulPlan = document.getElementById("kisJulPlan").checked == true ? 1 : 0;
    kisJulReal = document.getElementById("kisJulReal").checked == true ? 1 : 0;
    kisAugPlan = document.getElementById("kisAugPlan").checked == true ? 1 : 0;
    kisAugReal = document.getElementById("kisAugReal").checked == true ? 1 : 0;
    kisSepPlan = document.getElementById("kisSepPlan").checked == true ? 1 : 0;
    kisSepReal = document.getElementById("kisSepReal").checked == true ? 1 : 0;
    kisOctPlan = document.getElementById("kisOctPlan").checked == true ? 1 : 0;
    kisOctReal = document.getElementById("kisOctReal").checked == true ? 1 : 0;
    kisNovPlan = document.getElementById("kisNovPlan").checked == true ? 1 : 0;
    kisNovReal = document.getElementById("kisNovReal").checked == true ? 1 : 0;
    kisDecPlan = document.getElementById("kisDecPlan").checked == true ? 1 : 0;
    kisDecReal = document.getElementById("kisDecReal").checked == true ? 1 : 0;
    var Str = "?act=salebudgetshowtwoyear&isJanPlan=" + isJanPlan +
                                        "&isJanReal=" + isJanReal +
                                        "&isFebPlan=" + isFebPlan +
                                        "&isFebReal=" + isFebReal +
                                        "&isMarPlan=" + isMarPlan +
                                        "&isMarReal=" + isMarReal +
                                        "&isAprPlan=" + isAprPlan +
                                        "&isAprReal=" + isAprReal +
                                        "&isMayPlan=" + isMayPlan +
                                        "&isMayReal=" + isMayReal +
                                        "&isJunPlan=" + isJunPlan +
                                        "&isJunReal=" + isJunReal +
                                        "&isJulPlan=" + isJulPlan +
                                        "&isJulReal=" + isJulReal +
                                        "&isAugPlan=" + isAugPlan +
                                        "&isAugReal=" + isAugReal +
                                        "&isSepPlan=" + isSepPlan +
                                        "&isSepReal=" + isSepReal +
                                        "&isOctPlan=" + isOctPlan +
                                        "&isOctReal=" + isOctReal +
                                        "&isNovPlan=" + isNovPlan +
                                        "&isNovReal=" + isNovReal +
                                        "&isDecPlan=" + isDecPlan +
                                        "&isDecReal=" + isDecReal +
                                        "&kisJanPlan=" + kisJanPlan +
                                        "&kisJanReal=" + kisJanReal +
                                        "&kisFebPlan=" + kisFebPlan +
                                        "&kisFebReal=" + kisFebReal +
                                        "&kisMarPlan=" + kisMarPlan +
                                        "&kisMarReal=" + kisMarReal +
                                        "&kisAprPlan=" + kisAprPlan +
                                        "&kisAprReal=" + kisAprReal +
                                        "&kisMayPlan=" + kisMayPlan +
                                        "&kisMayReal=" + kisMayReal +
                                        "&kisJunPlan=" + kisJunPlan +
                                        "&kisJunReal=" + kisJunReal +
                                        "&kisJulPlan=" + kisJulPlan +
                                        "&kisJulReal=" + kisJulReal +
                                        "&kisAugPlan=" + kisAugPlan +
                                        "&kisAugReal=" + kisAugReal +
                                        "&kisSepPlan=" + kisSepPlan +
                                        "&kisSepReal=" + kisSepReal +
                                        "&kisOctPlan=" + kisOctPlan +
                                        "&kisOctReal=" + kisOctReal +
                                        "&kisNovPlan=" + kisNovPlan +
                                        "&kisNovReal=" + kisNovReal +
                                        "&kisDecPlan=" + kisDecPlan +
                                        "&kisDecReal=" + kisDecReal + "&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
    nmEntity.PostStringInfo(Str, this, this.SetInfoCallBack);
}
function SetInfoCallBack() {
    var xmlHttp = nmEntity.getXmlHttp();
    if (xmlHttp.readyState == 4 || xmlHttp.readyState == 'complete') {
        if (xmlHttp.status == 200) {
            var xmldoc = xmlHttp.responseXML;
            var stateNode = xmldoc.getElementsByTagName("state");
            if (stateNode.length > 0) {
                var state = stateNode[0].firstChild.nodeValue;
                hiddenDiv("divAdd");
                GetInfo();
                window.status = state;
            }
            else {
                alert("保存失败");
            }
        }
        else {
            window.status = '正在写入信息，请稍候...';
        }
    }
}