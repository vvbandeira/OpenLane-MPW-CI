# copy config files to design dir
sed -i '/::env(DESIGN_IS_CORE)/d' ${design_dir}/openlane/ycr_core_top/config.tcl
sed -i '/::env(GLB_RT_MAXLAYER)/d' ${design_dir}/openlane/ycr_core_top/config.tcl
sed -i '/::env(RT_MAX_LAYER)/d' ${design_dir}/openlane/ycr_core_top/config.tcl
sed -i '/::env(FP_PDN_CORE_RING)/d' ${design_dir}/openlane/ycr_core_top/config.tcl
sed -i '/::env(FP_PIN_ORDER_CFG)/d' ${design_dir}/openlane/ycr_core_top/config.tcl
sed -i '/::env(ROUTING_CORES)/d' ${design_dir}/openlane/ycr_core_top/config.tcl
