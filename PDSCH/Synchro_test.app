object {
	obj_name=MAC
	exe_name=MAC_LAYER
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=DATASOURCESINK
	}
	outputs {
		name=output_1
		remote_itf=input_7
		remote_obj=RATE_MATCH
	}
	outputs {
		name=output_2
		remote_itf=input_1
		remote_obj=UN_RATE_MATCH
	}
	outputs {
		name=output_3
		remote_itf=input_7
		remote_obj=DeCode_Segment
	}

	outputs {
		name=output_4
		remote_itf=input_1
		remote_obj=MOD_16QAM
	}
	outputs {
		name=output_5
		remote_itf=input_1
		remote_obj=DEMOD_16QAM
	}
	outputs {
		name=output_6
		remote_itf=input_1
		remote_obj=Code_Segment
	}
	#outputs {
	#	name=output_6
	#	remote_itf=input_1
	#	remote_obj=SCRAMBLING
	#}
	#outputs {
	#	name=output_7
	#	remote_itf=input_1
	#	remote_obj=DESCRAMBLING
	#}
	outputs {
		name=output_8
		remote_itf=input_1
		remote_obj=MAPPING
	}
	outputs {
		name=output_9
		remote_itf=input_1
		remote_obj=DEMAPPING
	}
}


########################################
########################################
object {
	obj_name=DATASOURCESINK
	exe_name=data_source_sink
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
		remote_obj=DATASOURCESINK
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
	inputs {
		name=input_1
		remote_itf=output_6
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC0
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC1
	}
	outputs {
		name=output_2
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC2
	}
	outputs {
		name=output_3
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC3
	}
	outputs {
		name=output_4
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC4
	}
	outputs {
		name=output_5
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC5
	}
	
}
########################################
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC0
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	force_pe=1
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC1
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC2
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_2
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_2
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC3
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_3
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_3
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC4
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_4
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_4
		remote_obj=RATE_MATCH
		bw=10
	}
}

########################################
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC5
	exe_name=WIMAX_ENC_ALOE16
	#proc=10
	force_pe=0
	
	inputs {
		name=input_0
		remote_itf=output_5
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_5
		remote_obj=RATE_MATCH
		bw=10
	}
}

########################################
########################################
object {
	obj_name=RATE_MATCH
	exe_name=RATE_MATCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC0
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC1
	}
	inputs {
		name=input_2
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC2
	}
	inputs {
		name=input_3
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC3
	}
	inputs {
		name=input_4
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC4
	}
	inputs {
		name=input_5
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC5
	}
	inputs {
		name=input_7
		remote_itf=output_1
		remote_obj=MAC
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
		remote_obj=RATE_MATCH
	}
	inputs {
		name=input_1
		remote_itf=output_4
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MAPPING	
	}
}
###################################################################DEMOD16QAM
object {
	obj_name=MAPPING
	exe_name=MAPPING_V2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_16QAM
	}
	inputs {
		name=input_1
		remote_itf=output_8
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=IFFT
	}

}


################################################################################
################################################################################
object {
	obj_name=IFFT
	exe_name=FFT_IFFT
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MAPPING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SYNCRO	
	}
}
###################################################################DEMOD16QAM
################################################################################
object {
	obj_name=SYNCRO
	exe_name=SYNCRO
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=IFFT
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=FFT	
	}
#	outputs {
#		name=output_1
#		remote_itf=input_0
#		remote_obj=GRAPH	
#	}
}
###################################################################DEMOD16QAM
#object {
#	obj_name=GRAPH
#	exe_name=GRAPH
#	force_pe=1
#	inputs {
#		name=input_0
#		remote_itf=output_1
#		remote_obj=SYNCRO
#	}
#}
################################################################################
object {
	obj_name=FFT
	exe_name=FFT_IFFT
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SYNCRO
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMAPPING	
	}
}
###################################################################DEMOD16QAM
###################################################################
object {
	obj_name=DEMAPPING
	exe_name=MAPPING_V2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=FFT
	}
	inputs {
		name=input_1
		remote_itf=output_9
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_16QAM
	}

}
###################################################################DEMOD16QA
object {
	obj_name=DEMOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMAPPING
	}
	inputs {
		name=input_1
		remote_itf=output_5
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UN_RATE_MATCH
	}
}
########################################
########################################
object {
	obj_name=UN_RATE_MATCH
	exe_name=RATE_MATCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
	}
	inputs {
		name=input_1
		remote_itf=output_2
		remote_obj=MAC
	}
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=wimax_decodLDPC0
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=wimax_decodLDPC1
	}
	outputs {
		name=output_2
		remote_itf=input_0
		remote_obj=wimax_decodLDPC2
	}
	outputs {
		name=output_3
		remote_itf=input_0
		remote_obj=wimax_decodLDPC3
	}
	outputs {
		name=output_4
		remote_itf=input_0
		remote_obj=wimax_decodLDPC4
	}
	outputs {
		name=output_5
		remote_itf=input_0
		remote_obj=wimax_decodLDPC5
	}
	
}
########################################
#####################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC0
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DeCode_Segment
		bw=10
	}
}
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC1
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=DeCode_Segment
		bw=10
	}
}
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC2
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_2
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_2
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC3
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_3
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_3
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC4
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_4
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_4
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC5
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_5
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_5
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
object {
	obj_name=DeCode_Segment
	exe_name=CODE_BLOC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_decodLDPC0
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=wimax_decodLDPC1
	}
	inputs {
		name=input_2
		remote_itf=output_0
		remote_obj=wimax_decodLDPC2
	}
	inputs {
		name=input_3
		remote_itf=output_0
		remote_obj=wimax_decodLDPC3
	}
	inputs {
		name=input_4
		remote_itf=output_0
		remote_obj=wimax_decodLDPC4
	}
	inputs {
		name=input_5
		remote_itf=output_0
		remote_obj=wimax_decodLDPC5
	}

	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC
	}
	inputs {
		name=input_7
		remote_itf=output_3
		remote_obj=MAC
	}
}
########################################
#######################################################################
object {
	obj_name=UNCRC
	exe_name=CRC
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DATASOURCESINK 
	}
}
#######################################################################
