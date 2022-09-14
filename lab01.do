use "/Users/michael/Documents/econ35/LSMS-Dar/lsms_household.dta"

summarize

//Section 1.1 



//1)
count if visit1_out_mr == 1
count if visit2_out_mr == 1
count if visit3_out_mr == 1

//1820 completed first, 199 second, 64 third


//2)
label list ls4_subpov2
count if s4_subpov2 == 1
count if s4_subpov2 == 2
count if s4_subpov2 == 3
count if s4_subpov2 == 4
count if s4_subpov2 == 5

