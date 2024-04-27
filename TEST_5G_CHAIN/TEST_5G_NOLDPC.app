#########################################################################REPORT

#object {
#	obj_name=5G_TBSD
#	exe_name=5G_TBSD
#	force_pe=0
#	outputs {
#		name=output_0
#		remote_itf=input_0
#		remote_obj=SOURCE_SINK
#	}
#}

########################################
object {
	obj_name=SOURCE_SINK
	exe_name=data_source_sink
	force_pe=0
#	inputs {
#		name=input_0
#		remote_itf=output_0
#		remote_obj=5G_TBSD
#	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=CRC
	}
}
########################################
########################################
object {
	obj_name=CRC
	exe_name=CRC
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SOURCE_SINK
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_CBS
	}
}
########################################
########################################
object {
	obj_name=5G_CBS
	exe_name=5G_CBSegment
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CRC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RATEMATCHING
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=RATEMATCHING
	}
}
########################################
########################################RATEMATCHING AND CODEBLOCK
object {
	obj_name=RATEMATCHING
	exe_name=RATE_MATCHING
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=5G_CBS
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=5G_CBS
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SCRAMBLING
	}
}
########################################RATEMATCHING AND CODEBLOCK
########################################SCRAMBLING
object {
	obj_name=SCRAMBLING
	exe_name=SCRAMBLING
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RATEMATCHING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MOD_16QAM
	}
}
########################################SCRAMBLING
########################################MOD_16QAM
object {
	obj_name=MOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SCRAMBLING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=LAYER_MAPPING	
	}
}
########################################MOD_16QAM
########################################LAYER_MAPPING
object {
	obj_name=LAYER_MAPPING
	exe_name=LAYER_MAPPING
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_16QAM
	}
	#inputs {
	#	name=input_1
	#	remote_itf=output_0
	#	remote_obj=MOD_16QAM1
	#}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=LAYER_DEMAPPING	
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=LAYER_DEMAPPING	
	}
	outputs {
		name=output_2
		remote_itf=input_2
		remote_obj=LAYER_DEMAPPING	
	}
	outputs {
		name=output_3
		remote_itf=input_3
		remote_obj=LAYER_DEMAPPING	
	}
		outputs {
		name=output_4
		remote_itf=input_4
		remote_obj=LAYER_DEMAPPING	
	}
	outputs {
		name=output_5
		remote_itf=input_5
		remote_obj=LAYER_DEMAPPING	
	}
	outputs {
		name=output_6
		remote_itf=input_6
		remote_obj=LAYER_DEMAPPING	
	}
	outputs {
		name=output_7
		remote_itf=input_7
		remote_obj=LAYER_DEMAPPING	
	}

}
########################################LAYER_MAPPING
########################################LAYER_DEMAPPING
object {
	obj_name=LAYER_DEMAPPING
	exe_name=LAYER_DEMAPPING
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=LAYER_MAPPING
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=LAYER_MAPPING
	}
	inputs {
		name=input_2
		remote_itf=output_2
		remote_obj=LAYER_MAPPING
	}
	inputs {
		name=input_3
		remote_itf=output_3
		remote_obj=LAYER_MAPPING
	}
	inputs {
		name=input_4
		remote_itf=output_4
		remote_obj=LAYER_MAPPING
	}
	inputs {
		name=input_5
		remote_itf=output_5
		remote_obj=LAYER_MAPPING
	}
	inputs {
		name=input_6
		remote_itf=output_6
		remote_obj=LAYER_MAPPING
	}
	inputs {
		name=input_7
		remote_itf=output_7
		remote_obj=LAYER_MAPPING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_16QAM	
	}
	#outputs {
	#	name=output_1
	#	remote_itf=input_0
	#	remote_obj=DEMOD_16QAM1	
	#}

}
########################################LAYER_DEMAPPING
########################################DEMOD16QAM
object {
	obj_name=DEMOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=LAYER_DEMAPPING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DESCRAMBLING
	}
}
########################################DEMOD16QAM
########################################DESCRAMBLING
object {
	obj_name=DESCRAMBLING
	exe_name=SCRAMBLING
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RATE_RECOVER_LDPC
	}
}
########################################DESCRAMBLING
########################################RATE_RECOVER_LDPC
object {
	obj_name=RATE_RECOVER_LDPC
	exe_name=RATE_RECOVER_LDPC
	force_pe=0	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DESCRAMBLING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_CBDesegment
	}
}
########################################RATE_RECOVER_LDPC
###########################################
object {
	obj_name=5G_CBDesegment
	exe_name=5G_CBDesegment
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RATE_RECOVER_LDPC
	}
}
########################################
