########################################
object {
	obj_name=SOURCE_SINK
	exe_name=data_source_sink
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_decodLDPC
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
		remote_obj=SOURCE_SINK
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MOD_16QAM
		bw=10
	}
}
#######################################################################ENCODLDPC
########################################
object {
	obj_name=MOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC
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
		remote_obj=DEMOD_16QAM
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=wimax_decodLDPC
	}
}
####################################################################DEMOD16QAM
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SOURCE_SINK
		bw=10
	}
}
#######################################################################DECODE_LDPC
###

