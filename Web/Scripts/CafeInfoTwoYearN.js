function showTwoInfo() {
    YearS = Info[0].cYear;
    YearE = Info[0].kcYear;
    var strHtml = '<table class="table1" id="table1"><tr>' +
                  '<td style="width:120px;">月份</td>' +
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
                  '</tr>';
    for (var i = 0; i < Info.length; i++) {
        if (Info[i].ItemsId == 73 || Info[i].ItemsId == 74) {//合计类不显示输入框
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(0)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(0)) + '</td>' +
                       '</tr>';
        }
        else if (Info[i].ItemsId == 76) {//合计类不显示输入框
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(1)) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(1)) + '</td>' +
                       '</tr>';
        } 
        else if (Info[i].cYear > Info[i].NowYear) {
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td id="JanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '"/></td>' +
                       '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '"/></td>' +
                       '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '"/></td>' +
                       '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '"/></td>' +
                       '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '"/></td>' +
                       '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                       '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                       '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                       '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                       '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                       '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                       '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kJanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(0)) + '"/></td>' +
                       '</tr>';
        }
        else {
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>';
            switch (Info[i].NowMonth) {
                case "1":
                    strHtml += '<td id="JanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '"/></td>' +
                               '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "2":
                    strHtml += '<td id="JanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '"/></td>' +
                               '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "3":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "4":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "5":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '"/></td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "6":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                               '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "7":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                               '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '"/></td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "8":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                               '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '"/></td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "9":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '</td>' +
                               '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '"/></td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "10":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '</td>' +
                               '<td id="AugPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '</td>' +
                               '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '"/></td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "11":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '</td>' +
                               '<td id="AugPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '</td>' +
                               '<td id="SepPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '</td>' +
                               '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '"/></td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
                case "12":
                    strHtml += '<td id="JanPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(0)) + '</td>' +
                               '<td id="FebPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(0)) + '</td>' +
                               '<td id="MarPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(0)) + '</td>' +
                               '<td id="AprPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(0)) + '</td>' +
                               '<td id="MayPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(0)) + '</td>' +
                               '<td id="JunPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(0)) + '</td>' +
                               '<td id="JulPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(0)) + '</td>' +
                               '<td id="AugPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(0)) + '</td>' +
                               '<td id="SepPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(0)) + '</td>' +
                               '<td id="OctPlan' + i + '" name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(0)) + '</td>' +
                               '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(0)) + '"/></td>' +
                               '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(0)) + '"/></td>';
                    break;
            }
            strHtml += '<td id="kJanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(0)) + '"/></td>' +
                       '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(0)) + '"/></td>' +
                       '</tr>';
        }

    }
    strHtml += '</table>';
    document.getElementById("divInfo").innerHTML = strHtml;
    ChangeTd();
    ChangeInput();
    var ddd = 0;
    switch (Info[0].NowMonth) {
        case "3":
            document.getElementById("JanPlan").style.display = "none";
            ddd = parseInt(23 * 90 + 100);
            break;
        case "4":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            ddd = parseInt(22 * 90 + 100);
            break;
        case "5":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            ddd = parseInt(21 * 90 + 100);
            break;
        case "6":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            ddd = parseInt(20 * 90 + 120);
            break;
        case "7":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            ddd = parseInt(19 * 90 + 100);
            break;
        case "8":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            ddd = parseInt(18 * 90 + 100);
            break;
        case "9":
            document.getElementById("JanPlan").style.display = "none";
            document.getElementById("FebPlan").style.display = "none";
            document.getElementById("MarPlan").style.display = "none";
            document.getElementById("AprPlan").style.display = "none";
            document.getElementById("MayPlan").style.display = "none";
            document.getElementById("JunPlan").style.display = "none";
            document.getElementById("JulPlan").style.display = "none";
            ddd = parseInt(17 * 90 + 100);
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
            ddd = parseInt(16 * 90 + 100);
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
            ddd = parseInt(15 * 90 + 100);
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
            ddd = parseInt(14 * 90 + 100);
            break;
    }
    for (var i = 0; i < Info.length; i++) {
        switch (Info[0].NowMonth) {
            case "3":
                document.getElementById("JanPlan" + i).style.display = "none";
                break;
            case "4":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                break;
            case "5":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                break;
            case "6":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                break;
            case "7":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                break;
            case "8":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                break;
            case "9":
                document.getElementById("JanPlan" + i).style.display = "none";
                document.getElementById("FebPlan" + i).style.display = "none";
                document.getElementById("MarPlan" + i).style.display = "none";
                document.getElementById("AprPlan" + i).style.display = "none";
                document.getElementById("MayPlan" + i).style.display = "none";
                document.getElementById("JunPlan" + i).style.display = "none";
                document.getElementById("JulPlan" + i).style.display = "none";
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
                break;
        }
    }
    document.getElementById("divInfo").style.width = ddd + "px";
    var empty = document.getElementById("divInfo").innerHTML;
    if (empty != null) {
        $(function () {
            var table1 = document.getElementById("table1");
            var tableid = table1.id;
            FixTable(tableid, 1, 1445, 600);
        })
    }
}

