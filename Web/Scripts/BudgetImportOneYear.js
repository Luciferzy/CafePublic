﻿function showImportOneInfo() {
    this.AutoSelectItem("selYearS", Info[0].cYear);
    this.AutoSelectItem("selYearE", Info[0].cYear);
    var st = Info[0].cYear.slice(2, 4);
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
                  '<td id="DecReal" style="width:90px;">' + st + '(12)月实际</td></tr></thead><tbody>';
    for (var i = 0; i < Info.length; i++) {
        if (Info[i].ItemsId == 6 || Info[i].ItemsId == 10 || Info[i].ItemsId == 30 || Info[i].ItemsId == 40 || Info[i].ItemsId == 46 || Info[i].ItemsId == 47 || Info[i].ItemsId == 48) {//合计类不显示输入框
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#FFFFFF\';" onmouseout="this.style.backgroundColor=\'#D3FF93\';" style="background-color:#D3FF93;">';
        }
        else {
            strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';">';
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
               '<td id="vDecReal">' + st + '(12)月实际</td></tr>';
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