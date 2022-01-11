load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
; ================================================;

begin

;===============================================
; Set the Latitude Resoultion and the Name of the
; refinement map to generate HERE: 
;------------------------------------------------
;  nlat = 180
;  RefMap_Name = "REFMAP_360x180.nc"
;-----------------------------------
;  nlat = 720                       
;  RefMap_Name = "REFMAP_1440x720.nc"
;-----------------------------------
  nlat = 1440
  RefMap_Name = "REFMAP_2880x1440.nc"
;===============================================

  nlon = 2*nlat
  dlt  = (180.d0/tofloat(nlat))
  dlt2 = dlt/2.d0

  latitude  = fspan(-90.d0+dlt2, 90.d0-dlt2,nlat)
  longitude = fspan(  0.d0+dlt2,360.d0-dlt2,nlon)
  latitude!0  = "latitude"
  longitude!0 = "longitude"

  refineMap = new( (/nlat,nlon/),double)
  refineMap!0 = "latitude"
  refineMap!1 = "longitude"
  refineMap&latitude  = latitude
  refineMap&longitude = longitude
  refineMap(:,:) = 0.d0

  fref = addfile(RefMap_Name,"c")
  fref->refineMap = refineMap
  delete(fref)
end
