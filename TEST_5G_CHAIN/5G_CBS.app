#########################################################################REPORT

#object {
#	obj_name=5G_TBSD
#	exe_name=5G_TBSD
#	force_pe=0
#	outputs {
#		name=output_0
#		remote_itf=input_0
#		remote_obj=SOURCE_SINK
#	}
#}

########################################
object {
	obj_name=SOURCE_SINK
	exe_name=data_source_sink
	force_pe=0
#	inputs {
#		name=input_0
#		remote_itf=output_0
#		remote_obj=5G_TBSD
#	}
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
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SOURCE_SINK
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_CBS
	}
}
########################################
########################################
object {
	obj_name=5G_CBS
	exe_name=5G_CBSegment
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=CRC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_CBDesegment
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=5G_CBDesegment
	}
}
########################################
#########################################################################UNCRC
#object {
#	obj_name=UNCRC
#	exe_name=CRC
#	force_pe=0
#	inputs {
#		name=input_0
#		remote_itf=output_0
#		remote_obj=5G_CBS
#	}
#	inputs {
#		name=input_1
#		remote_itf=output_1
#		remote_obj=5G_CBS
#	}
#}
#######################################################################UNCRC
########################################
object {
	obj_name=5G_CBDesegment
	exe_name=5G_CBDesegment
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=5G_CBS
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=5G_CBS
	}
}
########################################
