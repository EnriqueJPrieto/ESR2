###################################################################DEMOD16QAM
object {
	obj_name=MAPPING_UL
	exe_name=MAPPING_V2_UL
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMAPPING_UL
	}

}
###################################################################
object {
	obj_name=DEMAPPING_UL
	exe_name=MAPPING_V2_UL
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MAPPING_UL
	}
###################################################################
