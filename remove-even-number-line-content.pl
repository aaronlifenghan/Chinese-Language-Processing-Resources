#!/usr/bin/perl -w  
########################################################################################################################################################################################
##    For a detailed description of this evaluation metric and source code, please read:                                                                                           #####
##    This code is to implement the Machine Translation Evaluation metric LEPOR                                                                                                    #####
##    LEPOR evaluation metric is proposed by Aaron Li-Feng Han, Derek Fai Wong, and Lidia Sam Chao in University of Macau                                                          #####
##    This perl code is  written by Aaron Li-Feng Han in university of macau, 2012.03                                                                                              #####
##    All Copyright (c) preserved by the authors. Corresponding author: Aaron Li-Feng Han < hanlifengaaron@gmail.com >                                                             #####
##    Please cite paper below if you use the metric or source code in your research work                                                                                           #####
##    "LEPOR: A Robust Evaluation Metric for Machine Translation with Augmented Factors". 2012. Aaron Li-Feng Han, Derek F. Wong and Lidia S. Chao. Proceedings of the             #####
##    24th International Conference on Computational Linguistics (COLING 2012): Posters, pages 441–450, Mumbai, December 2012. Association for Computational LinguisticsDecember   #####
##    Source code website:https://github.com/aaronlifenghan/aaron-project-lepor https://code.google.com/p/aaron-project-lepor/                                                     #####
##     online paper: http://aclweb.org/anthology-new/C/C12/C12-2044.pdf                                                                                                            #####
########################################################################################################################################################################################
##    How to use this Perl code and how to assign the parameter weights of Precision and Recall:                                                                                   #####
##    1. Your system output translation documents and the reference translation document should contain the plain text only, each line containing one sentence.                    #####
##    2. Put you system output translation documents under the address in Line 24, 52, 54 of this Perl code.                                                                       #####
##    3. Put you reference translation document under the address in Line 28 of this Perl code.                                                                                    #####
##    4. Tune the Precision and Recall weights of LEPOR by the parameter value of a under the address in Line 163 of this Perl code.                                               #####
##    5. The document containing evaluation score of LEPOR will be shown under the address in Line 55 of this Perl code.                                                           #####
##                                                                                                                                                                                 #####
########################################################################################################################################################################################

open REF,"<:encoding(utf8)","Store-test-result_GraChineseCTB7-ori_7_smoothing-clear.txt" or die "can't open reference file\n"; ## this file address puts reference translation document##
		$j=0;
		$str1="";
		@arry_r1=();
		$num_of_ref_sentence=0;
		while($str1=<REF>)               #### put the reference translation into a two dimension array @arrytwo_ref_translation
			{
#				chomp($str1);
				$arry_r1[$j]= $str1;
				$j++;
				$str1= "";
			}
		$num_of_ref_sentence=$j;

open RESULT,">:encoding(utf8)","Store-test-result_GraChineseCTB7-ori_7_smoothing-clear-word" or die "can't open result file\n"; ## this file address puts reference translation document##
		for($k=0;$k<$num_of_ref_sentence;$k=$k+2)
			{
				print RESULT $arry_r1[$k];
				
			}
close RESULT;
close REF;

