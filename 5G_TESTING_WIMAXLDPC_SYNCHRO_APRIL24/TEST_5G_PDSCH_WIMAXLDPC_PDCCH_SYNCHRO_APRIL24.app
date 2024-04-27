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
		remote_itf=input_7
		remote_obj=RATE_MATCH
	}
	
	outputs {
		name=output_4
		remote_itf=input_1
		remote_obj=MOD_16QAM
	}
	
	outputs {
		name=output_6
		remote_itf=input_1
		remote_obj=Code_Segment
	}
	outputs {
		name=output_8
		remote_itf=input_1
		remote_obj=MAPPING
	}
	
	outputs {
		name=output_10
		remote_itf=input_1
		remote_obj=SCRAMBLING_F_C
	}
	


	#PDCCH
	
	outputs {
		name=output_16
		remote_itf=input_2
		remote_obj=POLAR_ENC
	}
	outputs {
		name=output_2
		remote_itf=input_1
		remote_obj=SCRAMBLING_PDCCH
	}

	outputs {
		name=output_17
		remote_itf=input_1
		remote_obj=RATE_MATCH_PDCCH
	}


	outputs {
		name=output_19
		remote_itf=input_1
		remote_obj=POLAR_ENC
	}

	
	outputs {
		name=output_21
		remote_itf=input_1
		remote_obj=MOD_PDCCH
	}


	outputs {
		name=output_24
		remote_itf=input_0
		remote_obj=CRC_PDCCH
	}
	outputs {
		name=output_23
		remote_itf=input_1
		remote_obj=CRC_PDCCH
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
		remote_obj=wimax_ENCODLDPC0
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC1
	}
	outputs {
		name=output_2
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC2
	}
	outputs {
		name=output_3
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC3
	}
	outputs {
		name=output_4
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC4
	}
	outputs {
		name=output_5
		remote_itf=input_0
		remote_obj=wimax_ENCODLDPC5
	}
	
}
########################################
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC0
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	force_pe=1
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC1
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC2
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_2
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_2
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC3
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_3
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_3
		remote_obj=RATE_MATCH
		bw=10
	}
}
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC4
	exe_name=WIMAX_ENC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_4
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_4
		remote_obj=RATE_MATCH
		bw=10
	}
}

########################################
#######################################################################ENCODLDPC
object {
	obj_name=wimax_ENCODLDPC5
	exe_name=WIMAX_ENC_ALOE16
	#proc=10
	force_pe=0
	
	inputs {
		name=input_0
		remote_itf=output_5
		remote_obj=Code_Segment
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_5
		remote_obj=RATE_MATCH
		bw=10
	}
}

########################################
########################################
object {
	obj_name=RATE_MATCH
	exe_name=RATE_MATCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC0
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC1
	}
	inputs {
		name=input_2
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC2
	}
	inputs {
		name=input_3
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC3
	}
	inputs {
		name=input_4
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC4
	}
	inputs {
		name=input_5
		remote_itf=output_0
		remote_obj=wimax_ENCODLDPC5
	}
	inputs {
		name=input_7
		remote_itf=output_1
		remote_obj=MAC
	}
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SCRAMBLING_F_C
	}
	
}
########################################
########################################
object {
	obj_name=SCRAMBLING_F_C
	exe_name=SCRAMBLING_F_C
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RATE_MATCH
	}
	inputs {
		name=input_1
		remote_itf=output_10
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MOD_16QAM	
	}
}
##################################################################
########################################
object {
	obj_name=MOD_16QAM
	exe_name=MOD_QAM
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SCRAMBLING_F_C
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
###################################################################DEMOD16QAM
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
		remote_itf=output_8
		remote_obj=MAC
	}
	inputs {
		name=input_2
		remote_itf=output_0
		remote_obj=PDCCH_Buff
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=IFFT
	}

}
###################################################################
################################################################################
object {
	obj_name=IFFT
	exe_name=FFT_IFFT
	force_pe=2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MAPPING
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=ADD_CP	
	}
	
}
################################################################################
################################################################################
object {
	obj_name=ADD_CP
	exe_name=CICLIC_PREFIX
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=IFFT
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DISTOR_CHANNEL	
	}
}
###################################################################
################################################################################
object {
	obj_name=DISTOR_CHANNEL
	exe_name=CPLX_FILTER
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=ADD_CP
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SYNCRO	
	}

}
################################################################################
###################################################################
###################################################################
###################################################################
###################################################################
###################################################################

			#CHANNEL

