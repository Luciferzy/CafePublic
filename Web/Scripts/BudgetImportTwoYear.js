function showImportTwoInfo() {
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