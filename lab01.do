use "/Users/michael/Documents/econ35/LSMS-Dar/lsms_household.dta"

summarize

display "Section 1.1"

display "Problem 1"
count if visit1_out_mr == 1
count if visit2_out_mr == 1
count if visit3_out_mr == 1

display "1820 completed first, 199 second, 64 third"



display "Problem 2"
label list ls4_subpov2
count if s4_subpov2 == 1
count if s4_subpov2 == 2
count if s4_subpov2 == 3
count if s4_subpov2 == 4
count if s4_subpov2 == 5

display "As the mode is 3, a lot of the respondants rated their well-being as doing just okay, which meant just being able to meet living needs. The distribution is also unimodal around 3, with less people answering 2 and 4 and very few people with the extremes of 1 or 5."



display "Problem 3"

display "The interview set a specific set of criteria for well-being, which was measured in how well households were able to provide for their own needs based on specific criteria such as being able to invest or buy livestock. These interviewees could've had a different definition of what it means to be well, but well-being was measured in terms' of the interviewer's attribution to well-being with ability to support household needs."



display "Problem 4"

summarize s5_rentmonth if s5_rentmonth > -98
display "sample mean of rent per month: 47538.66 tsn"

// gen rent_resids_squared_above98 = (s5_rentmonth - 47538.66)^2 if s5_rentmonth > -98
summarize rent_resids_squared_above98
tabstat rent_resids_squared_above98, stats(n mean median min max sum)


display 7.83e+12/(1151-1)
display "sample variance of rent per month: 6.809e+09"
display 6.809e+09*1151
display "population variance of rent per month: 7.837e+12"
display sqrt(7.837e+12/1043)/sqrt(1151)
display "standard error of rent per month: 2555.0247"

display "confidence interval = sample mean +- t * standard error"
display "confidence interval = 47538.66 +- 1.96(2555.0247)?"
display 47538.66 + 1.96*2555.0247
display 47538.66 - 1.96*2555.0247
display "confidence interval = (42530.812, 52546.508)"

ci means s5_rentmonth if s5_rentmonth > -98
display "confidence interval = (42767.38 , 52309.95)"



display "Problem 5"
// tabulate s5_electricityhh if s5_rentmonth > -98, generate(dum)
// ci proportions s5_electricityhh
//DO!
 

 
display "Problem 6"
tabstat dist_toCBD if s5_rentmonth > -98, stats(n mean median min max sum)
display "mean is 12.79709, median is 9.801385"



display "Problem 7"
histogram dist_toCBD, width(1)



display "Problem 8"

// gen dist_toCBD_over = 0 if dist_toCBD < 9.801385 & s5_rentmonth > -98
// replace dist_toCBD_over = 1 if dist_toCBD > 9.801385 & s5_rentmonth > -98
// replace dist_toCBD_over = 0 if dist_toCBD < 9.801385 & s5_rentmonth > -98
// drop if s5_rentmonth <= -98
tabstat dist_toCBD if dist_toCBD_over == 0 & s5_rentmonth > -98, stats(n mean median min max sum)
tabstat dist_toCBD if dist_toCBD_over == 1 & s5_rentmonth > -98, stats(n mean median min max sum)

display "Below median stats: mean = 6.372277 , median = 6.440475"
display "Above median stats: mean = 19.22753, median = 17.27149"



display "Problem 9"
ttest dist_toCBD, by(dist_toCBD_over)
display 19.22753 - 6.372277 
display "Mean difference in rent between high and low group is 12.855253"
display "Standard error of differences is .2170255"



display "Problem 10"
display "Null hypothesis H0: difference in mean CBD distance between 'high CBD distance' and 'low CBD distance' is 0. Null hypothesis H0: difference in means between 'high CBD distance' and 'low CBD distance' is not 0. If the null hypothesis is true then the probability of observing a sample mean more extreme than this is 0.0000. This is statisicaly significant at the 5% level and the 1% level. In practical terms, it is statisicaly significant that there is a difference in distance to CBD between the 'high CBD distance' and 'low CBD distance' groups."




display "Section 1.2"

display "Problem 1"
use "/Users/michael/Documents/econ35/LSMS-Dar/s1_hhroster_share.dta"
// tab id DO!!!
display "15 unique observations of id, there's 8143 observations total. There is a discrepancy between these two data points."



display "Problem 2"
// bysort id: gen count=_n
// bysort id: gen count2=_N
tab count2 if count==1

display "The outputs is a frequency table for the each id"



display "Problem 3"
// merge m:1 id id using "/Users/michael/Documents/econ35/LSMS-Dar/lsms_household.dta"
// sort id
// by id: assert _N==1
// keep if _merge==3



display "Section 1.3"
drop if s1_hhrtnshp != 1

display "Problem 14"
// gen d_hwrkyn = 1 if hwrkyn == 1
// replace d_hwrkyn = 0 if hwrkyn == 2



display "Problem 15"


