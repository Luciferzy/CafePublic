function showTwoInfo() {
    this.AutoSelectItem("selYearS", Info[0].cYear);
    this.AutoSelectItem("selYearE", Info[0].kcYear);
    YearS = Info[0].cYear;
    YearE = Info[0].kcYear;
    var strHtml = '<table class="table1"><thead><tr>' +
                  '<td style="width:100px;">月份</td>' +
                  '<td id="JanPlan" style="width:90px;">' + YearS + '年01月</td>' +
                  '<td id="FebPlan" style="width:90px;">' + YearS + '年02月</td>' +
                  '<td id="MarPlan" style="width:90px;">' + YearS + '年03月</td>' +
                  '<td id="AprPlan" style="width:90px;">' + YearS + '年04月</td>' +
                  '<td id="MayPlan" style="width:90px;">' + YearS + '年05月</td>' +
                  '<td id="JunPlan" style="width:90px;">' + YearS + '年06月</td>' +
                  '<td id="JulPlan" style="width:90px;">' + YearS + '年07月</td>' +
                  '<td id="AugPlan" style="width:90px;">' + YearS + '年08月</td>' +
                  '<td id="SepPlan" style="width:90px;">' + YearS + '年09月</td>' +
                  '<td id="OctPlan" style="width:90px;">' + YearS + '年10月</td>' +
                  '<td id="NovPlan" style="width:90px;">' + YearS + '年11月</td>' +
                  '<td id="DecPlan" style="width:90px;">' + YearS + '年12月</td>' +
                  '<td id="JanPlan" style="width:90px;">' + YearE + '年01月</td>' +
                  '<td id="FebPlan" style="width:90px;">' + YearE + '年02月</td>' +
                  '<td id="MarPlan" style="width:90px;">' + YearE + '年03月</td>' +
                  '<td id="AprPlan" style="width:90px;">' + YearE + '年04月</td>' +
                  '<td id="MayPlan" style="width:90px;">' + YearE + '年05月</td>' +
                  '<td id="JunPlan" style="width:90px;">' + YearE + '年06月</td>' +
                  '<td id="JulPlan" style="width:90px;">' + YearE + '年07月</td>' +
                  '<td id="AugPlan" style="width:90px;">' + YearE + '年08月</td>' +
                  '<td id="SepPlan" style="width:90px;">' + YearE + '年09月</td>' +
                  '<td id="OctPlan" style="width:90px;">' + YearE + '年10月</td>' +
                  '<td id="NovPlan" style="width:90px;">' + YearE + '年11月</td>' +
                  '<td id="DecPlan" style="width:90px;">' + YearE + '年12月</td>' +
                  '</tr></thead><tbody>';
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
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(Info[i].DecPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(Info[i].kSepPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(Info[i].kOctPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(Info[i].kNovPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(Info[i].kDecPlan) + '</td>' +
                       '</tr>';
        } else if (Info[i].cYear > Info[i].NowYear) {
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td id="JanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '"/></td>' +
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
                       '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kJanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                       '</tr>';
        }
        else {
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
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
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>';
                    break;
            }
            strHtml += '<td id="kJanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                       '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                       '</tr>';
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
            ddd = parseInt(23 * 90 + 100);
            break;
        case "3":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            ddd = parseInt(22 * 90 + 100);
            break;
        case "4":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            ddd = parseInt(21 * 90 + 100);
            break;
        case "5":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            ddd = parseInt(20 * 90 + 100);
            break;
        case "6":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            ddd = parseInt(19 * 90 + 100);
            break;
        case "7":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            ddd = parseInt(18 * 90 + 100);
            break;
        case "8":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            document.getElementById("JulPlan").style.display = "none";
            ddd = parseInt(17 * 90 + 100);
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
            ddd = parseInt(16 * 90 + 100);
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
            ddd = parseInt(15 * 90 + 100);
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
            ddd = parseInt(14 * 90 + 100);
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
            ddd = parseInt(13 * 90 + 100);
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