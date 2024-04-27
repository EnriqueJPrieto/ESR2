#######################################################################
object {
	obj_name=MIB_GEN_TX
	exe_name=MIB_GEN
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=CRC_PBCH
	}
		
}

#######################################################################
#######################################################################
object {
	obj_name=CRC_PBCH
	exe_name=5G_CRC_PBCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MIB_GEN_TX
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_INTERLEAVER_PBCH
	}
		
}

#######################################################################
#######################################################################
object {
	obj_name=5G_INTERLEAVER_PBCH
	exe_name=5G_INTERLEAVER_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CRC_PBCH
	}
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=POLAR_ENC_PBCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=POLAR_ENC_PBCH
	exe_name=5G_POLAR_ENC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=5G_INTERLEAVER_PBCH
	}

	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=POLAR_DEC_PBCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=POLAR_DEC_PBCH
	exe_name=5G_POLAR_DEC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=POLAR_ENC_PBCH
	}
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_DEINTERLEAVER_PBCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=5G_DEINTERLEAVER_PBCH
	exe_name=5G_INTERLEAVER_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=POLAR_DEC_PBCH
	}
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC_PBCH
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=UNCRC_PBCH
	exe_name=5G_CRC_PBCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=5G_DEINTERLEAVER_PBCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MIB_GEN_RX
	}
		
}

#######################################################################
#######################################################################
object {
	obj_name=MIB_GEN_RX
	exe_name=MIB_GEN
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UNCRC_PBCH
	}
		
}

#######################################################################
