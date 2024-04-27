#######################################################################
object {
	obj_name=DCI_parser
	exe_name=DCI_PARSER
	force_pe=2
	
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
	force_pe=2
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DCI_parser
	}
	
}
#######################################################################
