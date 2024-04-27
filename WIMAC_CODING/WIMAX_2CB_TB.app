object {
	obj_name=MAC
	exe_name=MAC_LAYER
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=SOURCE_SINK
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_2
		remote_itf=input_1
		remote_obj=MOD_16QAM
	}
	outputs {
		name=output_3
		remote_itf=input_1
		remote_obj=DEMOD_16QAM
	}	
	outputs {
		name=output_4
		remote_itf=input_1
		remote_obj=RECONCATENATION
	}
	outputs {
		name=output_5
		remote_itf=input_1
		remote_obj=RECONCATENATIONTX
	}
	outputs {
		name=output_6
		remote_itf=input_1
		remote_obj=SEPARATE
	}
}

########################################
object {
	obj_name=SOURCE_SINK
	exe_name=data_source_sink
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UNCRC
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=MAC
	}
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
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SOURCE_SINK
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=Code_Segment
	}
}
########################################
########################################
object {
	obj_name=Code_Segment
	exe_name=CODE_BLOC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CRC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC
	}
}
########################################
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RECONCATENATIONTX
		bw=10
	}
}
#######################################################################ENCODLDPC
########################################
object {
	obj_name=RECONCATENATIONTX
	exe_name=RECONCATENATION
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC
	}
	inputs {
		name=input_1
		remote_itf=output_5
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SCRAMBLING
	}
}
########################################
########################################
object {
	obj_name=SCRAMBLING
	exe_name=SCRAMBLING_F_C
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RECONCATENATIONTX
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MOD_16QAM
	}
}
########################################
########################################
object {
	obj_name=MOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SCRAMBLING
	}
	inputs {
		name=input_1
		remote_itf=output_2
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_16QAM	
	}
}
###################################################################DEMOD16QAM
object {
	obj_name=DEMOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_16QAM
	}
	inputs {
		name=input_1
		remote_itf=output_3
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DESCRAMBLING
	}
}
####################################################################DEMOD16QAM
########################################
object {
	obj_name=DESCRAMBLING
	exe_name=SCRAMBLING_F_C
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SEPARATE
	}
}
########################################
########################################
object {
	obj_name=SEPARATE
	exe_name=SEPARATE
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DESCRAMBLING
	}
	inputs {
		name=input_1
		remote_itf=output_6
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=wimax_decodLDPC
	}
}
########################################
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SEPARATE
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RECONCATENATION
		bw=10
	}
}
#######################################################################DECODE_LDPC
########################################
object {
	obj_name=RECONCATENATION
	exe_name=RECONCATENATION
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_decodLDPC
	}
	inputs {
		name=input_1
		remote_itf=output_4
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DeCode_Segment
	}
}
########################################
########################################
object {
	obj_name=DeCode_Segment
	exe_name=CODE_BLOC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RECONCATENATION
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC
	}
}
########################################
########################################
object {
	obj_name=UNCRC
	exe_name=CRC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SOURCE_SINK
	}
}
########################################
