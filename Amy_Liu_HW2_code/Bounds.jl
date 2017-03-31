function Bounds(DF)

SBA = DF["species_bounds_array"]

  SBA[73:92,1] = 0
  SBA[73:92,2] = 100
  #Glucose, glutamine, glutamate
  SBA[81:83,1] = -1
  SBA[81:83,2] = 0

  SBA[82:83,1] = 0
  SBA[82:83,2] = 100

  SBA[84:85,1] = -100
  SBA[84:85,2] = 100

  SBA[88,1] = -100 # 88 M_nh4_b
  SBA[88,2] = 0
  SBA[89,1] = -100 # 89 M_o2_b
  SBA[89,2] = 0

  SBA[90,1] = -100 # 90 M_pi_b
  SBA[90,2] = 100

DF["species_bounds_array"] = SBA


FB = DF["default_flux_bounds_array"]

  FB[25,2] = 0 # 25 M_co2_e --> M_co2_c
  FB[11,2] = 0 # 11 M_ac_e+M_h_e --> M_ac_c+M_h_c
  FB[129,2] = 0 # 129 2.0*M_h_e+M_succ_e --> 2.0*M_h_c+M_succ_c
  FB[104,2] = 0 # 104 M_o2_c --> M_o2_e
  FB[33,2] = 0 # 33 M_etoh_e+M_h_e --> M_etoh_c+M_h_c
  FB[71,2] = 0 # 71 M_fum_e+2.0*M_h_e --> M_fum_c+2.0*M_h_c
  FB[68,2] = 0 # 68 M_fru_e+M_pep_c --> M_f6p_c+M_pyr_c
  FB[123,2] = 0 # 123 M_h_e+M_pyr_e --> M_h_c+M_pyr_c
  #FB[66,2] = 0 # 66 M_for_c --> M_for_e
  #FB[45,1] = 10; # R_EX_glc_e::M_glc_D_b --> M_glc_D_e
  #FB[57,1] = 10; # R_EX_o2_e_reverse::M_o2_b --> M_o2_e


#  FB[261,2] = 100; # M_udccjglycan_p --> []
#  FB[270,2] = 100; # M_glycoprot_p --> []

DF["default_flux_bounds_array"] = FB
  return DF
end
