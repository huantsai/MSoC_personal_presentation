catch {::common::set_param -quiet hls.xocc.mode csynth};
# 
# Hls run script generated by the compiler
# 

set vpp_optimize_level 0
open_project runOnfpga
set_top runOnfpga
add_files "/home/team03-b05064/Vitis-Tutorials/Hardware_Accelerators/Design_Tutorials/02-bloom/reference_files/compute_score_fpga_kernel_opt.cpp" -cflags " -g -D PARALLELISATION=8 -I /home/team03-b05064/Vitis-Tutorials/Hardware_Accelerators/Design_Tutorials/02-bloom/reference_files "
open_solution solution
set_part xcu50-fsvh2104-2-e
create_clock -period 300.000000MHz -name default
config_sdx -target xocc
config_rtl -kernel_profile
config_export -vivado_optimization_level $vpp_optimize_level
config_dataflow -strict_mode warning
config_debug -enable
set_clock_uncertainty 27.000000%
config_rtl -enable_maxiConservative=1
config_interface -m_axi_addr64
config_export -format ip_catalog -ipname runOnfpga
csynth_design
export_design
close_project
puts "HLS completed successfully"
exit
