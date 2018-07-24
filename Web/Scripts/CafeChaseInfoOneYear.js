function showOneInfo() {
    this.AutoSelectItem("selYearS", Info[0].cYear);
    this.AutoSelectItem("selYearE", Info[0].cYear);
    YearS = Info[0].cYear;
    YearE = Info[0].cYear;
    NowYear = Info[0].NowYear;
    if (Info[0].cYear < Info[0].NowYear) {
        document.getElementById("btnSave").style.display = "none";
//        document.getElementById("btnComit").style.display = "none";
    } else {
        document.getElementById("btnSave").style.display = "";
//        document.getElementById("btnComit").style.display = "";
    }
    var OldYear = parseInt(Info[0].cYear) - 1;
    var strHtml = '<table class="table1"><thead><tr>' +
                  '<th style="width:30px;">月</th>' +
                  '<th style="width:90px;">' + OldYear + '年度</th>' +
                  '<th>截止上月原计划<br />(' + YearS + '年)</th>' +
                  '<th>进度调整<br />(' + YearS + '年)</th>' +
                  '<th style="width:160px;">滚动周年</th>' +
                  '<th>阶段目标</th>' +
                  '<th>按' + YearS + '年度<br />原计划</th>' +
                  '<th>差额</th>' +
                  '<th style="width:50px;"></th>' +
                  '<th>' + YearS + '年度进度<br />调整后</th>' +
                  '<th>差额</th>' +
                  '<th style="width:50px;"></th>' +
                  '<th style="width:150px;">方法、措施</th></tr></thead><tbody>';
    for (var i = 0; i < Info.length; i++) {
        strHtml += '<tr onmouseover="this.style.backgroundColor=\'#D3FF93\';" onmouseout="this.style.backgroundColor=\'#FFFFFF\';">' +
                   '<td name="cTd" style="text-align:center;">' + parseFloat(Info[i].TheMonth, 2) + '</td>';
        if (Info[i].cYear < Info[i].NowYear) {//过去年份变色
            strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
        }
        else if (Info[i].cYear > Info[i].NowYear) {//未到年份不变色
            strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LaAllYear) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                       '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
        }
        else {//当前年份根据月份变色
            strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LaAllYear) + '</td>';
            switch (Info[i].NowMonth) {
                case "1":
                    strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                               '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    break;
                case "2":
                    if (i < 1) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "3":
                    if (i < 2) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "4":
                    if (i < 3) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "5":
                    if (i < 4) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "6":
                    if (i < 5) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "7":
                    if (i < 6) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "8":
                    if (i < 7) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "9":
                    if (i < 8) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "10":
                    if (i < 9) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "11":
                    if (i < 10) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
                case "12":
                    if (i < 11) {
                        strHtml += '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;background-color: #F0F0F0;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    } else {
                        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].LastMonthPlan) + '</td>' +
                                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjust) + '</td>';
                    }
                    break;
            }
        }
        strHtml += '<td>' + Info[i].RollYear + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].StageGoal) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].OriPlan) + '</td>' +
                   '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Balance1) + '</td>';
        if (Info[i].BType1 == "1") {
            strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
        }
        else if (Info[i].BType1 == "2") {
            strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
        } else {
            strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
        }
        strHtml += '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Adjusted) + '</td>' +
                           '<td name="cTd" style="text-align:right;">' + txtOnblur(Info[i].Balance2) + '</td>';
        if (Info[i].BType2 == "1") {
            strHtml += '<td><img src="../../images/x.jpg" width="20" height="20" /></td>';
        }
        else if (Info[i].BType2 == "2") {
            strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /></td>';
        } else {
            strHtml += '<td><img src="../../images/k.jpg" width="20" height="20" /><img src="../../images/k.jpg" width="20" height="20" /></td>';
        }
        strHtml += '<td><input style="width:95%;" id="Measure' + i + '" value="' + Info[i].Measure + '"/></td></tr>';
    }
    var sum1 = parseFloat(parseFloat(Info[0].cYear_Target) - parseFloat(Info[0].sum1));
    var sum2 = parseFloat(parseFloat(Info[0].sum2) - parseFloat(Info[0].cYear_Target));
    var sum3 = parseFloat(parseFloat(Info[0].sum3) - parseFloat(Info[0].cYear_Target));

    strHtml += '<tr><td>合计</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(Info[0].sum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
    if (Info[0].cYear < Info[0].NowYear) {
        strHtml += '<tr><td>' + YearS + '目标</td><td style="text-align:right;">' + txtOnblur(Info[0].cYear_Target) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
    }
    else {
        strHtml += '<tr><td>' + YearS + '目标</td><td style="text-align:right;"><input name="iTd"  onblur="this.value=txtOnblur(this.value)" onfocus="this.value=txtOnfocus(this.value)" style="width:95%;height:25px;text-align:right;" id="cYear_Target" value="' + txtOnblur(Info[0].cYear_Target) + '" /></td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
    }
    strHtml += '<tr><td>差额</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum1) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum2) + '</td><td name="cTd" style="text-align:right;">' + txtOnblur(sum3) + '</td><td style="border-width: 0px;" colspan="9"></td></tr>';
    strHtml += '<tr><td>每月<br />额度</td><td name="cTd" style="text-align:right;">' + txtOnblur(parseFloat(sum1 / 12).toFixed(0)) + '</td><td></td><td></td><td style="border-width: 0px;" colspan="9"></td></tr>';
    strHtml += '</tbody></table>';
    document.getElementById("divInfo").innerHTML = strHtml;
    ChangeTd();
    ChangeInput();
}