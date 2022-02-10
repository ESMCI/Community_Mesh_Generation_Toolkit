#! /bin/csh -f

  # EDIT THESE VALUES FOR THE NEW GRID
  #----------------------------------------
##--------------------------------------------------------
##  set REPO_PATH   = "/path/to/repo/" 
##  set GRID_TAG    = "NEWGRIDNAME_ne30x4"
##  set GRID_NAME   = "ne0np4.NEWGRIDNAME.ne30x4"
##  set GRID_DESC   = "Description for the VRM file BLAH, BLAH, BLAH....."
##  set NCOL        = 'NNNNNN'
##  set DATE        = "YYMMDD"
##
##  set EXODUS_FILE = $GRID_TAG"_EXODUS.nc"
##  set MESH_FILE   = $GRID_TAG"_np4_MESH.nc"        <--- modify 'np4' for other options!
##  set FULLPATH    = $REPO_PATH'/'$GRID_NAME'/'
##  set OUTFILE     = $FULLPATH"config_grids.xml"
##--------------------------------------------------------

  set TOPO_TAG   = "TXTXTXTXTX"
  set GRID_TAG   = "AXAXAXAXAX"
  set GRID_NAME  = "GXGXGXGXGX"
  set GRIDDESC   = "ADD A DESCRIPTION OF THE GRID HERE"

  set REPO_PATH  = "RXRXRXRXRX"
  set DATE       = "DXDXDXDXDX"
  set NCOL       = "NXNXNXNXNX"

  #-------------------------------------------------------------------------------
  # NO NEED TO EDIT PAST HERE
  #-------------------------------------------------------------------------------
  set EXODUS_FILE = $GRID_TAG"_EXODUS.nc"
  set MESH_FILE   = $GRID_TAG"_np4_MESH.nc"
  set FULLPATH    = $REPO_PATH'/'$GRID_NAME'/'
  set OUTFILE     = $FULLPATH"config_grids.xml"

  cp ./CONFIG-TEMPLATES/shell_commands-TEMPLATE $FULLPATH/shell_commands


  set SEDcmdT="s:TTTTTTTTTT:"$TOPO_TAG":g"
  set SEDcmdG="s:GGGGGGGGGG:"$GRID_NAME":g"
  set SEDcmdP="s:PPPPPPPPPP:"$FULLPATH":g"
  set SEDcmdE="s:EEEEEEEEEE:"$EXODUS_FILE":g"
  set SEDcmdD="s:DDDDDDDDDD:"$DATE":g"
  sed -e $SEDcmdG -e $SEDcmdP -e $SEDcmdE -e $SEDcmdT -e $SEDcmdD < ./CONFIG-TEMPLATES/user_nl_cam-TEMPLATE  >  $FULLPATH/user_nl_cam
  sed -e $SEDcmdG -e $SEDcmdP -e $SEDcmdD                         < ./CONFIG-TEMPLATES/user_nl_clm-TEMPLATE  >  $FULLPATH/user_nl_clm



  cat ./CONFIG-TEMPLATES/config_grids.xml-TEMPLATE_PT1                            >  $OUTFILE
  echo '   <!--- VR-CESM grids with CAM-SE -->'                                   >> $OUTFILE
  echo ''                                                                         >> $OUTFILE
  echo '    <model_grid alias="'$GRID_NAME'_g17"> '                               >> $OUTFILE
  echo '      <grid name="atm">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="lnd">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="ocnice">gx1v7</grid>'                                   >> $OUTFILE
  echo '      <mask>gx1v7</mask>'                                                 >> $OUTFILE
  echo '    </model_grid>'                                                        >> $OUTFILE
  echo ''                                                                         >> $OUTFILE
  echo '    <model_grid alias="'$GRID_NAME'_mg17" >'                              >> $OUTFILE
  echo '      <grid name="atm">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="lnd">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="ocnice">'$GRID_NAME'</grid>'                            >> $OUTFILE
  echo '      <mask>gx1v7</mask>'                                                 >> $OUTFILE
  echo '    </model_grid>'                                                        >> $OUTFILE
  echo ''                                                                         >> $OUTFILE
  echo '    <model_grid alias="'$GRID_NAME'_t12">'                                >> $OUTFILE
  echo '      <grid name="atm">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="lnd">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="ocnice">tx0.1v2</grid>'                                 >> $OUTFILE
  echo '      <mask>tx0.1v2</mask>'                                               >> $OUTFILE
  echo '    </model_grid>'                                                        >> $OUTFILE
  echo ''                                                                         >> $OUTFILE
  echo '    <model_grid alias="'$GRID_NAME'_mt12" >'                              >> $OUTFILE
  echo '      <grid name="atm">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="lnd">'$GRID_NAME'</grid>'                               >> $OUTFILE
  echo '      <grid name="ocnice">'$GRID_NAME'</grid>'                            >> $OUTFILE
  echo '      <mask>tx0.1v2</mask>'                                               >> $OUTFILE
  echo '    </model_grid>'                                                        >> $OUTFILE
  cat ./CONFIG-TEMPLATES/config_grids.xml-TEMPLATE_PT2                            >> $OUTFILE
  echo ''                                                                         >> $OUTFILE
  echo '    <domain name="'$GRID_NAME'">'                                         >> $OUTFILE
  echo '      <nx>'$NCOL'</nx> <ny>1</ny>'                                        >> $OUTFILE
  echo '      <mesh>'$FULLPATH'grids/'$MESH_FILE'</mesh>'                         >> $OUTFILE
  echo '      <desc>'$GRIDDESC'</desc>'                                           >> $OUTFILE
  echo '      <support>Test support only</support>'                               >> $OUTFILE
  echo '    </domain>'                                                            >> $OUTFILE
  cat ./CONFIG-TEMPLATES/config_grids.xml-TEMPLATE_PT3                            >> $OUTFILE