###################################################################
###################################################################
###################################################################
###################################################################
###################################################################
################################################################################
object {
	obj_name=SYNCRO
	exe_name=SYNCRO
	force_pe=2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DISTOR_CHANNEL
	}
	inputs {
		name=input_1
		remote_itf=output_13
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=REMOVE_CP	
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=MAC_RX_DL	
	}
	
	
}
###################################################################DEMOD16QA
################################################################################
object {
	obj_name=REMOVE_CP
	exe_name=CICLIC_PREFIX
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SYNCRO
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=FFT	
	}
}
###################################################################DEMOD16QA
################################################################################
object {
	obj_name=FFT
	exe_name=FFT_IFFT
	force_pe=1
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=REMOVE_CP
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMAPPING	
	}
}
###################################################################DEMOD16QAM
object {
	obj_name=DEMAPPING
	exe_name=MAPPING_V2
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=FFT
	}
	inputs {
		name=input_1
		remote_itf=output_12
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMAP_Buff
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=DEMOD_PDCCH
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
		remote_itf=output_6
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DEMOD_16QAM
	}
}
########################################
###################################################################DEMOD16QA
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
		remote_itf=output_9
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DESCRAMBLING_F_C
	}
}
########################################
########################################
object {
	obj_name=DESCRAMBLING_F_C
	exe_name=SCRAMBLING_F_C
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_16QAM
	}
	inputs {
		name=input_1
		remote_itf=output_10
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UN_RATE_MATCH	
	}
}
##################################################################
########################################
object {
	obj_name=UN_RATE_MATCH
	exe_name=RATE_MATCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DESCRAMBLING_F_C
	}
	inputs {
		name=input_1
		remote_itf=output_8
		remote_obj=MAC_RX_DL
	}
	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=wimax_decodLDPC0
	}
	outputs {
		name=output_1
		remote_itf=input_0
		remote_obj=wimax_decodLDPC1
	}
	outputs {
		name=output_2
		remote_itf=input_0
		remote_obj=wimax_decodLDPC2
	}
	outputs {
		name=output_3
		remote_itf=input_0
		remote_obj=wimax_decodLDPC3
	}
	outputs {
		name=output_4
		remote_itf=input_0
		remote_obj=wimax_decodLDPC4
	}
	outputs {
		name=output_5
		remote_itf=input_0
		remote_obj=wimax_decodLDPC5
	}
	
}
########################################
#####################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC0
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DeCode_Segment
		bw=10
	}
}
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC1
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_1
		remote_obj=DeCode_Segment
		bw=10
	}
}
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC2
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_2
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_2
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC3
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_3
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_3
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC4
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_4
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_4
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
#######################################################################DECODE_LDPC
object {
	obj_name=wimax_decodLDPC5
	exe_name=WIMAX_DEC_ALOE16
	proc=10
	
	inputs {
		name=input_0
		remote_itf=output_5
		remote_obj=UN_RATE_MATCH
		bw=10
	}	
	outputs {
		name=output_0
		remote_itf=input_5
		remote_obj=DeCode_Segment
		bw=10
	}
}

########################################
object {
	obj_name=DeCode_Segment
	exe_name=CODE_BLOC
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=wimax_decodLDPC0
	}
	inputs {
		name=input_1
		remote_itf=output_0
		remote_obj=wimax_decodLDPC1
	}
	inputs {
		name=input_2
		remote_itf=output_0
		remote_obj=wimax_decodLDPC2
	}
	inputs {
		name=input_3
		remote_itf=output_0
		remote_obj=wimax_decodLDPC3
	}
	inputs {
		name=input_4
		remote_itf=output_0
		remote_obj=wimax_decodLDPC4
	}
	inputs {
		name=input_5
		remote_itf=output_0
		remote_obj=wimax_decodLDPC5
	}

	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=UNCRC
	}
	inputs {
		name=input_7
		remote_itf=output_7
		remote_obj=MAC_RX_DL
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
#######################################################################
#######################################################################
#######################################################################


#			       PDCCH


#######################################################################
#######################################################################
#######################################################################
#######################################################################
#######################################################################




#######################################################################
object {
	obj_name=CRC_PDCCH
	exe_name=CRC_PDCCH
	inputs {
		name=input_0
		remote_itf=output_24
		remote_obj=MAC
	}
	inputs {
		name=input_1
		remote_itf=output_23
		remote_obj=MAC
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
	inputs {
		name=input_1
		remote_itf=output_19
		remote_obj=MAC
	}
	inputs {
		name=input_2
		remote_itf=output_16
		remote_obj=MAC
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
	inputs {
		name=input_1
		remote_itf=output_17
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=SCRAMBLING_PDCCH
	}
	
}
#######################################################################
########################################
object {
	obj_name=SCRAMBLING_PDCCH
	exe_name=SCRAMBLING_F_C
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=RATE_MATCH_PDCCH
	}
	inputs {
		name=input_1
		remote_itf=output_2
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MOD_PDCCH	
	}
}
##################################################################
#######################################################################
object {
	obj_name=MOD_PDCCH
	exe_name=MOD_QAM
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=SCRAMBLING_PDCCH
	}
	inputs {
		name=input_1
		remote_itf=output_21
		remote_obj=MAC
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=PDCCH_Buff
	}
}
###################################################################DEMOD16QA
object {
	obj_name=PDCCH_Buff
	exe_name=5G_Buffer_PDSCH
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=MOD_PDCCH
	}
	
	outputs {
		name=output_0
		remote_itf=input_2
		remote_obj=MAPPING
	}
}
########################################
#######################################################################
#######################################################################


			     #MAPPING


