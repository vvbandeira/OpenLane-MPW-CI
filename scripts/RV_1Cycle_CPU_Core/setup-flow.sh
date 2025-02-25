# copy config files to design dir
sed -i '/::env(DESIGN_IS_CORE)/d' ${design_dir}/openlane/RISC_V/config.tcl
sed -i '/::env(RT_MAX_LAYER)/d' ${design_dir}/openlane/RISC_V/config.tcl
sed -i '/::env(ROUTING_CORES)/d' ${design_dir}/openlane/RISC_V/config.tcl
sed -i 's/GLB_RT/GRT/g' ${design_dir}/openlane/RISC_V/config.tcl
sed -i 's/\$script_dir\/..\/../\$::env(DESIGN_DIR)/g' ${design_dir}/openlane/RISC_V/config.tcl
sed -i 's/\$script_dir\/pin/\$::env(DESIGN_DIR)\/openlane\/RISC_V\/pin/g' ${design_dir}/openlane/RISC_V/config.tcl
