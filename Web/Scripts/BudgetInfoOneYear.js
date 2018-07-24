function showOneInfo() {
    this.AutoSelectItem("selYearS", Info[0].cYear);
    this.AutoSelectItem("selYearE", Info[0].cYear);
    var st = Info[0].cYear.slice(2, 4);
    YearS = Info[0].cYear;
    YearE = Info[0].cYear;
    var strHtml = '<table class="table1"><thead><tr>' +
                  '<th>序</th>' +
                  '<th style="width:90px;">项目</th>' +
                  '<th style="width:80px;">滚动年</th>' +
                  '<th style="width:80px;">月均值</th>' +
                  '<th style="width:80px;">汇总</th>' +
                  '<th id="JanPlan" style="width:90px;">' + st + '(01)月计划</th>' +
                  '<th id="JanReal" style="width:90px;">' + st + '(01)月实际</th>' +
                  '<th id="FebPlan" style="width:90px;">' + st + '(02)月计划</th>' +
                  '<th id="FebReal" style="width:90px;">' + st + '(02)月实际</th>' +
                  '<th id="MarPlan" style="width:90px;">' + st + '(03)月计划</th>' +
                  '<th id="MarReal" style="width:90px;">' + st + '(03)月实际</th>' +
                  '<th id="AprPlan" style="width:90px;">' + st + '(04)月计划</th>' +
                  '<th id="AprReal" style="width:90px;">' + st + '(04)月实际</th>' +
                  '<th id="MayPlan" style="width:90px;">' + st + '(05)月计划</th>' +
                  '<th id="MayReal" style="width:90px;">' + st + '(05)月实际</th>' +
                  '<th id="JunPlan" style="width:90px;">' + st + '(06)月计划</th>' +
                  '<th id="JunReal" style="width:90px;">' + st + '(06)月实际</th>' +
                  '<th id="JulPlan" style="width:90px;">' + st + '(07)月计划</th>' +
                  '<th id="JulReal" style="width:90px;">' + st + '(07)月实际</th>' +
                  '<th id="AugPlan" style="width:90px;">' + st + '(08)月计划</th>' +
                  '<th id="AugReal" style="width:90px;">' + st + '(08)月实际</th>' +
                  '<th id="SepPlan" style="width:90px;">' + st + '(09)月计划</th>' +
                  '<th id="SepReal" style="width:90px;">' + st + '(09)月实际</th>' +
                  '<th id="OctPlan" style="width:90px;">' + st + '(10)月计划</th>' +
                  '<th id="OctReal" style="width:90px;">' + st + '(10)月实际</th>' +
                  '<th id="NovPlan" style="width:90px;">' + st + '(11)月计划</th>' +
                  '<th id="NovReal" style="width:90px;">' + st + '(11)月实际</th>' +
                  '<th id="DecPlan" style="width:90px;">' + st + '(12)月计划</th>' +
                  '<th id="DecReal" style="width:90px;">' + st + '(12)月实际</th></tr></thead><tbody>';
    for (var i = 0; i < Info.length; i++) {
        if (Info[i].ItemsId == 6 || Info[i].ItemsId == 10 || Info[i].ItemsId == 30 || Info[i].ItemsId == 40 || Info[i].ItemsId == 46 || Info[i].ItemsId == 47
         || Info[i].ItemsId == 48 || Info[i].ItemsId == 50 || Info[i].ItemsId == 51 || Info[i].ItemsId == 52 || Info[i].ItemsId == 53 || Info[i].ItemsId == 54
         || Info[i].ItemsId == 55) {//合计类不显示输入框
            if (Info[i].ItemsId == 6 || Info[i].ItemsId == 10 || Info[i].ItemsId == 30 || Info[i].ItemsId == 40 || Info[i].ItemsId == 46 || Info[i].ItemsId == 47) {//合计类不显示输入框
                strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#96FED1\';" style="background-color:#96FED1;" ">';
            }
            else if (Info[i].ItemsId == 48 || Info[i].ItemsId == 50 || Info[i].ItemsId == 51 || Info[i].ItemsId == 52 || Info[i].ItemsId == 53 || Info[i].ItemsId == 54 || Info[i].ItemsId == 55) {//合计类不显示输入框
                strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'Yellow\';" style="background-color:Yellow;" ">';
            }
            else {
                strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';" ">';
            }
            strHtml += '<td style="text-align:center;">' + Info[i].ItemsId + '</td>' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].RollYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MonthAve).toFixed(2)) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].AllCount) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="SepReal' + i + '">' + txtOnblur(Info[i].SepReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(Info[i].OctPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="OctReal' + i + '">' + txtOnblur(Info[i].OctReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(Info[i].NovPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="NovReal' + i + '">' + txtOnblur(Info[i].NovReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(Info[i].DecPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="DecReal' + i + '">' + txtOnblur(Info[i].DecReal) + '</td></tr>';
        } else {
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';">' +
                       '<td style="text-align:center;">' + Info[i].ItemsId + '</td>' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].RollYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MonthAve).toFixed(2)) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].AllCount) + '</td>';
            if (Info[i].cYear < Info[i].NowYear) {//去年及以前不显示输入框
                strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="SepReal' + i + '">' + txtOnblur(Info[i].SepReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(Info[i].OctPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="OctReal' + i + '">' + txtOnblur(Info[i].OctReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(Info[i].NovPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="NovReal' + i + '">' + txtOnblur(Info[i].NovReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="DecPlan' + i + '">' + txtOnblur(Info[i].DecPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="DecReal' + i + '">' + txtOnblur(Info[i].DecReal) + '</td></tr>';
            }
            if (Info[i].cYear > Info[i].NowYear) {//明天及以后日期全部显示输入框
                strHtml += '<td id="JanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '"/></td>' +
                           '<td id="JanReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanReal).toFixed(2)) + '"/></td>' +
                           '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '"/></td>' +
                           '<td id="FebReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebReal).toFixed(2)) + '"/></td>' +
                           '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '"/></td>' +
                           '<td id="MarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarReal).toFixed(2)) + '"/></td>' +
                           '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                           '<td id="AprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprReal).toFixed(2)) + '"/></td>' +
                           '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                           '<td id="MayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayReal).toFixed(2)) + '"/></td>' +
                           '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                           '<td id="JunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunReal).toFixed(2)) + '"/></td>' +
                           '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                           '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                           '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                           '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                           '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                           '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                           '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                           '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                           '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                           '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                           '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                           '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
            }
            else {//今年已经当前月显示输入框
                switch (Info[i].NowMonth) {
                    case "1":
                        strHtml += '<td id="JanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JanReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJanReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JanReal).toFixed(2)) + '"/></td>' +
                                   '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="FebReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebReal).toFixed(2)) + '"/></td>' +
                                   '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "2":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td id="FebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="FebReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iFebReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].FebReal).toFixed(2)) + '"/></td>' +
                                   '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "3":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td id="MarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MarReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "4":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td id="AprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "5":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td id="MayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="MayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].MayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "6":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                                   '<td id="JunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "7":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                                   '<td id="JulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="JulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].JulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "8":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                                   '<td id="AugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="AugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].AugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "9":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                                   '<td id="SepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="SepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].SepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "10":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="SepReal' + i + '">' + txtOnblur(Info[i].SepReal) + '</td>' +
                                   '<td id="OctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="OctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].OctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "11":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="SepReal' + i + '">' + txtOnblur(Info[i].SepReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(Info[i].OctPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="OctReal' + i + '">' + txtOnblur(Info[i].OctReal) + '</td>' +
                                   '<td id="NovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="NovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].NovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "12":
                        strHtml += '<td name="cTd" style="text-align:right;" id="JanPlan' + i + '">' + txtOnblur(Info[i].JanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JanReal' + i + '">' + txtOnblur(Info[i].JanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebPlan' + i + '">' + txtOnblur(Info[i].FebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="FebReal' + i + '">' + txtOnblur(Info[i].FebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarPlan' + i + '">' + txtOnblur(Info[i].MarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MarReal' + i + '">' + txtOnblur(Info[i].MarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprPlan' + i + '">' + txtOnblur(Info[i].AprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AprReal' + i + '">' + txtOnblur(Info[i].AprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayPlan' + i + '">' + txtOnblur(Info[i].MayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="MayReal' + i + '">' + txtOnblur(Info[i].MayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunPlan' + i + '">' + txtOnblur(Info[i].JunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JunReal' + i + '">' + txtOnblur(Info[i].JunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulPlan' + i + '">' + txtOnblur(Info[i].JulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="JulReal' + i + '">' + txtOnblur(Info[i].JulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugPlan' + i + '">' + txtOnblur(Info[i].AugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="AugReal' + i + '">' + txtOnblur(Info[i].AugReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="SepPlan' + i + '">' + txtOnblur(Info[i].SepPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="SepReal' + i + '">' + txtOnblur(Info[i].SepReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="OctPlan' + i + '">' + txtOnblur(Info[i].OctPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="OctReal' + i + '">' + txtOnblur(Info[i].OctReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="NovPlan' + i + '">' + txtOnblur(Info[i].NovPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="NovReal' + i + '">' + txtOnblur(Info[i].NovReal) + '</td>' +
                                   '<td id="DecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                }
            }
        }
    }
    strHtml += '<tr>' +
               '<th>序</th>' +
               '<th>项目</th>' +
               '<th>滚动年</th>' +
               '<th>月均值</th>' +
               '<th>汇总</th>' +
               '<th id="vJanPlan">' + st + '(01)月计划</th>' +
               '<th id="vJanReal">' + st + '(01)月实际</th>' +
               '<th id="vFebPlan">' + st + '(02)月计划</th>' +
               '<th id="vFebReal">' + st + '(02)月实际</th>' +
               '<th id="vMarPlan">' + st + '(03)月计划</th>' +
               '<th id="vMarReal">' + st + '(03)月实际</th>' +
               '<th id="vAprPlan">' + st + '(04)月计划</th>' +
               '<th id="vAprReal">' + st + '(04)月实际</th>' +
               '<th id="vMayPlan">' + st + '(05)月计划</th>' +
               '<th id="vMayReal">' + st + '(05)月实际</th>' +
               '<th id="vJunPlan">' + st + '(06)月计划</th>' +
               '<th id="vJunReal">' + st + '(06)月实际</th>' +
               '<th id="vJulPlan">' + st + '(07)月计划</th>' +
               '<th id="vJulReal">' + st + '(07)月实际</th>' +
               '<th id="vAugPlan">' + st + '(08)月计划</th>' +
               '<th id="vAugReal">' + st + '(08)月实际</th>' +
               '<th id="vSepPlan">' + st + '(09)月计划</th>' +
               '<th id="vSepReal">' + st + '(09)月实际</th>' +
               '<th id="vOctPlan">' + st + '(10)月计划</th>' +
               '<th id="vOctReal">' + st + '(10)月实际</th>' +
               '<th id="vNovPlan">' + st + '(11)月计划</th>' +
               '<th id="vNovReal">' + st + '(11)月实际</th>' +
               '<th id="vDecPlan">' + st + '(12)月计划</th>' +
               '<th id="vDecReal">' + st + '(12)月实际</th></tr>';
    strHtml += '</tbody></table>';
    document.getElementById("divInfo").innerHTML = strHtml;
    ChangeTd();
    ChangeInput();
    var ddd = parseInt(parseInt(Info[0].isCount) * 90 + 350);
    document.getElementById("divInfo").style.width = ddd + "px";
    document.getElementById("JanPlan").style.display = Info[0].isJanPlan == 1 ? "" : "none";
    document.getElementById("JanReal").style.display = Info[0].isJanReal == 1 ? "" : "none";
    document.getElementById("FebPlan").style.display = Info[0].isFebPlan == 1 ? "" : "none";
    document.getElementById("FebReal").style.display = Info[0].isFebReal == 1 ? "" : "none";
    document.getElementById("MarPlan").style.display = Info[0].isMarPlan == 1 ? "" : "none";
    document.getElementById("MarReal").style.display = Info[0].isMarReal == 1 ? "" : "none";
    document.getElementById("AprPlan").style.display = Info[0].isAprPlan == 1 ? "" : "none";
    document.getElementById("AprReal").style.display = Info[0].isAprReal == 1 ? "" : "none";
    document.getElementById("MayPlan").style.display = Info[0].isMayPlan == 1 ? "" : "none";
    document.getElementById("MayReal").style.display = Info[0].isMayReal == 1 ? "" : "none";
    document.getElementById("JunPlan").style.display = Info[0].isJunPlan == 1 ? "" : "none";
    document.getElementById("JunReal").style.display = Info[0].isJunReal == 1 ? "" : "none";
    document.getElementById("JulPlan").style.display = Info[0].isJulPlan == 1 ? "" : "none";
    document.getElementById("JulReal").style.display = Info[0].isJulReal == 1 ? "" : "none";
    document.getElementById("AugPlan").style.display = Info[0].isAugPlan == 1 ? "" : "none";
    document.getElementById("AugReal").style.display = Info[0].isAugReal == 1 ? "" : "none";
    document.getElementById("SepPlan").style.display = Info[0].isSepPlan == 1 ? "" : "none";
    document.getElementById("SepReal").style.display = Info[0].isSepReal == 1 ? "" : "none";
    document.getElementById("OctPlan").style.display = Info[0].isOctPlan == 1 ? "" : "none";
    document.getElementById("OctReal").style.display = Info[0].isOctReal == 1 ? "" : "none";
    document.getElementById("NovPlan").style.display = Info[0].isNovPlan == 1 ? "" : "none";
    document.getElementById("NovReal").style.display = Info[0].isNovReal == 1 ? "" : "none";
    document.getElementById("DecPlan").style.display = Info[0].isDecPlan == 1 ? "" : "none";
    document.getElementById("DecReal").style.display = Info[0].isDecReal == 1 ? "" : "none";

    document.getElementById("vJanPlan").style.display = Info[0].isJanPlan == 1 ? "" : "none";
    document.getElementById("vJanReal").style.display = Info[0].isJanReal == 1 ? "" : "none";
    document.getElementById("vFebPlan").style.display = Info[0].isFebPlan == 1 ? "" : "none";
    document.getElementById("vFebReal").style.display = Info[0].isFebReal == 1 ? "" : "none";
    document.getElementById("vMarPlan").style.display = Info[0].isMarPlan == 1 ? "" : "none";
    document.getElementById("vMarReal").style.display = Info[0].isMarReal == 1 ? "" : "none";
    document.getElementById("vAprPlan").style.display = Info[0].isAprPlan == 1 ? "" : "none";
    document.getElementById("vAprReal").style.display = Info[0].isAprReal == 1 ? "" : "none";
    document.getElementById("vMayPlan").style.display = Info[0].isMayPlan == 1 ? "" : "none";
    document.getElementById("vMayReal").style.display = Info[0].isMayReal == 1 ? "" : "none";
    document.getElementById("vJunPlan").style.display = Info[0].isJunPlan == 1 ? "" : "none";
    document.getElementById("vJunReal").style.display = Info[0].isJunReal == 1 ? "" : "none";
    document.getElementById("vJulPlan").style.display = Info[0].isJulPlan == 1 ? "" : "none";
    document.getElementById("vJulReal").style.display = Info[0].isJulReal == 1 ? "" : "none";
    document.getElementById("vAugPlan").style.display = Info[0].isAugPlan == 1 ? "" : "none";
    document.getElementById("vAugReal").style.display = Info[0].isAugReal == 1 ? "" : "none";
    document.getElementById("vSepPlan").style.display = Info[0].isSepPlan == 1 ? "" : "none";
    document.getElementById("vSepReal").style.display = Info[0].isSepReal == 1 ? "" : "none";
    document.getElementById("vOctPlan").style.display = Info[0].isOctPlan == 1 ? "" : "none";
    document.getElementById("vOctReal").style.display = Info[0].isOctReal == 1 ? "" : "none";
    document.getElementById("vNovPlan").style.display = Info[0].isNovPlan == 1 ? "" : "none";
    document.getElementById("vNovReal").style.display = Info[0].isNovReal == 1 ? "" : "none";
    document.getElementById("vDecPlan").style.display = Info[0].isDecPlan == 1 ? "" : "none";
    document.getElementById("vDecReal").style.display = Info[0].isDecReal == 1 ? "" : "none";
    for (var i = 0; i < Info.length; i++) {
        document.getElementById("JanPlan" + i).style.display = Info[i].isJanPlan == 1 ? "" : "none";
        document.getElementById("JanReal" + i).style.display = Info[i].isJanReal == 1 ? "" : "none";
        document.getElementById("FebPlan" + i).style.display = Info[i].isFebPlan == 1 ? "" : "none";
        document.getElementById("FebReal" + i).style.display = Info[i].isFebReal == 1 ? "" : "none";
        document.getElementById("MarPlan" + i).style.display = Info[i].isMarPlan == 1 ? "" : "none";
        document.getElementById("MarReal" + i).style.display = Info[i].isMarReal == 1 ? "" : "none";
        document.getElementById("AprPlan" + i).style.display = Info[i].isAprPlan == 1 ? "" : "none";
        document.getElementById("AprReal" + i).style.display = Info[i].isAprReal == 1 ? "" : "none";
        document.getElementById("MayPlan" + i).style.display = Info[i].isMayPlan == 1 ? "" : "none";
        document.getElementById("MayReal" + i).style.display = Info[i].isMayReal == 1 ? "" : "none";
        document.getElementById("JunPlan" + i).style.display = Info[i].isJunPlan == 1 ? "" : "none";
        document.getElementById("JunReal" + i).style.display = Info[i].isJunReal == 1 ? "" : "none";
        document.getElementById("JulPlan" + i).style.display = Info[i].isJulPlan == 1 ? "" : "none";
        document.getElementById("JulReal" + i).style.display = Info[i].isJulReal == 1 ? "" : "none";
        document.getElementById("AugPlan" + i).style.display = Info[i].isAugPlan == 1 ? "" : "none";
        document.getElementById("AugReal" + i).style.display = Info[i].isAugReal == 1 ? "" : "none";
        document.getElementById("SepPlan" + i).style.display = Info[i].isSepPlan == 1 ? "" : "none";
        document.getElementById("SepReal" + i).style.display = Info[i].isSepReal == 1 ? "" : "none";
        document.getElementById("OctPlan" + i).style.display = Info[i].isOctPlan == 1 ? "" : "none";
        document.getElementById("OctReal" + i).style.display = Info[i].isOctReal == 1 ? "" : "none";
        document.getElementById("NovPlan" + i).style.display = Info[i].isNovPlan == 1 ? "" : "none";
        document.getElementById("NovReal" + i).style.display = Info[i].isNovReal == 1 ? "" : "none";
        document.getElementById("DecPlan" + i).style.display = Info[i].isDecPlan == 1 ? "" : "none";
        document.getElementById("DecReal" + i).style.display = Info[i].isDecReal == 1 ? "" : "none";
    }
}