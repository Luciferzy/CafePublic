function SaveInfoOneYear() {
    var iId = "";
    var nJanPlan = "";
    var nJanReal = "";
    var nFebPlan = "";
    var nFebReal = "";
    var nMarPlan = "";
    var nMarReal = "";
    var nAprPlan = "";
    var nAprReal = "";
    var nMayPlan = "";
    var nMayReal = "";
    var nJunPlan = "";
    var nJunReal = "";
    var nJulPlan = "";
    var nJulReal = "";
    var nAugPlan = "";
    var nAugReal = "";
    var nSepPlan = "";
    var nSepReal = "";
    var nOctPlan = "";
    var nOctReal = "";
    var nNovPlan = "";
    var nNovReal = "";
    var nDecPlan = "";
    var nDecReal = "";
    var iJanPlan = "";
    var iJanReal = "";
    var iFebPlan = "";
    var iFebReal = "";
    var iMarPlan = "";
    var iMarReal = "";
    var iAprPlan = "";
    var iAprReal = "";
    var iMayPlan = "";
    var iMayReal = "";
    var iJunPlan = "";
    var iJunReal = "";
    var iJulPlan = "";
    var iJulReal = "";
    var iAugPlan = "";
    var iAugReal = "";
    var iSepPlan = "";
    var iSepReal = "";
    var iOctPlan = "";
    var iOctReal = "";
    var iNovPlan = "";
    var iNovReal = "";
    var iDecPlan = "";
    var iDecReal = "";
    for (var i = 0; i < Info.length; i++) {
        if (Info[i].ItemsId != 6 && Info[i].ItemsId != 10 && Info[i].ItemsId != 30 && Info[i].ItemsId != 40 && Info[i].ItemsId != 46 && Info[i].ItemsId != 47
        && Info[i].ItemsId != 48 && Info[i].ItemsId != 50 && Info[i].ItemsId != 51 && Info[i].ItemsId != 52 && Info[i].ItemsId != 53
        && Info[i].ItemsId != 54 && Info[i].ItemsId != 55) {
            switch (Info[i].NowMonth) {
                case "1":
                    nJanPlan = document.getElementById("iJanPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJanPlan" + i).value);
                    nJanReal = document.getElementById("iJanReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJanReal" + i).value);
                    nFebPlan = document.getElementById("iFebPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iFebPlan" + i).value);
                    nFebReal = document.getElementById("iFebReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iFebReal" + i).value);
                    nMarPlan = document.getElementById("iMarPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarPlan" + i).value);
                    nMarReal = document.getElementById("iMarReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarReal" + i).value);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nAprReal = document.getElementById("iAprReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprReal" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nMayReal = document.getElementById("iMayReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayReal" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJunReal = document.getElementById("iJunReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunReal" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nJulReal = document.getElementById("iJulReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulReal" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "2":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = document.getElementById("iFebPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iFebPlan" + i).value);
                    nFebReal = document.getElementById("iFebReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iFebReal" + i).value);
                    nMarPlan = document.getElementById("iMarPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarPlan" + i).value);
                    nMarReal = document.getElementById("iMarReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarReal" + i).value);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nAprReal = document.getElementById("iAprReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprReal" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nMayReal = document.getElementById("iMayReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayReal" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJunReal = document.getElementById("iJunReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunReal" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nJulReal = document.getElementById("iJulReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulReal" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "3":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = document.getElementById("iMarPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarPlan" + i).value);
                    nMarReal = document.getElementById("iMarReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarReal" + i).value);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nAprReal = document.getElementById("iAprReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprReal" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nMayReal = document.getElementById("iMayReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayReal" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJunReal = document.getElementById("iJunReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunReal" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nJulReal = document.getElementById("iJulReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulReal" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "4":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nAprReal = document.getElementById("iAprReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprReal" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nMayReal = document.getElementById("iMayReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayReal" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJunReal = document.getElementById("iJunReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunReal" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nJulReal = document.getElementById("iJulReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulReal" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "5":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nMayReal = document.getElementById("iMayReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayReal" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJunReal = document.getElementById("iJunReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunReal" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nJulReal = document.getElementById("iJulReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulReal" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "6":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nMayReal = txtOnfocus(document.getElementById("MayReal" + i).innerHTML);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJunReal = document.getElementById("iJunReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunReal" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nJulReal = document.getElementById("iJulReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulReal" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "7":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nMayReal = txtOnfocus(document.getElementById("MayReal" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJunReal = txtOnfocus(document.getElementById("JunReal" + i).innerHTML);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nJulReal = document.getElementById("iJulReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulReal" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "8":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nMayReal = txtOnfocus(document.getElementById("MayReal" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJunReal = txtOnfocus(document.getElementById("JunReal" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nJulReal = txtOnfocus(document.getElementById("JulReal" + i).innerHTML);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nAugReal = document.getElementById("iAugReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugReal" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "9":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nMayReal = txtOnfocus(document.getElementById("MayReal" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJunReal = txtOnfocus(document.getElementById("JunReal" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nJulReal = txtOnfocus(document.getElementById("JulReal" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nAugReal = txtOnfocus(document.getElementById("AugReal" + i).innerHTML);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nSepReal = document.getElementById("iSepReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepReal" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "10":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nMayReal = txtOnfocus(document.getElementById("MayReal" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJunReal = txtOnfocus(document.getElementById("JunReal" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nJulReal = txtOnfocus(document.getElementById("JulReal" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nAugReal = txtOnfocus(document.getElementById("AugReal" + i).innerHTML);
                    nSepPlan = txtOnfocus(document.getElementById("SepPlan" + i).innerHTML);
                    nSepReal = txtOnfocus(document.getElementById("SepReal" + i).innerHTML);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nOctReal = document.getElementById("iOctReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctReal" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "11":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nMayReal = txtOnfocus(document.getElementById("MayReal" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJunReal = txtOnfocus(document.getElementById("JunReal" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nJulReal = txtOnfocus(document.getElementById("JulReal" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nAugReal = txtOnfocus(document.getElementById("AugReal" + i).innerHTML);
                    nSepPlan = txtOnfocus(document.getElementById("SepPlan" + i).innerHTML);
                    nSepReal = txtOnfocus(document.getElementById("SepReal" + i).innerHTML);
                    nOctPlan = txtOnfocus(document.getElementById("OctPlan" + i).innerHTML);
                    nOctReal = txtOnfocus(document.getElementById("OctReal" + i).innerHTML);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nNovReal = document.getElementById("iNovReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovReal" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
                case "11":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nJanReal = txtOnfocus(document.getElementById("JanReal" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nFebReal = txtOnfocus(document.getElementById("FebReal" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nMarReal = txtOnfocus(document.getElementById("MarReal" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nAprReal = txtOnfocus(document.getElementById("AprReal" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nMayReal = txtOnfocus(document.getElementById("MayReal" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJunReal = txtOnfocus(document.getElementById("JunReal" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nJulReal = txtOnfocus(document.getElementById("JulReal" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nAugReal = txtOnfocus(document.getElementById("AugReal" + i).innerHTML);
                    nSepPlan = txtOnfocus(document.getElementById("SepPlan" + i).innerHTML);
                    nSepReal = txtOnfocus(document.getElementById("SepReal" + i).innerHTML);
                    nOctPlan = txtOnfocus(document.getElementById("OctPlan" + i).innerHTML);
                    nOctReal = txtOnfocus(document.getElementById("OctReal" + i).innerHTML);
                    nNovPlan = txtOnfocus(document.getElementById("NovPlan" + i).innerHTML);
                    nNovReal = txtOnfocus(document.getElementById("NovReal" + i).innerHTML);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    nDecReal = document.getElementById("iDecReal" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecReal" + i).value);
                    break;
            }

            iId += Info[i].Id + ";";
            iJanPlan += nJanPlan + ";";
            iJanReal += nJanReal + ";";
            iFebPlan += nFebPlan + ";";
            iFebReal += nFebReal + ";";
            iMarPlan += nMarPlan + ";";
            iMarReal += nMarReal + ";";
            iAprPlan += nAprPlan + ";";
            iAprReal += nAprReal + ";";
            iMayPlan += nMayPlan + ";";
            iMayReal += nMayReal + ";";
            iJunPlan += nJunPlan + ";";
            iJunReal += nJunReal + ";";
            iJulPlan += nJulPlan + ";";
            iJulReal += nJulReal + ";";
            iAugPlan += nAugPlan + ";";
            iAugReal += nAugReal + ";";
            iSepPlan += nSepPlan + ";";
            iSepReal += nSepReal + ";";
            iOctPlan += nOctPlan + ";";
            iOctReal += nOctReal + ";";
            iNovPlan += nNovPlan + ";";
            iNovReal += nNovReal + ";";
            iDecPlan += nDecPlan + ";";
            iDecReal += nDecReal + ";";
        }
    }
    var Str = "?act=salebudgetinfooneyear&iJanPlan=" + iJanPlan +
                                        "&iJanReal=" + iJanReal +
                                        "&iFebPlan=" + iFebPlan +
                                        "&iFebReal=" + iFebReal +
                                        "&iMarPlan=" + iMarPlan +
                                        "&iMarReal=" + iMarReal +
                                        "&iAprPlan=" + iAprPlan +
                                        "&iAprReal=" + iAprReal +
                                        "&iMayPlan=" + iMayPlan +
                                        "&iMayReal=" + iMayReal +
                                        "&iJunPlan=" + iJunPlan +
                                        "&iJunReal=" + iJunReal +
                                        "&iJulPlan=" + iJulPlan +
                                        "&iJulReal=" + iJulReal +
                                        "&iAugPlan=" + iAugPlan +
                                        "&iAugReal=" + iAugReal +
                                        "&iSepPlan=" + iSepPlan +
                                        "&iSepReal=" + iSepReal +
                                        "&iOctPlan=" + iOctPlan +
                                        "&iOctReal=" + iOctReal +
                                        "&iNovPlan=" + iNovPlan +
                                        "&iNovReal=" + iNovReal +
                                        "&iDecPlan=" + iDecPlan +
                                        "&iDecReal=" + iDecReal +
                                        "&iId=" + iId + "&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
    nmEntity.PostStringInfo(Str, this, this.SaveInfoCallBack);
}