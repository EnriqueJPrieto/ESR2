#######################################################################
object {
	obj_name=MAC_TX
	exe_name=MAC_LAYER
	outputs {
		name=output_8
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
		remote_itf=output_8
		remote_obj=MAC_TX
	}
	
}
#######################################################################
