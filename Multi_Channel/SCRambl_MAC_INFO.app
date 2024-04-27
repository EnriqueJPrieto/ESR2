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
		remote_itf=input_0
		remote_obj=Buffer
	}	
	outputs {
		name=output_2
		remote_itf=input_1
		remote_obj=Code_Segment
	}
}


########################################
########################################
object {
	obj_name=Buffer
	exe_name=Buffer2
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=DeCode_Segment
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
		remote_itf=output_2
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
	exe_name=SCRAMBLING
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=Code_Segment
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DESCRAMBLING
	}
}
########################################
########################################
object {
	obj_name=DESCRAMBLING
	exe_name=SCRAMBLING
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SCRAMBLING
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
		remote_obj=Code_Segment
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=Buffer
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC
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
		remote_obj=Code_Segment
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DATASOURCESINK 
	}
}
#######################################################################
