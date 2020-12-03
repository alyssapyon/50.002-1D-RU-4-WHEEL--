set projDir "C:/Users/ASUS/Desktop/wheelgame528/work/vivado"
set projName "wheelgame528"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/au_top_0.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/game_miniBeta_1.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/wheelLED_2.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/opLED_3.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/reset_conditioner_4.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/edge_detector_5.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/button_conditioner_6.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/sevenseg_level_7.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/sevenseg_randA_8.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/sevenseg_randB_9.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/alu_10.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/game_CU_11.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/game_miniRegfiles_12.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/variable_counter_13.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/counter_14.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/ledTOnum_15.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/shiftled_16.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/pipeline_17.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/level_digit_18.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/rand_digit_19.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/adder_20.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/boolean_21.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/shifter_22.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/compare_23.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/opTOalufn_24.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/edge_detector_25.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/counter_26.v" "C:/Users/ASUS/Desktop/wheelgame528/work/verilog/pn_gen_27.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/ASUS/Desktop/wheelgame528/work/constraint/alchitry.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "C:/Users/ASUS/Desktop/wheelgame528/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
