object {
	obj_name=MAC
	exe_name=MAC_LAYER
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=DATASOURCESINK
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
		remote_obj=LDPC5G_ENCODER
	}
	
}
########################################
########################################
object {
	obj_name=LDPC5G_ENCODER
	exe_name=LDPC5G_ENCODER
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=Code_Segment
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
		remote_obj=LDPC5G_ENCODER
	}
	inputs {
		name=input_1
		remote_itf=output_4
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=CHAN_NOISE	
	}
}
########################################
################################################################################
object {
	obj_name=CHAN_NOISE
	exe_name=channel_noise
	force_pe=2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_16QAM
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_16QAM	
	}
}

################################################################################
###################################################################DEMOD16QA
object {
	obj_name=DEMOD_16QAM
	exe_name=MOD_QAM
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CHAN_NOISE
	}
	inputs {
		name=input_1
		remote_itf=output_5
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=LDPC5G_DECODER
	}
}
########################################
########################################
object {
	obj_name=LDPC5G_DECODER
	exe_name=LDPC5G_DECODER
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
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
		remote_obj=LDPC5G_DECODER
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
	force_pe=0
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

