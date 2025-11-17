## extract air temp

foo <- nc_open("I:/Science/MS-Marine/MA/CNRM_ssp370/ice/CNRM_ssp370_1m_20701201_20701231_icemod_207012-207012.nc")
longnames <- sapply(foo$var, function(x) x$longname)
print(longnames)

bar <- nc_open("I:/Science/MS-Marine/MA/CNRM_ssp370/Z56_n_result/2017/CNRM_ssp370_5d_20170101_20170131_ptrc_T_Z56_n_result.nc")
longnames <- sapply(bar$var, function(x) x$longname)
print(longnames)
