function showTwoInfo() {
    this.AutoSelectItem("selYearS", Info[0].cYear);
    this.AutoSelectItem("selYearE", Info[0].kcYear);
    var st = Info[0].cYear.slice(2, 4)
    var kt = Info[0].kcYear.slice(2, 4)
    var strHtml = '<table class="table1"><thead><tr>' +
                  '<td>序</td>' +
                  '<td style="width:90px;">项目</td>' +
                  '<td style="width:80px;">滚动年</td>' +
                  '<td style="width:80px;">月均值</td>' +
                  '<td style="width:80px;">汇总</td>' +
                  '<td id="JanPlan" style="width:90px;">' + st + '(01)月计划</td>' +
                  '<td id="JanReal" style="width:90px;">' + st + '(01)月实际</td>' +
                  '<td id="FebPlan" style="width:90px;">' + st + '(02)月计划</td>' +
                  '<td id="FebReal" style="width:90px;">' + st + '(02)月实际</td>' +
                  '<td id="MarPlan" style="width:90px;">' + st + '(03)月计划</td>' +
                  '<td id="MarReal" style="width:90px;">' + st + '(03)月实际</td>' +
                  '<td id="AprPlan" style="width:90px;">' + st + '(04)月计划</td>' +
                  '<td id="AprReal" style="width:90px;">' + st + '(04)月实际</td>' +
                  '<td id="MayPlan" style="width:90px;">' + st + '(05)月计划</td>' +
                  '<td id="MayReal" style="width:90px;">' + st + '(05)月实际</td>' +
                  '<td id="JunPlan" style="width:90px;">' + st + '(06)月计划</td>' +
                  '<td id="JunReal" style="width:90px;">' + st + '(06)月实际</td>' +
                  '<td id="JulPlan" style="width:90px;">' + st + '(07)月计划</td>' +
                  '<td id="JulReal" style="width:90px;">' + st + '(07)月实际</td>' +
                  '<td id="AugPlan" style="width:90px;">' + st + '(08)月计划</td>' +
                  '<td id="AugReal" style="width:90px;">' + st + '(08)月实际</td>' +
                  '<td id="SepPlan" style="width:90px;">' + st + '(09)月计划</td>' +
                  '<td id="SepReal" style="width:90px;">' + st + '(09)月实际</td>' +
                  '<td id="OctPlan" style="width:90px;">' + st + '(10)月计划</td>' +
                  '<td id="OctReal" style="width:90px;">' + st + '(10)月实际</td>' +
                  '<td id="NovPlan" style="width:90px;">' + st + '(11)月计划</td>' +
                  '<td id="NovReal" style="width:90px;">' + st + '(11)月实际</td>' +
                  '<td id="DecPlan" style="width:90px;">' + st + '(12)月计划</td>' +
                  '<td id="DecReal" style="width:90px;">' + st + '(12)月实际</td>' +
                  '<td id="kJanPlan" style="width:90px;">' + kt + '(01)月计划</td>' +
                  '<td id="kJanReal" style="width:90px;">' + kt + '(01)月实际</td>' +
                  '<td id="kFebPlan" style="width:90px;">' + kt + '(02)月计划</td>' +
                  '<td id="kFebReal" style="width:90px;">' + kt + '(02)月实际</td>' +
                  '<td id="kMarPlan" style="width:90px;">' + kt + '(03)月计划</td>' +
                  '<td id="kMarReal" style="width:90px;">' + kt + '(03)月实际</td>' +
                  '<td id="kAprPlan" style="width:90px;">' + kt + '(04)月计划</td>' +
                  '<td id="kAprReal" style="width:90px;">' + kt + '(04)月实际</td>' +
                  '<td id="kMayPlan" style="width:90px;">' + kt + '(05)月计划</td>' +
                  '<td id="kMayReal" style="width:90px;">' + kt + '(05)月实际</td>' +
                  '<td id="kJunPlan" style="width:90px;">' + kt + '(06)月计划</td>' +
                  '<td id="kJunReal" style="width:90px;">' + kt + '(06)月实际</td>' +
                  '<td id="kJulPlan" style="width:90px;">' + kt + '(07)月计划</td>' +
                  '<td id="kJulReal" style="width:90px;">' + kt + '(07)月实际</td>' +
                  '<td id="kAugPlan" style="width:90px;">' + kt + '(08)月计划</td>' +
                  '<td id="kAugReal" style="width:90px;">' + kt + '(08)月实际</td>' +
                  '<td id="kSepPlan" style="width:90px;">' + kt + '(09)月计划</td>' +
                  '<td id="kSepReal" style="width:90px;">' + kt + '(09)月实际</td>' +
                  '<td id="kOctPlan" style="width:90px;">' + kt + '(10)月计划</td>' +
                  '<td id="kOctReal" style="width:90px;">' + kt + '(10)月实际</td>' +
                  '<td id="kNovPlan" style="width:90px;">' + kt + '(11)月计划</td>' +
                  '<td id="kNovReal" style="width:90px;">' + kt + '(11)月实际</td>' +
                  '<td id="kDecPlan" style="width:90px;">' + kt + '(12)月计划</td>' +
                  '<td id="kDecReal" style="width:90px;">' + kt + '(12)月实际</td></tr></thead><tbody>';
    for (var i = 0; i < Info.length; i++) {
        if (Info[i].ItemsId == 6 || Info[i].ItemsId == 10 || Info[i].ItemsId == 30 || Info[i].ItemsId == 40 || Info[i].ItemsId == 46 || Info[i].ItemsId == 47
        || Info[i].ItemsId == 48 || Info[i].ItemsId == 50 || Info[i].ItemsId == 51 || Info[i].ItemsId == 52 || Info[i].ItemsId == 53 || Info[i].ItemsId == 54 || Info[i].ItemsId == 55) {//合计类不显示输入框
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#FFFFFF\';" onmouseout="this.style.backgroundColor=\'#D3FF93\';" style="background-color:#D3FF93;">' +
                       '<td style="text-align:center;">' + Info[i].ItemsId + '</td>' +
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
                       '<td name="cTd" style="text-align:right;" id="DecReal' + i + '">' + txtOnblur(Info[i].DecReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kAugReal' + i + '">' + txtOnblur(Info[i].kAugReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(Info[i].kSepPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kSepReal' + i + '">' + txtOnblur(Info[i].kSepReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(Info[i].kOctPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kOctReal' + i + '">' + txtOnblur(Info[i].kOctReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(Info[i].kNovPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kNovReal' + i + '">' + txtOnblur(Info[i].kNovReal) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(Info[i].kDecPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;" id="kDecReal' + i + '">' + txtOnblur(Info[i].kDecReal) + '</td></tr>';
        } else {
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';">' +
                       '<td style="text-align:center;">' + Info[i].ItemsId + '</td>' +
                       '<td style="text-align:right;">' + Info[i].ItemsName + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].RollYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(Info[i].MonthAve).toFixed(2)) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].AllCount) + '</td>';
            if (Info[i].kcYear < Info[i].NowYear) {//第二年小于当年不显示输入框 16-17
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
                           '<td name="cTd" style="text-align:right;" id="DecReal' + i + '">' + txtOnblur(Info[i].DecReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kAugReal' + i + '">' + txtOnblur(Info[i].kAugReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(Info[i].kSepPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kSepReal' + i + '">' + txtOnblur(Info[i].kSepReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(Info[i].kOctPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kOctReal' + i + '">' + txtOnblur(Info[i].kOctReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(Info[i].kNovPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kNovReal' + i + '">' + txtOnblur(Info[i].kNovReal) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kDecPlan' + i + '">' + txtOnblur(Info[i].kDecPlan) + '</td>' +
                           '<td name="cTd" style="text-align:right;" id="kDecReal' + i + '">' + txtOnblur(Info[i].kDecReal) + '</td></tr>';
            }
            else if (Info[i].cYear > Info[i].NowYear) {//第一年大于当年全部显示输入框 19-20
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
                           '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>' +
                           '<td id="kJanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kJanReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanReal).toFixed(2)) + '"/></td>' +
                           '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kFebReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebReal).toFixed(2)) + '"/></td>' +
                           '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kMarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarReal).toFixed(2)) + '"/></td>' +
                           '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kAprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprReal).toFixed(2)) + '"/></td>' +
                           '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kMayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayReal).toFixed(2)) + '"/></td>' +
                           '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                           '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                           '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                           '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                           '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                           '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                           '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
            }
            else if (Info[i].cYear < Info[i].NowYear) {//第一年小于当年，第二年等于当年 17-18
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
                           '<td name="cTd" style="text-align:right;" id="DecReal' + i + '">' + txtOnblur(Info[i].DecReal) + '</td>';
                switch (Info[i].NowMonth) {
                    case "1":
                        strHtml += '<td id="kJanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJanReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kFebReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "2":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kFebReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "3":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "4":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "5":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kMayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "6":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                                   '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "7":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                                   '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "8":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                                   '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "9":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugReal' + i + '">' + txtOnblur(Info[i].kAugReal) + '</td>' +
                                   '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "10":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugReal' + i + '">' + txtOnblur(Info[i].kAugReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(Info[i].kSepPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kSepReal' + i + '">' + txtOnblur(Info[i].kSepReal) + '</td>' +
                                   '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "11":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugReal' + i + '">' + txtOnblur(Info[i].kAugReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(Info[i].kSepPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kSepReal' + i + '">' + txtOnblur(Info[i].kSepReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(Info[i].kOctPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kOctReal' + i + '">' + txtOnblur(Info[i].kOctReal) + '</td>' +
                                   '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                    case "12":
                        strHtml += '<td name="cTd" style="text-align:right;" id="kJanPlan' + i + '">' + txtOnblur(Info[i].kJanPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJanReal' + i + '">' + txtOnblur(Info[i].kJanReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebPlan' + i + '">' + txtOnblur(Info[i].kFebPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kFebReal' + i + '">' + txtOnblur(Info[i].kFebReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarPlan' + i + '">' + txtOnblur(Info[i].kMarPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMarReal' + i + '">' + txtOnblur(Info[i].kMarReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprPlan' + i + '">' + txtOnblur(Info[i].kAprPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAprReal' + i + '">' + txtOnblur(Info[i].kAprReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayPlan' + i + '">' + txtOnblur(Info[i].kMayPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kMayReal' + i + '">' + txtOnblur(Info[i].kMayReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunPlan' + i + '">' + txtOnblur(Info[i].kJunPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJunReal' + i + '">' + txtOnblur(Info[i].kJunReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulPlan' + i + '">' + txtOnblur(Info[i].kJulPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kJulReal' + i + '">' + txtOnblur(Info[i].kJulReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugPlan' + i + '">' + txtOnblur(Info[i].kAugPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kAugReal' + i + '">' + txtOnblur(Info[i].kAugReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kSepPlan' + i + '">' + txtOnblur(Info[i].kSepPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kSepReal' + i + '">' + txtOnblur(Info[i].kSepReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kOctPlan' + i + '">' + txtOnblur(Info[i].kOctPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kOctReal' + i + '">' + txtOnblur(Info[i].kOctReal) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kNovPlan' + i + '">' + txtOnblur(Info[i].kNovPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;" id="kNovReal' + i + '">' + txtOnblur(Info[i].kNovReal) + '</td>' +
                                   '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                                   '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
                        break;
                }
            }
            else {//第一年等于当年，第二年大于当年 18-19
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
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
                                   '<td id="DecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="iDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].DecReal).toFixed(2)) + '"/></td>';
                        break;
                }
                strHtml += '<td id="kJanPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kJanReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJanReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJanReal).toFixed(2)) + '"/></td>' +
                           '<td id="kFebPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kFebReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiFebReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kFebReal).toFixed(2)) + '"/></td>' +
                           '<td id="kMarPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kMarReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMarReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMarReal).toFixed(2)) + '"/></td>' +
                           '<td id="kAprPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kAprReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAprReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAprReal).toFixed(2)) + '"/></td>' +
                           '<td id="kMayPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kMayReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiMayReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kMayReal).toFixed(2)) + '"/></td>' +
                           '<td id="kJunPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kJunReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJunReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJunReal).toFixed(2)) + '"/></td>' +
                           '<td id="kJulPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kJulReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiJulReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kJulReal).toFixed(2)) + '"/></td>' +
                           '<td id="kAugPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kAugReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiAugReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kAugReal).toFixed(2)) + '"/></td>' +
                           '<td id="kSepPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kSepReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiSepReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kSepReal).toFixed(2)) + '"/></td>' +
                           '<td id="kOctPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kOctReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiOctReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kOctReal).toFixed(2)) + '"/></td>' +
                           '<td id="kNovPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kNovReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiNovReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kNovReal).toFixed(2)) + '"/></td>' +
                           '<td id="kDecPlan' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecPlan' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecPlan).toFixed(2)) + '"/></td>' +
                           '<td id="kDecReal' + i + '"><input name="iTd" onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;text-align:right;" id="kiDecReal' + i + '" value="' + txtOnblur(parseFloat(Info[i].kDecReal).toFixed(2)) + '"/></td></tr>';
            }
        }
    }
    strHtml += '<tr>' +
               '<td>序</td>' +
               '<td>项目</td>' +
               '<td>滚动年</td>' +
               '<td>月均值</td>' +
               '<td>汇总</td>' +
               '<td id="vJanPlan">' + st + '(01)月计划</td>' +
               '<td id="vJanReal">' + st + '(01)月实际</td>' +
               '<td id="vFebPlan">' + st + '(02)月计划</td>' +
               '<td id="vFebReal">' + st + '(02)月实际</td>' +
               '<td id="vMarPlan">' + st + '(03)月计划</td>' +
               '<td id="vMarReal">' + st + '(03)月实际</td>' +
               '<td id="vAprPlan">' + st + '(04)月计划</td>' +
               '<td id="vAprReal">' + st + '(04)月实际</td>' +
               '<td id="vMayPlan">' + st + '(05)月计划</td>' +
               '<td id="vMayReal">' + st + '(05)月实际</td>' +
               '<td id="vJunPlan">' + st + '(06)月计划</td>' +
               '<td id="vJunReal">' + st + '(06)月实际</td>' +
               '<td id="vJulPlan">' + st + '(07)月计划</td>' +
               '<td id="vJulReal">' + st + '(07)月实际</td>' +
               '<td id="vAugPlan">' + st + '(08)月计划</td>' +
               '<td id="vAugReal">' + st + '(08)月实际</td>' +
               '<td id="vSepPlan">' + st + '(09)月计划</td>' +
               '<td id="vSepReal">' + st + '(09)月实际</td>' +
               '<td id="vOctPlan">' + st + '(10)月计划</td>' +
               '<td id="vOctReal">' + st + '(10)月实际</td>' +
               '<td id="vNovPlan">' + st + '(11)月计划</td>' +
               '<td id="vNovReal">' + st + '(11)月实际</td>' +
               '<td id="vDecPlan">' + st + '(12)月计划</td>' +
               '<td id="vDecReal">' + st + '(12)月实际</td>' +
               '<td id="kvJanPlan">' + kt + '(01)月计划</td>' +
               '<td id="kvJanReal">' + kt + '(01)月实际</td>' +
               '<td id="kvFebPlan">' + kt + '(02)月计划</td>' +
               '<td id="kvFebReal">' + kt + '(02)月实际</td>' +
               '<td id="kvMarPlan">' + kt + '(03)月计划</td>' +
               '<td id="kvMarReal">' + kt + '(03)月实际</td>' +
               '<td id="kvAprPlan">' + kt + '(04)月计划</td>' +
               '<td id="kvAprReal">' + kt + '(04)月实际</td>' +
               '<td id="kvMayPlan">' + kt + '(05)月计划</td>' +
               '<td id="kvMayReal">' + kt + '(05)月实际</td>' +
               '<td id="kvJunPlan">' + kt + '(06)月计划</td>' +
               '<td id="kvJunReal">' + kt + '(06)月实际</td>' +
               '<td id="kvJulPlan">' + kt + '(07)月计划</td>' +
               '<td id="kvJulReal">' + kt + '(07)月实际</td>' +
               '<td id="kvAugPlan">' + kt + '(08)月计划</td>' +
               '<td id="kvAugReal">' + kt + '(08)月实际</td>' +
               '<td id="kvSepPlan">' + kt + '(09)月计划</td>' +
               '<td id="kvSepReal">' + kt + '(09)月实际</td>' +
               '<td id="kvOctPlan">' + kt + '(10)月计划</td>' +
               '<td id="kvOctReal">' + kt + '(10)月实际</td>' +
               '<td id="kvNovPlan">' + kt + '(11)月计划</td>' +
               '<td id="kvNovReal">' + kt + '(11)月实际</td>' +
               '<td id="kvDecPlan">' + kt + '(12)月计划</td>' +
               '<td id="kvDecReal">' + kt + '(12)月实际</td></tr>';
    strHtml += '</tbody></table>';
    document.getElementById("divInfo").innerHTML = strHtml;
    ChangeTd();
    ChangeInput();
    var ccc = parseInt(Info[0].isCount) + parseInt(Info[0].kisCount);
    var ddd = parseInt(ccc * 90 + 350);
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
    document.getElementById("kJanPlan").style.display = Info[0].kisJanPlan == 1 ? "" : "none";
    document.getElementById("kJanReal").style.display = Info[0].kisJanReal == 1 ? "" : "none";
    document.getElementById("kFebPlan").style.display = Info[0].kisFebPlan == 1 ? "" : "none";
    document.getElementById("kFebReal").style.display = Info[0].kisFebReal == 1 ? "" : "none";
    document.getElementById("kMarPlan").style.display = Info[0].kisMarPlan == 1 ? "" : "none";
    document.getElementById("kMarReal").style.display = Info[0].kisMarReal == 1 ? "" : "none";
    document.getElementById("kAprPlan").style.display = Info[0].kisAprPlan == 1 ? "" : "none";
    document.getElementById("kAprReal").style.display = Info[0].kisAprReal == 1 ? "" : "none";
    document.getElementById("kMayPlan").style.display = Info[0].kisMayPlan == 1 ? "" : "none";
    document.getElementById("kMayReal").style.display = Info[0].kisMayReal == 1 ? "" : "none";
    document.getElementById("kJunPlan").style.display = Info[0].kisJunPlan == 1 ? "" : "none";
    document.getElementById("kJunReal").style.display = Info[0].kisJunReal == 1 ? "" : "none";
    document.getElementById("kJulPlan").style.display = Info[0].kisJulPlan == 1 ? "" : "none";
    document.getElementById("kJulReal").style.display = Info[0].kisJulReal == 1 ? "" : "none";
    document.getElementById("kAugPlan").style.display = Info[0].kisAugPlan == 1 ? "" : "none";
    document.getElementById("kAugReal").style.display = Info[0].kisAugReal == 1 ? "" : "none";
    document.getElementById("kSepPlan").style.display = Info[0].kisSepPlan == 1 ? "" : "none";
    document.getElementById("kSepReal").style.display = Info[0].kisSepReal == 1 ? "" : "none";
    document.getElementById("kOctPlan").style.display = Info[0].kisOctPlan == 1 ? "" : "none";
    document.getElementById("kOctReal").style.display = Info[0].kisOctReal == 1 ? "" : "none";
    document.getElementById("kNovPlan").style.display = Info[0].kisNovPlan == 1 ? "" : "none";
    document.getElementById("kNovReal").style.display = Info[0].kisNovReal == 1 ? "" : "none";
    document.getElementById("kDecPlan").style.display = Info[0].kisDecPlan == 1 ? "" : "none";
    document.getElementById("kDecReal").style.display = Info[0].kisDecReal == 1 ? "" : "none";

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
    document.getElementById("kvJanPlan").style.display = Info[0].kisJanPlan == 1 ? "" : "none";
    document.getElementById("kvJanReal").style.display = Info[0].kisJanReal == 1 ? "" : "none";
    document.getElementById("kvFebPlan").style.display = Info[0].kisFebPlan == 1 ? "" : "none";
    document.getElementById("kvFebReal").style.display = Info[0].kisFebReal == 1 ? "" : "none";
    document.getElementById("kvMarPlan").style.display = Info[0].kisMarPlan == 1 ? "" : "none";
    document.getElementById("kvMarReal").style.display = Info[0].kisMarReal == 1 ? "" : "none";
    document.getElementById("kvAprPlan").style.display = Info[0].kisAprPlan == 1 ? "" : "none";
    document.getElementById("kvAprReal").style.display = Info[0].kisAprReal == 1 ? "" : "none";
    document.getElementById("kvMayPlan").style.display = Info[0].kisMayPlan == 1 ? "" : "none";
    document.getElementById("kvMayReal").style.display = Info[0].kisMayReal == 1 ? "" : "none";
    document.getElementById("kvJunPlan").style.display = Info[0].kisJunPlan == 1 ? "" : "none";
    document.getElementById("kvJunReal").style.display = Info[0].kisJunReal == 1 ? "" : "none";
    document.getElementById("kvJulPlan").style.display = Info[0].kisJulPlan == 1 ? "" : "none";
    document.getElementById("kvJulReal").style.display = Info[0].kisJulReal == 1 ? "" : "none";
    document.getElementById("kvAugPlan").style.display = Info[0].kisAugPlan == 1 ? "" : "none";
    document.getElementById("kvAugReal").style.display = Info[0].kisAugReal == 1 ? "" : "none";
    document.getElementById("kvSepPlan").style.display = Info[0].kisSepPlan == 1 ? "" : "none";
    document.getElementById("kvSepReal").style.display = Info[0].kisSepReal == 1 ? "" : "none";
    document.getElementById("kvOctPlan").style.display = Info[0].kisOctPlan == 1 ? "" : "none";
    document.getElementById("kvOctReal").style.display = Info[0].kisOctReal == 1 ? "" : "none";
    document.getElementById("kvNovPlan").style.display = Info[0].kisNovPlan == 1 ? "" : "none";
    document.getElementById("kvNovReal").style.display = Info[0].kisNovReal == 1 ? "" : "none";
    document.getElementById("kvDecPlan").style.display = Info[0].kisDecPlan == 1 ? "" : "none";
    document.getElementById("kvDecReal").style.display = Info[0].kisDecReal == 1 ? "" : "none";
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
        document.getElementById("kJanPlan" + i).style.display = Info[i].kisJanPlan == 1 ? "" : "none";
        document.getElementById("kJanReal" + i).style.display = Info[i].kisJanReal == 1 ? "" : "none";
        document.getElementById("kFebPlan" + i).style.display = Info[i].kisFebPlan == 1 ? "" : "none";
        document.getElementById("kFebReal" + i).style.display = Info[i].kisFebReal == 1 ? "" : "none";
        document.getElementById("kMarPlan" + i).style.display = Info[i].kisMarPlan == 1 ? "" : "none";
        document.getElementById("kMarReal" + i).style.display = Info[i].kisMarReal == 1 ? "" : "none";
        document.getElementById("kAprPlan" + i).style.display = Info[i].kisAprPlan == 1 ? "" : "none";
        document.getElementById("kAprReal" + i).style.display = Info[i].kisAprReal == 1 ? "" : "none";
        document.getElementById("kMayPlan" + i).style.display = Info[i].kisMayPlan == 1 ? "" : "none";
        document.getElementById("kMayReal" + i).style.display = Info[i].kisMayReal == 1 ? "" : "none";
        document.getElementById("kJunPlan" + i).style.display = Info[i].kisJunPlan == 1 ? "" : "none";
        document.getElementById("kJunReal" + i).style.display = Info[i].kisJunReal == 1 ? "" : "none";
        document.getElementById("kJulPlan" + i).style.display = Info[i].kisJulPlan == 1 ? "" : "none";
        document.getElementById("kJulReal" + i).style.display = Info[i].kisJulReal == 1 ? "" : "none";
        document.getElementById("kAugPlan" + i).style.display = Info[i].kisAugPlan == 1 ? "" : "none";
        document.getElementById("kAugReal" + i).style.display = Info[i].kisAugReal == 1 ? "" : "none";
        document.getElementById("kSepPlan" + i).style.display = Info[i].kisSepPlan == 1 ? "" : "none";
        document.getElementById("kSepReal" + i).style.display = Info[i].kisSepReal == 1 ? "" : "none";
        document.getElementById("kOctPlan" + i).style.display = Info[i].kisOctPlan == 1 ? "" : "none";
        document.getElementById("kOctReal" + i).style.display = Info[i].kisOctReal == 1 ? "" : "none";
        document.getElementById("kNovPlan" + i).style.display = Info[i].kisNovPlan == 1 ? "" : "none";
        document.getElementById("kNovReal" + i).style.display = Info[i].kisNovReal == 1 ? "" : "none";
        document.getElementById("kDecPlan" + i).style.display = Info[i].kisDecPlan == 1 ? "" : "none";
        document.getElementById("kDecReal" + i).style.display = Info[i].kisDecReal == 1 ? "" : "none";
    }
}