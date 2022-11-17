use "/Users/michael/Documents/econ35/lab2/Data/WVS_Cross-National_Wave_7_stata_v4_0.dta"

//Question 1

graph bar Q51, over(C_COW_ALPHA, label(angle(90) labsize(*0.5)) sort(1)) title("Average Enough Food Survey Question by Country") ytitle("Gone w/o enough food (1 often - 4 never)")

graph bar Q50, over(C_COW_ALPHA, label(angle(90) labsize(*0.5)) sort(1)) title("Average Income Satisfaction by Country") ytitle("Satisfaction (1 dissatisfied - 10 satisfied)")

graph bar Q53, over(C_COW_ALPHA, label(angle(90) labsize(*0.5)) sort(1)) title("Average Enough Medicine Survey Question by Country") ytitle("Gone w/o enough medicine (1 often - 4 never)")

//Question 2
gen Q50_dummy =.
replace Q50_dummy = 1 if Q50 == 1
replace Q50_dummy = 2 if Q50 == 2
replace Q50_dummy = 3 if Q50 == 3
replace Q50_dummy = 4 if Q50 == 4
replace Q50_dummy = 5 if Q50 == 5
replace Q50_dummy = 6 if Q50 == 6
replace Q50_dummy = 7 if Q50 == 7
replace Q50_dummy = 8 if Q50 == 8
replace Q50_dummy = 9 if Q50 == 9
replace Q50_dummy = 10 if Q50 == 10

gen Q121_dummy =.
replace Q121_dummy = 1 if Q121 == 1
replace Q121_dummy = 2 if Q121 == 2
replace Q121_dummy = 3 if Q121 == 3
replace Q121_dummy = 4 if Q121 == 4
replace Q121_dummy = 5 if Q121 == 5

replace Q121_dummy = . if Q50_dummy == .
replace Q50_dummy = . if Q121_dummy == .

tabstat Q50_dummy
regress Q121_dummy Q50_dummy

gen college_dummy = .
replace college_dummy = 1 if Q275 > 5
replace college_dummy = 0 if Q275 <= 5

regress Q121_dummy Q50_dummy college_dummy

//Question 4
gen rate = .
gen crime = . 
regress Q69 rate
regress Q69 rate crime


//Question 5
clear

append using "/Users/michael/Documents/econ35/lab2/Data/WV6_Data_stata_v20201117.dta" "/Users/michael/Documents/econ35/lab2/Data/WVS_Cross-National_Wave_7_stata_v4_0.dta" 
//
// //Question 6
//
//
// //Question 7
drop if C_COW_ALPHA == "AND"
drop if C_COW_ALPHA == "BNG"
drop if C_COW_ALPHA == "BOL"
drop if C_COW_ALPHA == "CAN"
drop if C_COW_ALPHA == "DRV"
drop if C_COW_ALPHA == "ETH"
drop if C_COW_ALPHA == "GRC"
drop if C_COW_ALPHA == "GUA"
drop if C_COW_ALPHA == "INS"
drop if C_COW_ALPHA == "IRN"
drop if C_COW_ALPHA == "KEN"
drop if C_COW_ALPHA == "MAD"
drop if C_COW_ALPHA == "MAU"
drop if C_COW_ALPHA == "MNG"
drop if C_COW_ALPHA == "MYA"
drop if C_COW_ALPHA == "NIC"
drop if C_COW_ALPHA == "PRI"
drop if C_COW_ALPHA == "SRB"
drop if C_COW_ALPHA == "TAJ"
drop if C_COW_ALPHA == "VEN"

drop if C_COW_ALPHA == "ALG"
drop if C_COW_ALPHA == "AZE"
drop if C_COW_ALPHA == "BLR"
drop if C_COW_ALPHA == "EST"
drop if C_COW_ALPHA == "GHA"
drop if C_COW_ALPHA == "GRG"
drop if C_COW_ALPHA == "HAI"
drop if C_COW_ALPHA == "IND"
drop if C_COW_ALPHA == "KUW"
drop if C_COW_ALPHA == "POL"
drop if C_COW_ALPHA == "PSE"
drop if C_COW_ALPHA == "QAT"
drop if C_COW_ALPHA == "RWA"
drop if C_COW_ALPHA == "SAF"
drop if C_COW_ALPHA == "SLV"
drop if C_COW_ALPHA == "SPN"
drop if C_COW_ALPHA == "SWD"
drop if C_COW_ALPHA == "TRI"
drop if C_COW_ALPHA == "URU"
drop if C_COW_ALPHA == "UZB"
drop if C_COW_ALPHA == "YEM"
//
//
// //Question 7
//
// summarize
tabstat V1, stats(n)
tabstat A_WAVE, stats(n)

tabstat V126 if C_COW_ALPHA == "USA" & V95 <= 5, stats(mean, median)
tabstat V126 if C_COW_ALPHA == "USA" & V95 > 5, stats(mean, median)
tabstat V126 if C_COW_ALPHA != "USA" & V95 <= 5, stats(mean, median)
tabstat V126 if C_COW_ALPHA != "USA" & V95 > 5, stats(mean, median)

tabstat Q83 if C_COW_ALPHA == "USA" & Q240 <= 5, stats(mean, median)
tabstat Q83 if C_COW_ALPHA == "USA" & Q240 > 5, stats(mean, median)
tabstat Q83 if C_COW_ALPHA != "USA" & Q240 <= 5, stats(mean, median)
tabstat Q83 if C_COW_ALPHA != "USA" & Q240 > 5, stats(mean, median)



tabstat V126 if C_COW_ALPHA == "USA", stats(mean, median)
tabstat V126 if C_COW_ALPHA != "USA", stats(mean, median)

tabstat Q83 if C_COW_ALPHA == "USA", stats(mean, median)
tabstat Q83 if C_COW_ALPHA != "USA", stats(mean, median)





