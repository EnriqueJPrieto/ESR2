#######################################################################
object {
	obj_name=MAC_TX
	exe_name=MAC_LAYER
	outputs {
		name=output_8
		remote_itf=input_0
		remote_obj=CRC_PDCCH
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=MOD_PDCCH
	}
	outputs {
		name=output_2
		remote_itf=input_1
		remote_obj=DEMOD_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=CRC_PDCCH
	exe_name=CRC_PDCCH
	inputs {
		name=input_0
		remote_itf=output_8
		remote_obj=MAC_TX
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_INTERLEAVER_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=5G_INTERLEAVER_PDCCH
	exe_name=5G_INTERLEAVER_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CRC_PDCCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=POLAR_ENC
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=POLAR_ENC
	exe_name=5G_POLAR_ENC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=5G_INTERLEAVER_PDCCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RATE_MATCH_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=RATE_MATCH_PDCCH
	exe_name=5G_RATE_MATCH_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=POLAR_ENC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MOD_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=MOD_PDCCH
	exe_name=MOD_QAM
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RATE_MATCH_PDCCH
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=MAC_TX
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=BUFFER_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=BUFFER_PDCCH
	exe_name=BUFFER_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_PDCCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=DEMOD_PDCCH
	exe_name=MOD_QAM
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=BUFFER_PDCCH
	}
	inputs {
		name=input_1
		remote_itf=output_2
		remote_obj=MAC_TX
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DERATE_MATCH_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=DERATE_MATCH_PDCCH
	exe_name=5G_RATE_MATCH_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_PDCCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=POLAR_DEC
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=POLAR_DEC
	exe_name=5G_POLAR_DEC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DERATE_MATCH_PDCCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_DEINTERLEAVER_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=5G_DEINTERLEAVER_PDCCH
	exe_name=5G_INTERLEAVER_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=POLAR_DEC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC_PDCCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=UNCRC_PDCCH
	exe_name=CRC_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=5G_DEINTERLEAVER_PDCCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MAC_RX
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=MAC_RX
	exe_name=MAC_LAYER
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UNCRC_PDCCH
	}
	
}
#######################################################################
