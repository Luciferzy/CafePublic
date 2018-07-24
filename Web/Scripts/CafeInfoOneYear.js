function showOneInfo() {
    this.AutoSelectItem("selYearS", Info[0].cYear);
    this.AutoSelectItem("selYearE", Info[0].cYear);
    YearS = Info[0].cYear;
    var strHtml = '<table class="table1"><thead><tr>' +
                  '<th style="width:110px;">月份</td>' +
                  '<th id="JanPlan" style="width:90px;">' + YearS + '年01月</th>' +
                  '<th id="FebPlan" style="width:90px;">' + YearS + '年02月</th>' +
                  '<th id="MarPlan" style="width:90px;">' + YearS + '年03月</th>' +
                  '<th id="AprPlan" style="width:90px;">' + YearS + '年04月</th>' +
                  '<th id="MayPlan" style="width:90px;">' + YearS + '年05月</th>' +
                  '<th id="JunPlan" style="width:90px;">' + YearS + '年06月</th>' +
                  '<th id="JulPlan" style="width:90px;">' + YearS + '年07月</th>' +
                  '<th id="AugPlan" style="width:90px;">' + YearS + '年08月</th>' +
                  '<th id="SepPlan" style="width:90px;">' + YearS + '年09月</th>' +
                  '<th id="OctPlan" style="width:90px;">' + YearS + '年10月</th>' +
                  '<th id="NovPlan" style="width:90px;">' + YearS + '年11月</th>' +
                  '<th id="DecPlan" style="width:90px;">' + YearS + '年12月</th></tr></thead><tbody>';
    for (var i = 0; i < Info.length; i++) {
        if (Info[i].ItemsId == 73 || Info[i].ItemsId == 74 || Info[i].ItemsId == 76) {//合计类不显示输入框
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(Info[i].OctPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(Info[i].NovPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(Info[i].DecPlan) + '</td></tr>';
        } else {
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>';
            switch (Info[i].NowMonth) {
                case "1":
                    strHtml += '<td id="JanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '"/></td>' +
                               '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '"/></td>' +
                               '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "2":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '"/></td>' +
                               '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "3":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "4":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "5":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "6":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '</td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "7":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '</td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "8":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '</td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "9":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '</td>' +
                               '<td id="AugPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '</td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "10":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '</td>' +
                               '<td id="AugPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '</td>' +
                               '<td id="SepPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '</td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "11":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '</td>' +
                               '<td id="AugPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '</td>' +
                               '<td id="SepPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '</td>' +
                               '<td id="OctPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '</td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
                case "12":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '</td>' +
                               '<td id="AugPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '</td>' +
                               '<td id="SepPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '</td>' +
                               '<td id="OctPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '</td>' +
                               '<td id="NovPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '</td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td></tr>';
                    break;
            }
        }
    }
    strHtml += '</tbody></table>';
    document.getElementById("divInfo").innerHTML = strHtml;
    ChangeTd();
    ChangeInput();
    var ddd = 0;
    switch (Info[0].NowMonth) {
        case "2":
            document.getElementById("JanPlan").style.display = "none";
            ddd = parseInt(11 * 90 + 100);
            break;
        case "3":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            ddd = parseInt(10 * 90 + 100);
            break;
        case "4":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            ddd = parseInt(9 * 90 + 100);
            break;
        case "5":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            ddd = parseInt(8 * 90 + 100);
            break;
        case "6":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            ddd = parseInt(7 * 90 + 100);
            break;
        case "7":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            ddd = parseInt(6 * 90 + 100);
            break;
        case "8":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            document.getElementById("JulPlan").style.display = "none";
            ddd = parseInt(5 * 90 + 100);
            break;
        case "9":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            document.getElementById("JulPlan").style.display = "none";
            document.getElementById("AugPlan").style.display = "none";
            ddd = parseInt(4 * 90 + 100);
            break;
        case "10":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            document.getElementById("JulPlan").style.display = "none";
            document.getElementById("AugPlan").style.display = "none";
            document.getElementById("SepPlan").style.display = "none";
            ddd = parseInt(11 * 90 + 100);
            break;
        case "11":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            document.getElementById("JulPlan").style.display = "none";
            document.getElementById("AugPlan").style.display = "none";
            document.getElementById("SepPlan").style.display = "none";
            document.getElementById("OctPlan").style.display = "none";
            ddd = parseInt(3 * 90 + 100);
            break;
        case "12":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            document.getElementById("JulPlan").style.display = "none";
            document.getElementById("AugPlan").style.display = "none";
            document.getElementById("SepPlan").style.display = "none";
            document.getElementById("OctPlan").style.display = "none";
            document.getElementById("NovPlan").style.display = "none";
            ddd = parseInt(2 * 90 + 100);
            break;
    }
    for (var i = 0; i < Info.length; i++) {
        switch (Info[0].NowMonth) {
            case "2":
                document.getElementById("JanPlan" + i).style.display = "none";
                break;
            case "3":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                break;
            case "4":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                break;
            case "5":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                break;
            case "6":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                break;
            case "7":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                break;
            case "8":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                document.getElementById("JulPlan" + i).style.display = "none";
                break;
            case "9":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                document.getElementById("JulPlan" + i).style.display = "none";
                document.getElementById("AugPlan" + i).style.display = "none";
                break;
            case "10":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                document.getElementById("JulPlan" + i).style.display = "none";
                document.getElementById("AugPlan" + i).style.display = "none";
                document.getElementById("SepPlan" + i).style.display = "none";
                break;
            case "11":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                document.getElementById("JulPlan" + i).style.display = "none";
                document.getElementById("AugPlan" + i).style.display = "none";
                document.getElementById("SepPlan" + i).style.display = "none";
                document.getElementById("OctPlan" + i).style.display = "none";
                break;
            case "12":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                document.getElementById("JulPlan" + i).style.display = "none";
                document.getElementById("AugPlan" + i).style.display = "none";
                document.getElementById("SepPlan" + i).style.display = "none";
                document.getElementById("OctPlan" + i).style.display = "none";
                document.getElementById("NovPlan" + i).style.display = "none";
                break;
        }
    }
    document.getElementById("divInfo").style.width = ddd + "px";
}