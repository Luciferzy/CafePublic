function SaveInfoOneYear() {
    var iId = "";
    var nJanPlan = "";
    var nFebPlan = "";
    var nMarPlan = "";
    var nAprPlan = "";
    var nMayPlan = "";
    var nJunPlan = "";
    var nJulPlan = "";
    var nAugPlan = "";
    var nSepPlan = "";
    var nOctPlan = "";
    var nNovPlan = "";
    var nDecPlan = "";
    var iJanPlan = "";
    var iFebPlan = "";
    var iMarPlan = "";
    var iAprPlan = "";
    var iMayPlan = "";
    var iJunPlan = "";
    var iJulPlan = "";
    var iAugPlan = "";
    var iSepPlan = "";
    var iOctPlan = "";
    var iNovPlan = "";
    var iDecPlan = "";
    for (var i = 0; i < Info.length; i++) {
        if (Info[i].ItemsId != 73 && Info[i].ItemsId != 74 && Info[i].ItemsId != 76) {
            switch (Info[i].NowMonth) {
                case "1":
                    nJanPlan = document.getElementById("iJanPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJanPlan" + i).value);
                    nFebPlan = document.getElementById("iFebPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iFebPlan" + i).value);
                    nMarPlan = document.getElementById("iMarPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarPlan" + i).value);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "2":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = document.getElementById("iFebPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iFebPlan" + i).value);
                    nMarPlan = document.getElementById("iMarPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarPlan" + i).value);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "3":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = document.getElementById("iMarPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMarPlan" + i).value);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "4":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = document.getElementById("iAprPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAprPlan" + i).value);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "5":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = document.getElementById("iMayPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iMayPlan" + i).value);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "6":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nJunPlan = document.getElementById("iJunPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJunPlan" + i).value);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "7":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJulPlan = document.getElementById("iJulPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iJulPlan" + i).value);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "8":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nAugPlan = document.getElementById("iAugPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iAugPlan" + i).value);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "9":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nSepPlan = document.getElementById("iSepPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iSepPlan" + i).value);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "10":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nSepPlan = txtOnfocus(document.getElementById("SepPlan" + i).innerHTML);
                    nOctPlan = document.getElementById("iOctPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iOctPlan" + i).value);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "11":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nSepPlan = txtOnfocus(document.getElementById("SepPlan" + i).innerHTML);
                    nOctPlan = txtOnfocus(document.getElementById("OctPlan" + i).innerHTML);
                    nNovPlan = document.getElementById("iNovPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iNovPlan" + i).value);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
                case "11":
                    nJanPlan = txtOnfocus(document.getElementById("JanPlan" + i).innerHTML);
                    nFebPlan = txtOnfocus(document.getElementById("FebPlan" + i).innerHTML);
                    nMarPlan = txtOnfocus(document.getElementById("MarPlan" + i).innerHTML);
                    nAprPlan = txtOnfocus(document.getElementById("AprPlan" + i).innerHTML);
                    nMayPlan = txtOnfocus(document.getElementById("MayPlan" + i).innerHTML);
                    nJunPlan = txtOnfocus(document.getElementById("JunPlan" + i).innerHTML);
                    nJulPlan = txtOnfocus(document.getElementById("JulPlan" + i).innerHTML);
                    nAugPlan = txtOnfocus(document.getElementById("AugPlan" + i).innerHTML);
                    nSepPlan = txtOnfocus(document.getElementById("SepPlan" + i).innerHTML);
                    nOctPlan = txtOnfocus(document.getElementById("OctPlan" + i).innerHTML);
                    nNovPlan = txtOnfocus(document.getElementById("NovPlan" + i).innerHTML);
                    nDecPlan = document.getElementById("iDecPlan" + i).value == "" ? "0" : txtOnfocus(document.getElementById("iDecPlan" + i).value);
                    break;
            }
            iId += Info[i].Id + ";";
            iJanPlan += nJanPlan + ";";
            iFebPlan += nFebPlan + ";";
            iMarPlan += nMarPlan + ";";
            iAprPlan += nAprPlan + ";";
            iMayPlan += nMayPlan + ";";
            iJunPlan += nJunPlan + ";";
            iJulPlan += nJulPlan + ";";
            iAugPlan += nAugPlan + ";";
            iSepPlan += nSepPlan + ";";
            iOctPlan += nOctPlan + ";";
            iNovPlan += nNovPlan + ";";
            iDecPlan += nDecPlan + ";";
        }
    }
    var Str = "?act=salecafeinfooneyear&iJanPlan=" + iJanPlan +
                                      "&iFebPlan=" + iFebPlan +
                                      "&iMarPlan=" + iMarPlan +
                                      "&iAprPlan=" + iAprPlan +
                                      "&iMayPlan=" + iMayPlan +
                                      "&iJunPlan=" + iJunPlan +
                                      "&iJulPlan=" + iJulPlan +
                                      "&iAugPlan=" + iAugPlan +
                                      "&iSepPlan=" + iSepPlan +
                                      "&iOctPlan=" + iOctPlan +
                                      "&iNovPlan=" + iNovPlan +
                                      "&iDecPlan=" + iDecPlan +
                                      "&iId=" + iId + "&UserCode=" + UserCode + "&YearS=" + YearS + "&YearE=" + YearE;
    nmEntity.PostStringInfo(Str, this, this.SaveInfoCallBack);
}