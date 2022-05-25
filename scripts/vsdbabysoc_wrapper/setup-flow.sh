# copy config files to design dir
sed -i '/::env(GLB_RT_MAXLAYER)/d' ${design_dir}/openlane/user_project_wrapper/config.tcl
sed -i 's/vssd1 \\/vssd1, \\ mprj vccd1 vssd1, \\/g' ${design_dir}/openlane/user_project_wrapper/config.tcl
gzip -d ${design_dir}/gds/user_proj_example.gds.gz
gzip -d ${design_dir}/gds/avsddac.gds.gz
gzip -d ${design_dir}/gds/avsdpll.gds.gz
