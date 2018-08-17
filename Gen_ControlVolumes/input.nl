!  MeshFile           = 'VarMesh_Julio01.g'   !  MeshFile= "VarMesh_NULL_MAP.g"
&ctl_nl
  InputPath          = '../GridData/'
  MeshFile           = 'VarMesh_NULL_MAP.g'

  OutputPath         = './'
  create_SCRIP_file  = .true.
  SCRIP_filename     = "DIAG_SCRIP_nl.nc"
  create_LATLON_file = .true.
  LATLON_filename    = "DIAG_LATLON_nl.nc"
  create_PHYS_file   = .true.
  PHYS_filename      = "DIAG_PHYS_nl.nc"
  create_GRID_file   = .true.
  GRID_filename      = "DIAG_GRID_nl.nc"

  ne            = 0
  partmethod    = 4
  topology      = "cube"
  fine_ne       = 120 

  hypervis_power       = 3.2 
  hypervis_order       = 2
  max_hypervis_courant = 9991.9

  nu   = 1.1e12
  nu_s = 0
  nu_p = 0
/