//锁定表头和列
function FixTable(TableID, FixColumnNumber, width, height) {
    alert(TableID+"+fix");
    //TableID            要锁定的Table的ID
    //FixColumnNumber    要锁定列的个数
    //width              显示的宽度
    //height             显示的高度
   
    if ($("#" + TableID + "_tableLayout").length != 0) {
        $("#" + TableID + "_tableLayout").before($("#" + TableID));
        $("#" + TableID + "_tableLayout").empty();
    }
    else {
        $("#" + TableID).after("<div id='" + TableID + "_tableLayout' style='overflow:hidden;height:" + height + "px; width:" + width + "px;'></div>");
    }
    $('<div id="' + TableID + '_tableFix"></div>'
    + '<div id="' + TableID + '_tableHead"></div>'
    + '<div id="' + TableID + '_tableColumn"></div>'
    + '<div id="' + TableID + '_tableData"></div>').appendTo("#" + TableID + "_tableLayout");
    var oldtable = $("#" + TableID);
    var tableFixClone = oldtable.clone(true);
    tableFixClone.attr("id", TableID + "_tableFixClone");
    $("#" + TableID + "_tableFix").append(tableFixClone);
    var tableHeadClone = oldtable.clone(true);
    tableHeadClone.attr("id", TableID + "_tableHeadClone");
    $("#" + TableID + "_tableHead").append(tableHeadClone);
    var tableColumnClone = oldtable.clone(true);
    tableColumnClone.attr("id", TableID + "_tableColumnClone");
    $("#" + TableID + "_tableColumn").append(tableColumnClone);
    $("#" + TableID + "_tableData").append(oldtable);
    $("#" + TableID + "_tableLayout table").each(function () {
        $(this).css("margin", "0");
    });
    var HeadHeight = $("#" + TableID + "_tableHead tr:first").height();
    //设置两行高度
    HeadHeight *= 1;
    HeadHeight += 12;
    $("#" + TableID + "_tableHead").css("height", HeadHeight);
    $("#" + TableID + "_tableFix").css("height", HeadHeight);
    var ColumnsWidth = 0;
    var ColumnsNumber = 0;
    $("#" + TableID + "_tableColumn tr:last td:lt(" + FixColumnNumber + ")").each(function () {
        ColumnsWidth += $(this).outerWidth(true);
        ColumnsNumber++;
    });
    ColumnsWidth += 1;
    //if ($.browser.msie) {
    //    switch ($.browser.version) {
    //        case "7.0":
    //            if (ColumnsNumber >= 3) ColumnsWidth--;
    //            break;
    //        case "8.0":
    //            if (ColumnsNumber >= 2) ColumnsWidth--;
    //            break;
    //    }
    //}
    $("#" + TableID + "_tableColumn").css("width", ColumnsWidth);
    $("#" + TableID + "_tableFix").css("width", ColumnsWidth);
    $("#" + TableID + "_tableData").scroll(function () {
        $("#" + TableID + "_tableHead").scrollLeft($("#" + TableID + "_tableData").scrollLeft());
        $("#" + TableID + "_tableColumn").scrollTop($("#" + TableID + "_tableData").scrollTop());
    });
    $("#" + TableID + "_tableFix").css({ "overflow": "hidden", "position": "relative", "z-index": "50", "background-color": "Silver" });
    $("#" + TableID + "_tableHead").css({ "overflow": "hidden", "width": width - 17, "position": "relative", "z-index": "45", "background-color": "Silver" });
    $("#" + TableID + "_tableColumn").css({ "overflow": "hidden", "height": height - 17, "position": "relative", "z-index": "40", "background-color": "white" });
    $("#" + TableID + "_tableData").css({ "overflow": "scroll", "width": width, "height": height, "position": "relative", "z-index": "35" });
    if ($("#" + TableID + "_tableHead").width() > $("#" + TableID + "_tableFix table").width()) {
        $("#" + TableID + "_tableHead").css("width", $("#" + TableID + "_tableFix table").width());
        $("#" + TableID + "_tableData").css("width", $("#" + TableID + "_tableFix table").width() + 17);
    }
    if ($("#" + TableID + "_tableColumn").height() > $("#" + TableID + "_tableColumn table").height()) {
        $("#" + TableID + "_tableColumn").css("height", $("#" + TableID + "_tableColumn table").height());
        $("#" + TableID + "_tableData").css("height", $("#" + TableID + "_tableColumn table").height() + 17);
    }
    $("#" + TableID + "_tableFix").offset($("#" + TableID + "_tableLayout").offset());
    $("#" + TableID + "_tableHead").offset($("#" + TableID + "_tableLayout").offset());
    $("#" + TableID + "_tableColumn").offset($("#" + TableID + "_tableLayout").offset());
    $("#" + TableID + "_tableData").offset($("#" + TableID + "_tableLayout").offset());
}


     
