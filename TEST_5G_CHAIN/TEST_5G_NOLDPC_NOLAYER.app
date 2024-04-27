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
###########################################
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
		remote_obj=RATE_RECOVER_LDPC
	}
}
########################################RATEMATCHING AND CODEBLOCK
########################################RATE_RECOVER_LDPC
object {
	obj_name=RATE_RECOVER_LDPC
	exe_name=RATE_RECOVER_LDPC
	force_pe=0	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RATEMATCHING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_CBDesegment
	}
}
########################################RATE_RECOVER_LDPC
########################################
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
