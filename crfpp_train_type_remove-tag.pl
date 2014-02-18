#!/usr/bin/perl -w
#############################################################################################################################################################################################################
##    For a detailed description of this source code, please read:                                                                                                                                      #####
##    This code is to convert the tab symbol to space symbol for the CityU-SIGHAN2008 testing result using the CRF++ tool (https://code.google.com/p/crfpp/) for next converting into reference type.   #####
##    This perl code is  written by Aaron Li-Feng Han in university of macau, 2012                                                                                                                      #####
##    All Copyright (c) reserved by the authors. Corresponding author: Aaron Li-Feng Han < hanlifengaaron AT gmail DOT com >                                                                            #####
##                                                                                                                                                                                                      #####
##    Please cite paper below if you use the source code in your research and want to acknowledge the authors                                                                                           #####
##    "Chinese Named Entity Recognition with Conditional Random Fields in the Light of Chinese Characteristics". 2013. Aaron Li-Feng Han, Derek Fai Wong and Lidia Sam Chao.                            #####
##    Language Processing and Intelligent Information Systems. Lecture Notes in Computer Science Volume 7912, 2013, pp 57-68. M.A. Klopotek et al. (Eds.): IIS 2013.                                    #####
##    Springer-Verlag Berlin Heidelberg 2013. http://dx.doi.org/10.1007/978-3-642-38634-3_8                                                                                                             #####
##                                                                                                                                                                                                      #####
##    Or "A Study of Chinese Word Segmentation Based on the Characteristics of Chinese". 2013. Aaron Li-Feng Han, Derek F. Wong, Lidia S. Chao, Liangye He, Ling Zhu and Shuo Li.                       #####
##    Language Processing and Knowledge in the Web. Lecture Notes in Computer Science Volume 8105, 2013, pp 111-118. Volume Editors: Iryna Gurevych, Chris Biemann and Torsten Zesch.                   #####
##    Springer-Verlag Berlin Heidelberg 2013. http://dx.doi.org/10.1007/978-3-642-40722-2_12                                                                                                            #####
##                                                                                                                                                                                                      #####
##    Source code and detailed works website: https://github.com/aaronlifenghan#!                                                                                                                       #####
#############################################################################################################################################################################################################
##    How to use this Perl code.                                                                                                                                                                        #####
##    1. Put you original documents under the address in Line 35 of this Perl code.                                                                                                                     #####
##    2. The result document will be shown under the address in Line 36 of this Perl code.                                                                                                              #####
##                                                                                                                                                                                                      #####
#############################################################################################################################################################################################################


use utf8;  
use Encode;  
use Encode::CN;
#use strict;


open WORDLIST,"<:encoding(UTF-8)","bake3-cityu-labeled-all.unix-subdevelop" or die "can't open train_utf16.ner\n";
open MAKE_DIC,">:encoding(UTF-8)","bake3-cityu-labeled-all.unix-subdevelop-removetag" or die "can't open name_list.txt\n";
while(<WORDLIST>)
	{
		#chomp;
		s/\t/ /g;
		s/0//g;
		s/B-PER//g;
		s/I-PER//g;
		s/B-LOC//g;
		s/I-LOC//g;
		s/B-ORG//g;
		s/I-ORG//g;
		
		
		# s/B-LOC//g;
		# s/I-LOC//g;
		# s/B-ORG//g;
		# s/I-ORG//g;
		# s/B-PER//g;
		# s/I-PER//g;
		
		# #if(($_ =~ m/B/)||($_ =~ m/I/))
		# #	{
				print MAKE_DIC $_;
		#		print MAKE_DIC "\n";
				
		#	}
	}

close (WORDLIST);
close (MAKE_DIC);

