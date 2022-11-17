use "/Users/michael/Documents/econ35/LSMS-Dar/lsms_household.dta"

// summarize

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

// summarize s5_rentmonth if s5_rentmonth > -98
display "sample mean of rent per month: 47538.66 tsn"

// gen rent_resids_squared_above98 = (s5_rentmonth - 47538.66)^2 if s5_rentmonth > -98
// summarize rent_resids_squared_above98
tabstat rent_resids_squared_above98, stats(n mean median min max sum)


display 7.83e+12/(1151-1)
display "sample variance of rent per month: 6.809e+09"
display 6.809e+09*(1151-1)
display "population variance of rent per month: 7.830e+12"
display sqrt(7.830e+12/1151)/sqrt(1151)
display "standard error of rent per month: 2431.1153"

display "confidence interval = sample mean +- t * standard error"
display "confidence interval = 47538.66 +- 1.96(2431.1153)"
display 47538.66 + 1.96*2431.1153
display 47538.66 - 1.96*2431.1153
display "95% confidence interval = (42773.674, 52303.646)"

ci means s5_rentmonth if s5_rentmonth > -98
display "95% confidence interval = (42767.38 , 52309.95)"



display "Problem 5"
// replace electricity = 1 if s5_electricityhh == 1
// replace electricity = 0 if s5_electricityhh == 2
ci proportions electricity if s5_rentmonth > -98
display "95% CI is (.6163511, .659396)"


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
tabstat s5_rentmonth if dist_toCBD_over == 0 & s5_rentmonth > -98, stats(n mean median min max sum)
tabstat s5_rentmonth if dist_toCBD_over == 1 & s5_rentmonth > -98, stats(n mean median min max sum)

display "Below median stats: mean = 54426.2"
display "Above median stats: mean =  38147.85"



display "Problem 9"
ttest s5_rentmonth, by(dist_toCBD_over) unequal
display 54426.2 - 38147.85 
display "Mean difference in rent between high and low group is 16278.35"
display "Standard error of differences is 4624.377"



display "Problem 10"
display "Null hypothesis H0: difference in mean CBD distance between 'high CBD distance' and 'low CBD distance' is 0. Null hypothesis H0: difference in means between 'high CBD distance' and 'low CBD distance' is not 0. If the null hypothesis is true then the probability of observing a sample mean more extreme than this is 0.0004. This is statisicaly significant at the 5% level and the 1% level. In practical terms, it is statisicaly significant that homes closer to the CBD have higher rents."




display "Section 1.2"

display "Problem 11"
use "/Users/michael/Documents/econ35/LSMS-Dar/s1_hhroster_share.dta"
codebook id
display "2,099 unique observations of id, there's 8143 observations total. There is a discrepancy between these two data points. This is because multiple people in the same household share the same ID."



display "Problem 12"
// bysort id: gen count=_n
// bysort id: gen count2=_N
tab count2 if count==1

display "The outputs is a frequency table for the each id. Shows how many people in these households"



display "Problem 13"
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
regress d_hwrkyn dist_toCBD, vce(robust)
regress d_hwrkyn dist_toCBD
display "For both, OLS gives: d_hwrkyn = -0.0015379(dist_toCBD) + 0.9068416" 
display "Coefficient std error was .0009366 with p of 0.101 for robust and .000862 was std error for non robust with  p of  0.075"



display "Problem 16"
display "The coefficients are the same for both robust regression and non-robust regression. The standard error for the coefficient for the robust model is .0009366 and the robust 95% CI is  (-.0033747, .000299). Meanwhile the SE for the non robust model's coefficient is slightly smaller at .000862 with a 95% CI of  (-.0032285, .0001528). Robust sd/se allows the variances to vary and as such they overal se is larger. A larger SE results in a wider confidence interval relative to the non robust sd/se."



display "Problem 17"
regress s1_age dist_toCBD
display "OLS gives a model of: age = .117972(dist_toCBD) + 38.49611 . On average for each increased kilometer someone lives from CBD we expect their age on average is 0.118 years older. This 0.118 cooefficient is statisicaly significant at the 1% level. The furthur they are from the CBD, the older they are because there is a positive correlation."



display "Problem 18"
correlate s1_age dist_toCBD d_hwrkyn
display "The correlation between age and employment is negative (-0.33)"



display "Problem 19"
display "Without age as control when regressing employment over distance, B1 is biased downwards (the coeeficient is negative). This is because age could be a confounding variable effecting both distance to CBD (positively correlated) and employment (negatively correlated). When age is added, the coefficient will probably be closer to 0."



display "Problem 20"
display "When age is added to this regression, the coefficient will decrease. This is because in d_hwrkyn = -0.0015379(dist_toCBD) + 0.9068416 + e, a lot of the e is a lack of "



display "Problem 21"
regress d_hwrkyn dist_toCBD s1_age
display "Yes, this new regression matches what I predicted earlier. dist_toCBD coefficient is larger (smaller magnitude) (-.0005342 ) with age also in the model, than when age wasn't in the regression."



display "Problem 22"
// keep if hwrkyn!=. & dist_toCBD!=. & s1_age!=.
regress dist_toCBD s1_age 
// predict ehat1, res

display "This command ran the predicted y^ and used these to make a new column of the residuals."



display "Problem 23"
regress d_hwrkyn ehat1
display "This is the same coefficient as the distance to CBD in question 21. So it isolates the effect of each variable (by holding age for example constant)."



display "Problem 25"
display "From this sample, on average we expect that baby birthweight reduces by 500.28 grams for every pack of cigarettes that the mother smokes. A baby born with a mother who smokes 0 cigs on average has a weight of 3604.45 grams. "
