#######################################################################
object {
	obj_name=DCI_parser
	exe_name=DCI_PARSER
	force_pe=0
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=CRC_PDCCH
	}
	
}
#######################################################################
########################################
object {
	obj_name=CRC_PDCCH
	exe_name=CRC_PDCCH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DCI_parser
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC_PDCCH
	}
}
########################################
#######################################################################
object {
	obj_name=UNCRC_PDCCH
	exe_name=CRC_PDCCH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CRC_PDCCH
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DCI_parser_rx 
	}
}
#######################################################################
#######################################################################
object {
	obj_name=DCI_parser_rx
	exe_name=DCI_PARSER
	force_pe=0
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UNCRC_PDCCH
	}
	
}
#######################################################################
