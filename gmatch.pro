pro gmatch, cluster
;start the program and call cluster

cluster = "c1"
;cluster set to c1

aa = mrdfits(cluster + "sps_fit.fits.gz", 1)
;aa = cluster, "c1" + sps_fit.fits.gz so it is "c1sps_fit.fits.gz
;file is not called c1sps_fit.fits.gz may encounter error\

bb = mrdfits("/raid/crobles"+ cluster+".fit")
;bb = cluster fits file

ngals = n_elements(aa)
; ngals = number of elements in aa

for i=0, ngals - 1 do begin
;begin for loop

match = where (bb.plate eq aa[i].plate and bb.fiberid eq aa[i].fiberid, cmatch)
;match where bb.plate = aa.plate and where bb.fiberid = aa.fiber id

if cmatch eq 1 then
; is there is a match
aa[i].logmstar = bb[match].logmass
set bb's mass to aa's mass

else stop, "more that one match found"
;if more than one match found, print "more than..."

end for
;end for loop

mwrfits, aa "/raid/crobles/"+cluster+"sps_fit.fits", /create
;create file

end
;end program
