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
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_2
		remote_itf=input_2
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_3
		remote_itf=input_3
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_4
		remote_itf=input_4
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_5
		remote_itf=input_5
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
		remote_itf=output_1
		remote_obj=Code_Segment
	}
	inputs {
		name=input_2
		remote_itf=output_2
		remote_obj=Code_Segment
	}
	inputs {
		name=input_3
		remote_itf=output_3
		remote_obj=Code_Segment
	}
	inputs {
		name=input_4
		remote_itf=output_4
		remote_obj=Code_Segment
	}
	inputs {
		name=input_5
		remote_itf=output_5
		remote_obj=Code_Segment
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
