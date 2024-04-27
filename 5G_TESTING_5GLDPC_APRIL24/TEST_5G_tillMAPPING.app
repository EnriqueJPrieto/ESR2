object {
	obj_name=MAC
	exe_name=5G_MAC_LAYER
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=DATASOURCESINK
	}
			
	outputs {
		name=output_6
		remote_itf=input_1
		remote_obj=Code_Segment
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
		name=output_7
		remote_itf=input_7
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_8
		remote_itf=input_7
		remote_obj=RATE_MATCH
	}
	outputs {
		name=output_9
		remote_itf=input_1
		remote_obj=DERATE_MATCH
	}
	outputs {
		name=output_10
		remote_itf=input_1
		remote_obj=MAPPING
	}
	outputs {
		name=output_11
		remote_itf=input_1
		remote_obj=DEMAPPING
	}
	outputs {
		name=output_12
		remote_itf=input_1
		remote_obj=DEMAP_Buff
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
	exe_name=5G_CRC_PDSCH
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
	exe_name=5G_CODE_BLOCK
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
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=LDPC5G_ENCODER
	}
		

}
########################################
########################################
object {
	obj_name=LDPC5G_ENCODER
	exe_name=LDPC5G_ENCODER
	force_pe=0
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
		
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RATE_MATCH
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=RATE_MATCH
	}
	

}
########################################
########################################
object {
	obj_name=RATE_MATCH
	exe_name=5G_RATE_MATCH_PDSCH
	force_pe=2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=LDPC5G_ENCODER
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=LDPC5G_ENCODER
	}
	inputs {
		name=input_7
		remote_itf=output_8
		remote_obj=MAC
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
		remote_obj=RATE_MATCH
	}
	inputs {
		name=input_1
		remote_itf=output_4
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MAPPING	
	}
}
###################################################################MOD16QAM
###################################################################MAPPING
object {
	obj_name=MAPPING
	exe_name=MAPPING_V2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_16QAM
	}
	inputs {
		name=input_1
		remote_itf=output_10
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMAPPING
	}
}
###################################################################
object {
	obj_name=DEMAPPING
	exe_name=MAPPING_V2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MAPPING
	}
	inputs {
		name=input_1
		remote_itf=output_11
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMAP_Buff
	}
}
###################################################################DEMOD16QA
object {
	obj_name=DEMAP_Buff
	exe_name=5G_Buffer_PDSCH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMAPPING
	}
	inputs {
		name=input_1
		remote_itf=output_12
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_16QAM
	}
}
########################################





########################################
object {
	obj_name=DEMOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMAP_Buff
	}
	inputs {
		name=input_1
		remote_itf=output_5
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DERATE_MATCH	
	}
}
###################################################################DEMOD16QAM
########################################
object {
	obj_name=DERATE_MATCH
	exe_name=5G_RATE_MATCH_PDSCH
	force_pe=2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
	}
	inputs {
		name=input_1
		remote_itf=output_9
		remote_obj=MAC
	}
		
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=LDPC5G_DECODER
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=LDPC5G_DECODER
	}
	

}
########################################
########################################
object {
	obj_name=LDPC5G_DECODER
	exe_name=LDPC5G_DECODER
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DERATE_MATCH
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=DERATE_MATCH
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

}
########################################
########################################
object {
	obj_name=DeCode_Segment
	exe_name=5G_CODE_BLOCK
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=LDPC5G_DECODER
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=LDPC5G_DECODER
	}
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC
	}
	inputs {
		name=input_7
		remote_itf=output_7
		remote_obj=MAC
	}
}
########################################
#######################################################################
object {
	obj_name=UNCRC
	exe_name=5G_CRC_PDSCH
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