#######################################################################
#######################################################################
object {
	obj_name=DEMOD_PDCCH
	exe_name=MOD_QAM
	inputs {
		name=input_0
		remote_itf=output_1
		remote_obj=DEMAPPING
	}
	inputs {
		name=input_1
		remote_itf=output_5
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DESCRAMBLING_PDCCH
	}
	
}
#######################################################################
########################################
object {
	obj_name=DESCRAMBLING_PDCCH
	exe_name=SCRAMBLING_F_C
	force_pe=0
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_PDCCH
	}
	inputs {
		name=input_1
		remote_itf=output_11
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=DERATE_MATCH_PDCCH	
	}
}
##################################################################
#######################################################################
object {
	obj_name=DERATE_MATCH_PDCCH
	exe_name=5G_RATE_MATCH_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DESCRAMBLING_PDCCH
	}
	inputs {
		name=input_1
		remote_itf=output_4
		remote_obj=MAC_RX_DL
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
	inputs {
		name=input_1
		remote_itf=output_2
		remote_obj=MAC_RX_DL
	}
	inputs {
		name=input_2
		remote_itf=output_3
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=5G_DEINTERLEAVER_PDCCH
	}
	
}
#######################################################################
##############################################################################################################################################
object {
	obj_name=5G_DEINTERLEAVER_PDCCH
	exe_name=5G_INTERLEAVER_PDCCH
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=DEMOD_PDCCH
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
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=MAC_RX_DL
	}
	outputs {
		name=output_0
		remote_itf=input_0
		remote_obj=MAC_RX_DL
	}
	
}
#######################################################################
#######################################################################
object {
	obj_name=MAC_RX_DL
	exe_name=MAC_RX_DL
	inputs {
		name=input_0
		remote_itf=output_0
		remote_obj=UNCRC_PDCCH
	}
	inputs {
		name=input_1
		remote_itf=output_1
		remote_obj=SYNCRO
	}
	outputs {
		name=output_1
		remote_itf=input_1
		remote_obj=UNCRC_PDCCH
	}
	outputs {
		name=output_2
		remote_itf=input_1
		remote_obj=POLAR_DEC
	}
	outputs {
		name=output_3
		remote_itf=input_2
		remote_obj=POLAR_DEC
	}
	outputs {
		name=output_4
		remote_itf=input_1
		remote_obj=DERATE_MATCH_PDCCH
	}
	outputs {
		name=output_5
		remote_itf=input_1
		remote_obj=DEMOD_PDCCH
	}
	outputs {
		name=output_6
		remote_itf=input_1
		remote_obj=DEMAP_Buff
	}
	outputs {
		name=output_7
		remote_itf=input_7
		remote_obj=DeCode_Segment
	}
	outputs {
		name=output_8
		remote_itf=input_1
		remote_obj=UN_RATE_MATCH
	}
	outputs {
		name=output_9
		remote_itf=input_1
		remote_obj=DEMOD_16QAM
	}
	outputs {
		name=output_10
		remote_itf=input_1
		remote_obj=DESCRAMBLING_F_C
	}

	outputs {
		name=output_11
		remote_itf=input_1
		remote_obj=DESCRAMBLING_PDCCH
	}
	outputs {
		name=output_12
		remote_itf=input_1
		remote_obj=DEMAPPING
	}
	outputs {
		name=output_13
		remote_itf=input_1
		remote_obj=SYNCRO
	}	

}
########################################
