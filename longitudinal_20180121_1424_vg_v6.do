STOP

/**

Introduction to Longitudinal Analysis, 

Q-Step,University of Warwick,(January 2018)



AQMEN [Data Science for Social Research], University of Edinburgh

This Stata file should be used in conjection with

Gayle V. and Lambert P. (2018) What is Quantitative Longitudinal Data Analysis?
                               Bloomsbury Publishing.


		**********************************************
		*                                            *
		* IT IS IMPORTANT THAT YOU READ THIS FILE.   *
		* FOLLOW INSTRUCTIONS LINE BY LINE!          *
		*                                            *
		**********************************************

		
********************************************************************************

Latest Update:

21st January 2018 The Kinks bassist Jim Rodford has dies at the age of 76.

Previous Updates: 

20th January 2018 Alan Carr gets married to long-term boyfriend in LA.

********************************************************************************



This is a two-day hands-on training workshop led by 
Professor Vernon Gayle, University of Edinburgh.



This two-day workshop is an intermediate level course. 

It is aimed at researchers who already use Stata for analysis of social surveys 
or administrative social science datasets. 

The workshop will introduce techniques for analysing longitudinal data.

The course will involve short professional demonstrations followed 
by participants practising in short sessions throughout the day.

		
It is intended for people who have prior experience of working with Stata.

The workshop is aimed at social science researchers who are experienced Stata
users but who want to develop their experise in longitudinal data analysis.

Please adjust your expectations - this is a two day course.

The instructors have been working with Stata and undertaking statistical
analyses for many years and they are all still learning and improving their 
skills. 

It will NOT be possible to learn everthing in two days.

Please be patient. Computers often go wrong.

Please asks the tutors for help.

Not all of your questions will be answered but we will help as much as we can.

Good luck.


********************************************************************************

Course Content:

The following topics will be covered (but possibly not in this order):

1. The Workflow
 	Setting Up Stata and Your Directory Structure
	Locating Directories
	Installing Packages 

2. The Analysis of Duration Data

3. The Analysis of Repeated Contacts Data (Panel Models)

4. The Analysis of Repeated Contacts Data (Binary Outcomes)

5. Comparing Panel Models

6. Panel Data Constuction (with loops)

7. Panel Data Constuction Exercise

********************************************************************************

WARNING!

No research micro data will be distributed during this workshop.

The files required are available via the web.

Participants MAY NOT make copies of these files or distribute them.

The files have been specifically created by AQMEN for training 
and MUST not be used for social science research.

THE DATA ARE NOT REAL! DO NOT USE THEM FOR REAL ANALYSES!

We advise that participants galvanise their training experience and
work with 'genuine' data files which they can dowload legally from the 
UK Data Service (http://ukdataservice.ac.uk/ -
the old site is www.esds.ac.uk but you will be redirected).

At workshops where real survey datasets are used participants MUST sign 
a data access agreement.

Real administrative data are never used in training settings.

********************************************************************************

© Vernon Gayle, University of Edinburgh.

This file has been produced for AQMEN.

Any material in this file must not be reproduced, 
published or used for teaching without permission from Professor Vernon Gayle. 

Many of the ideas and examples presented in this document draw heavily on
previous work (see especially www.longitudinal.stir.ac.uk). 
We are grateful for the comments and feedback from participants of 
earlier workshops. 

Over the last decade and a half much of this material has been developed in close 
collaboration with Professor Paul Lambert, Stirling University. 
However, Professor Gayle is responsible for any errors in this file.

Professor Vernon Gayle (vernon.gayle@ed.ac.uk) 


********************************************************************************

Commands in this file are illustrated as if using a memory stick (USB).

For illustration this is called "E:\" you may need to change this location.

In your work environment you will probably use a network location
such as your "M:\" drive.

When using Stata at you own University you will have to change this to the 
correct location.

This file was initially prepared using Stata 14.0 for Windows.

Stata is continually being improved. This means that programs and do-files 
written for older versions might stop working.

It is possible to specify the version of Stata that you are using at the 
top of programs and do-files.

e.g.  version 10

Some of the commands that are used in this file may NOT run on small versions 
of Stata. 

********************************************************************************

We suggest that you make a copy of this file.


		**********************************************
		*                                            *
		* IT IS IMPORTANT THAT YOU READ THIS FILE.   *
		* FOLLOW INSTRUCTIONS LINE BY LINE!          *
		*                                            *
		**********************************************


The file is sequential. It MUST be run line by line. 
Many of the commands will NOT run if earlier lines of commands have not been 
executed.


Anotate your new copy of the file as you work through it with your own notes 
(use "*" to comment out your notes).


********************************************************************************

**/


********************************************************************************
*
*                    The Workflow
*
********************************************************************************

/**

Read the paper on the workflow...

Gayle, V.J. and Lambert, P.S. (2017) 
The Workflow: A Practical Guide to Producing Accurate, Efficient, Transparent 
and Reproducible Social Survey Data Analysis. NCRM Working Paper. NCRM.
http://eprints.ncrm.ac.uk/4000/


**/

********************************************************************************
*
*                    Setting Up Stata and Your Directory Structure
*
********************************************************************************

* This section is about organising preliminary settings in Stata *

* clear the computer memory *

clear all

macro drop _all


/** 

more causes Stata to display --more-- and pause until any key is pressed. 
    It is usually more convenient to have this function switched off 
	
**/

set more off


/** 

Getting your directory structure in a consistent form is critical to efficient
working.

Most people wil already have established a directory structure on their own
machines or network areas.

We are not suggesting that you change your structure to any particular format.

We ARE suggesting however that you put some thought into your directory 
structure and consider how you could make it more CONSISTENT and how it might be
improved to assist your workflow.


In an example below we will organised a memory stick into a simple but 
effective directory sturture...

working
data_raw
data_clean
codebooks
logs
do_files
documents
figures
tables
trash
temp


Here is a version that is suggested by Scott Long...

www.indiana.edu/~jslsoc/stata/wf/misc/wf2-directory-design.xls		

Scott Long - Workflow Chapter 2 - designing a directory structure				
17/04/2008	

Task: Spend some time thinking about a suitable directory structure for one of your
current or forthcoming projects or for a major project such as you PhD.

**/

/**

Here are a few commands that will help you organise your directories.

**/

* display the path of the current working directory *

pwd

* change the working directory *

cd e:\

pwd

* make a new directory *

mkdir "e:\new_directory"

* take a look on the drive to check that the directory has been created *

* now remove this directory *

rmdir "e:\new_directory"


/** 

You can run the following block of commands or decide on your own directory
structure.

If you decide on your own structure you may have to change some locations later 
on in this workshop!

**/

mkdir "e:\working"
mkdir "e:\data_raw"
mkdir "e:\data_clean"
mkdir "e:\codebooks"
mkdir "e:\logs"
mkdir "e:\do_files"
mkdir "e:\documents"
mkdir "e:\figures"
mkdir "e:\tables"
mkdir "e:\trash"
mkdir "e:\temp"


/**

Task: Write a paragraph to justifying the directory structure that you have 
chosen.

**/

********************************************************************************


		**********************************************
		*                                            *
		* IT IS IMPORTANT THAT YOU READ THIS FILE.   *
		* FOLLOW INSTRUCTIONS LINE BY LINE!          *
		*                                            *
		**********************************************
		

********************************************************************************
*
*                    Locating Directories 
*
********************************************************************************


/** 

Locating files using macro commands is an extremely efficient practice. 

It tells Stata where to look for files on your machine or network.

**/

* make sure you run all of the following commands *

global path1 "e:\working\" 

/** 

the location of a working directory -  
where you can save newly created data files and output

**/

global path2 "e:\do_files\" 

* the location where your .do files will be saved *

global path3 "e:\data_raw\"

* the location where your raw (i.e. unprocessed) data is stored *

global path4 "e:\data_clean\"

* the location where your clean (i.e. processed) data is saved *

global path5 "e:\logs\"

* the location where your log files are saved *

global path6 "e:\codebooks\"

* the location where your codebooks are saved *

global path7 "e:\temp\"

* the location of a temporary folder where you can save intermediate files *


********************************************************************************

********************************************************************************
*
*                    Using Global Macros and Paths
*
********************************************************************************


/**

You will be familiar with the use command e.g.

use "c:\data.dta", clear 

Because you have already set path3 as "e:\data_raw\" you can use this macro 

to get the data file from the data_raw directory

use $path3\data.dta, clear 


At this stage you might feel a sensation like fish scales falling from your 
eyes, or you might hear a sound like pennies falling from hevean...

Defining paths as macros provides vital help for switching between machines, 
working in collaboration with colleagues and keeping track of where files came
from and where they end up!

**/


********************************************************************************

********************************************************************************
*
*                    Installing Packages
*
********************************************************************************

/**

Installing Packages in Stata:

A benefit of Stata is that new commands and functions are developed which can 
be incorporated into your current version of Stata. It is possible to acquire 
and manage downloads from the internet using the command net. 
The findit command can be used to search the Stata site and other sites for 
information. For example imagine that you heard about a program to draw graphs 
using quasi-variance estimates, then using the syntax findit qvgraph would lead 
you to the module written by Aspen Chen of the University of Connecticut. 

Many new packages are deposited at the Statistical Software Components (SSC) 
archive which is sometime called the Boston College Archive and is administered 
by http://repec.org . 

The SSC archive has become the premier Stata download site for user-written 
software and also archives proceedings of Stata Users Group meetings and 
conferences. Programmes can be downloaded from the SSC archive using the syntax
ssc install followed by the new programme’s name. 

Readers who do not have administrative access to Stata 
(for example when working on their university network), may first require 
permission to download packages. 

An alternative approach may be to set up an area locally where you have write 
access (e.g. c:\temp ) and then use the following Stata syntax

	global path10 "c:\temp\"
	capture mkdir $path10\stata
	capture mkdir $path10\stata\ado
	adopath +  $path10\stata\ado
	net set ado $path10\stata\ado

You can test this by installing a package from SSC for example the estout 
package

ssc install estout

Help on this new package should then be available

		help estout

This is a generic work around. In some circumstances depending on your
university and your machine this approach might not work too well.

**/


********************************************************************************


********************************************************************************

********************************************************************************
*
*                    Workshop Files
*
********************************************************************************

/**

The files for this workshop are available at

https://github.com/vernongayle/longitudinal_warwick

Use a web browser to view the github repo.

Click on the (green) Clone or download button.

Choose "Download zip".

Save the zipped up folder to your machine.

Choose a sensible location e.g. "e:\" where you can write to.

Move the .dta files to an appropriate directory e.g. "e:\data_raw\" .

Move the other files to sensible locations e.g. .do files to "e:\do_files" .

Task: Write some notes to help remind you.

**/


********************************************************************************
********************************************************************************
********************************************************************************

********************************************************************************
*
*                    Producing a Log
*
********************************************************************************


* keep clear log files containing your output *

* first close any log files that might already be running *

capture log close

/** 

we use the capture command because Stata will not report an error if there is
no log file to close

**/

capture log using "$path5\mylog_date_initials_v1.txt, replace text"


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    The Analysis of Duration Data
*
********************************************************************************



/**


1. This section uses a version of the college_skills.dta

it is located in the github repo 
 
https://github.com/vernongayle/longitudinal_warwick) 

but you should have already downloaded it in the zip file.

 
2. Make sure you have the file positioned it your raw data directory
   e.g. "e:\data_raw\"

3. You should have already run
   
   global path3 "e:\data_raw\"

   this sets the location where your raw (i.e. unprocessed) data is stored

**/



use "$path3\college_skills_20180121_vg_v1.dta", clear

/** if you get an error here - check that you've run the global command above *
    i.e. global path3 "e:\data_raw\"	
	or that you have the data in the correct folder!
	
**/

codebook id time test age no_jobs mooc campus quals1 quals2 quals3, compact


********************************************************************************
*
*	1. Investigate the time taken to pass the test
*
*
********************************************************************************


tab test, missing
mean time, over(test)

* stset -- Declare data to be survival-time data

stset time, failure(test)

summarize time, detail
stdes

/**

Task: Describe the dataset.

**/


********************************************************************************
*
*	2. Construct a Kaplan-Meir plot of taught by MOOC
*
*
********************************************************************************


* Kaplan-Meir

set scheme s1mono

#delimit ;
sts graph, by(mooc) 
 plot2opts(lpattern(-) lcolor(black))
 legend( order(1 "Standard Teaching" 2 "MOOC" ) ring(0) pos(2) )
  xtitle ("Analysis time (days)") 
 ytitle ("Proportion Surviving" " ")
 title(" ")
;

/**

Task: Interpret the plot.

**/

********************************************************************************
*
*	3. Undertake the logrank test for MOOC
*
*
********************************************************************************


sts test mooc, logrank

/**

Task: Is the test significant?

**/


********************************************************************************
*
*	4. Estimate a Cox model with age, number of jobs, mooc, campus 
*                              and qualifications
*
*      Report coefficients, not hazard ratios (nohr)
*
********************************************************************************

stcox age no_jobs mooc campus quals2 quals3, nohr

/**

Task: Interpret the results.

**/


********************************************************************************
*
*	5. Calculated the LR Chi-square test
*
*
********************************************************************************

display (-2*e(ll_0))-(-2*e(ll))

/**

Task: Is the test significant?

**/


********************************************************************************
*
*	6. Test the difference between qualifications levels 2 and level 3
*
*
********************************************************************************


test quals2 quals3

/**

Task: Is the test significant?

**/


********************************************************************************
*
*	7. Re-estimate the model with age, number of jobs and mooc
*
*      But this time report hazard ratios not coefficients
*
*
********************************************************************************

stcox age no_jobs mooc


********************************************************************************

/**

Task: Write some notes on duration estimating duration models using Stata.

**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    The Analysis of Repeated Contacts Data (Panel Models)
*
********************************************************************************

use "$path3\income_ft_male_panel_fake_20180121_vg_v4", clear


********************************************************************************

/**

This is not real BHPS data!

It is a palimpsest and MUST NEVER be used for real analysis.

TO USE BHPS data YOU MUST BE REGISTER WITH THE UK DATA ARCHIVE!

YOU MUST DOWNLOAD YOUR OWN COPY OF THE BRITISH HOUSEHOLD PANEL SURVEY.

Later you will construct your own BHPS Panel Data File.

********************************************************************************

Fist we will use this file

income_ft_male_panel_fake_20180121_vg_v4

It is not real BHPS data!

It is a palimpsest and MUST NEVER be used for real analysis.

This is a basic BHPS panel file

first 10 years 

25 - 35 year olds

'essex originals'

males 

working full-time

y var is  wPAYNU2 Usual net pay per month: current job
		
(now adjusted for inflation) 

**/

/**

********************************************************************************
*
*	1. Construct a codebook for 
*        pid wave zhid zpno zdoby zpaynu2 zjbhr zjbcssm pacssm graduate zregage
*
********************************************************************************
		 
**/

codebook pid wave zhid zpno zdoby ///
         zpaynu2 zjbhr zjbcssm pacssm graduate zregage, compact


********************************************************************************
*
*	2. Summarize pid wave zhid zpno zdoby zpaynu2 zjbhr zjbcssm pacssm graduate zregage, 
*
*
********************************************************************************

summarize pid wave zhid zpno zdoby ///
         zpaynu2 zjbhr zjbcssm pacssm graduate zregage

		 
********************************************************************************
*
*	3. Fix up the format for pid and zhid 
*
********************************************************************************

format pid zhid %25.0f


summarize pid wave zhid zpno zdoby ///
         zpaynu2 zjbhr zjbcssm pacssm graduate zregage, format


********************************************************************************
*
*	4. Estimate a pooled cross-sectional model on zpaynu2 
*      with the following explanatory variables
*
*         zjbhr zjbcssm pacssm graduate zregage wave   
*      
*      specifying wave as an indicator (dummy) variable 
*      (or factor variable) i.wave
*
*
********************************************************************************

reg zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav
estimates store reg


/**

Task: Interpret the model results.

**/


********************************************************************************
*
*	5. Calculate variance inflation estimates (vif)
*
*
********************************************************************************

vif

/**

Task: Interpret the estimates.

**/


********************************************************************************
*
*	6. Estimate a pooled cross-sectional model with robust standard errors
*      (Huber/White) on zpaynu2 
*      with the following explanatory variables
*
*         zjbhr zjbcssm pacssm graduate zregage i.wave 
*      
*
*
********************************************************************************

reg zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav, cluster(pid)
estimates store cluster


/**

Task: Interpret the model results.

**/


********************************************************************************
*
*	7. Compare the coefficients and standard errors in the standard pooled
*      cross-sectional model and the model with robust standard errors.
*      If possible use the esttab command to help you.
*      
*
*
********************************************************************************

esttab  reg cluster	, ///
       cells(b(star fmt(%9.3f))se(par) )  ///
       nonumbers mtitles("OLS" "Clustered")

/**

Task: Write some notes.

**/


********************************************************************************
*
*	8. Drop the cases that are not used in the analytical model.
*
*
********************************************************************************

gen model=1 if e(sample)==1 
tab model, missing
keep if model==1


********************************************************************************
*
*	9. Declare the dataset to be panel data.
*
*
********************************************************************************

xtset pid wave


/**

Task: Write some notes about the xtset command.

**/


********************************************************************************
*
*	10. Get a description of the panel data.
*
*
********************************************************************************

xtdes

/**

Task: What does this tell us about the structure of the data.

**/


********************************************************************************
*
*	11. Check the data for duplicates.
*
*
********************************************************************************

duplicates report pid wave


/**

Question: Are there any duplicates in the data?

**/


********************************************************************************
*
*	12. Get a summary of zpaynu2.
*
*
********************************************************************************

summarize zpaynu2
xtsum zpaynu2


/**
 
 Task: Interpret the output.
 
**/
 
 
********************************************************************************
*
*	13. Estimate a between effects model on zpaynu2 
*       with explanatory variables
*       zjbhr zjbcssm pacssm graduate zregage i.wav
*
*
********************************************************************************

xtreg zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav, be
estimates store be

/**
 
 Task: Interpret the output.
 
**/


********************************************************************************
*
*	14. Estimate a fixed effects model on zpaynu2 
*       with explanatory variables
*       zjbhr zjbcssm pacssm graduate zregage i.wav
*
*
********************************************************************************

xtreg zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav, fe
estimates store fe

/**
 
 Task: Interpret the output.
 
**/

********************************************************************************
*
*	15. Estimate a fixed effects model using the areg command
*       on zpaynu2 with explanatory variables
*       zjbhr zjbcssm pacssm graduate zregage i.wav
*
*
********************************************************************************

areg zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav, absorb(pid)

/**
 
 Task: Interpret the output.

 Question: What do you notice about the R Squared measure in the areg model?
 Why is this model sometimes called a LSDV model?	

**/
 

********************************************************************************
*
*	16. Estimate a random effects model on zpaynu2 
*       with explanatory variables
*       zjbhr zjbcssm pacssm graduate zregage i.wav
*
*
********************************************************************************

xtreg zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav, re
estimates store re

/**
 
 Task: Interpret the output.

**/

********************************************************************************
*
*	17. Calculate a Breusch and Pagan Lagrangian multiplier test for 
*       the random effects panel model
*
*
********************************************************************************

xttest0

/**

Question: Is the result significant?

**/


********************************************************************************
*
*	18. Display the coefficients and standard error for the
*       OLS, between effects, fixed effects and random effects model.
*       Hint: use the esttab command.
*
*
********************************************************************************

esttab reg be fe re	, ///
       cells(b(star fmt(%9.3f)) se(par))  ///
       nonumbers mtitles("OLS" "BE" "FE" "RE")
 
/**

Task: Interpret the results.

**/


********************************************************************************


********************************************************************************
*
*	19. Estimate a random effects model in a multilevel modelling framework.
*
*
********************************************************************************

/**

As an illustration we estimate a random effects model in the panel modelling
framework and in the multilvel modelling framework to compare them.

They are, of course, identical. But the output is slightly different.

**/

**/


xtreg zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav, re mle
est store remle1

* multilevel mixed-effects linear regression*

xtmixed zpaynu2 zjbhr zjbcssm pacssm graduate zregage i.wav|| pid:, noheader mle
est store xtmixed1


esttab remle1 xtmixed1, ///
se mtitles("Panel Random Effects" "Multilevel Random Effects") obslast

/**

Stata logs the sigma_u and sigma_e in the standard xtmixed output *

**/

display exp(5.881)
display exp(5.529)

/**

Task: Make some notes on these two models.

**/


********************************************************************************


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    The Analysis of Repeated Contacts Data 
*                    (Binary Outcomes)
*
********************************************************************************

/**

We will now illustrate a panel logistic regression model using a small teaching 
panel dataset, the Women’s Employment Dataset (wemp.dta).

The data mirror a real example of panel data analysis reported in 

Davies, R. B., Elias, P. and Penn, R. 1992. 
The relationship between a husband’s unemployment and his wife’s participation 
in the labour force. Oxford Bulletin of Economics and Statistics, 54(2), 145–71.

The dataset is a panel of 155 married women, who were observed for up to 
14 annual waves (1,580 rows of data). 


case "id"
femp "wife employment"
mune "husband unemployed"
time "year of observation-1975"
und1 "woman has a child aged under 1 year"
und5 "woman has a child aged under 5 years"
age  "woman's age"




**/

use "$path3\wemp_20180121_vg_v1.dta", clear

********************************************************************************
*
*	1. Construct a codebook for the data.
*
********************************************************************************
		 
**/

codebook, compact


********************************************************************************
*
*	2. Add labels to the variables.
*
********************************************************************************

label variable case "id"
label variable femp "wife employment"
label variable mune "husband unemployed"
label variable time "year of observation-1975"
label variable und1 "woman has a child aged under 1 year"
label variable und5 "woman has a child aged under 5 years"
label variable age  "woman's age"
codebook, compact


********************************************************************************
*
*	3. Construct a centred age variable for suitable for a regression model.
*
********************************************************************************

tab age, missing
capture drop regage
gen regage =age-18
tab regage, missing
corr age regage
label variable regage  "woman's age - 18"
codebook, compact


********************************************************************************
*
*	4. Estimate a standard pooled cross-sectional logistic regression model
*      of femp with mune und5 as dummy variables and regage as a covariate.
*
********************************************************************************

logit femp i.mune i.und5 regage

/**

Task: Interpret the results.

**/


********************************************************************************
*
*	5. Display the log likelihood of the fitted (i.e. current) model and the log
*      likelihood of the null model.
*
********************************************************************************

display e(ll) 
display e(ll_0)


********************************************************************************
*
*	6. Calculate the Likelihood Ratio Chi-Square for the fitted 
*      (i.e. current) model.
*
********************************************************************************

display (-2*e(ll_0))
display (-2*e(ll))
display (-2*e(ll_0))-(-2*e(ll))

/**

Question: Is the result significant?

**/


********************************************************************************
*
*	7. Display either the Cox-Snell or McFadden (adjusted) R-Squared 
*      for the fitted (i.e. current) model.
*
********************************************************************************

/**

You might need to install fitstat

net describe fitstat, from(http://fmwww.bc.edu/RePEc/bocode/f)

or findit fitstat

**/


fitstat

/**

Task: Make some notes on the goodness of fit measures.

**/


********************************************************************************
*
*	8. Display the marginal effects (adjusted predictions) for mune and und5.
*
********************************************************************************

margins mune und5, atmeans

/**

Task: Interpret the results.

**/


********************************************************************************
*
*	9. Estimate a standard pooled cross-sectional logistic regression model
*      of femp with mune und5 as dummy variables and regage as a covariate,
*      with robust standard errors
*
********************************************************************************

logit femp i.mune i.und5 regage, cluster(case)

/**

Task: Interpret the results.

**/


********************************************************************************
*
*	10. Compare the estimates and standard errors for the standard 
*       pooled cross-sectionall logistic regression model with the model
*       estimated with robust standard errors
*
********************************************************************************

logit femp i.mune i.und5 regage
estimates store logit

logit femp i.mune i.und5 regage, cluster(case)
estimates store robust

esttab logit robust	,  ///
       cells(b(nostar fmt(%9.3f)) se(par) )  ///
       nonumbers  mtitles("logit" "robust")

/**

Task: Comment on the results.

**/


********************************************************************************
*
*	11. Estimate a panel random effects logistic regression model
*       for femp with mune und5 as dummy variables and regage as a covariate
*       (use the noskip command to perform an overall model test as a 
*       likelihood-ratio test).
*
********************************************************************************


xtset case time

xtdes

xtlogit femp i.mune i.und5 regage, re noskip
estimates store logit

/**

Task: Interpret the results.

**/


********************************************************************************
*
*	12. Display the log likelihoods for the null, comparison model and 
*       the full model
*
********************************************************************************

* log likelihood, null model
display e(ll_0)
 
* log likelihood, comparison model
display e(ll_c) 

* full model
display e(ll)
  

********************************************************************************
*
*	13. Calculate the LR Chi-Square test.
*
********************************************************************************

display (-2*(e(ll_0)))-(-2*(e(ll)))


/**

Question: Is the result significant?

**/


********************************************************************************
*
*	14. Calculate rho.
*
********************************************************************************

display  (e(sigma_u)^2)/(3.29 +(e(sigma_u)^2))


/**

Task: Comment on this result?

**/


********************************************************************************
*
*	15. Calculate a formal LR test that rho = 0.
*
********************************************************************************

display (-2*(e(ll_c)))-(-2*(e(ll)))


/**

Question: Is this result significant?

**/


********************************************************************************
*
*	16. Estimate a panel fixed effects logistic regression model
*       for femp with mune und5 as dummy variables and regage as a covariate.
*
********************************************************************************


xtlogit femp i.mune i.und5 regage, fe 
estimates store fixed

/**

Question: Is this model directly comparable to the random effects logistic
          regression panel model?

**/


********************************************************************************
*
*	17. Estimate a conditional (fixed-effects) logistic regression model 
*       using clogit.
*
********************************************************************************

clogit femp i.mune i.und5 regage, group(case)
estimates store clogit

/**

Task: Comment on this result?

**/


********************************************************************************
*
*	18. Compare the estimates and standard errors for the xtlogit fixed effects
*       model and the clogit model.
*
********************************************************************************

esttab fixed clogit	,  ///
       cells(b(nostar fmt(%9.3f)) se(par) )  ///
       nonumbers  mtitles("fe" "clogit")

/**

Task: Comment on these result?

**/


********************************************************************************
*
*	19. Estimate a random effects probit panel model
*       for femp with mune und5 as dummy variables and regage as a covariate
*
********************************************************************************

probit femp i.mune i.und5 regage
estimates store probit

/**

Task: Comment on these result?

**/


********************************************************************************
*
*	20. Calculate rho.
*
********************************************************************************

xtprobit femp i.mune i.und5 regage, noskip
display (e(sigma_u)^2)/((e(sigma_u)^2)+1)  


/**

Task: Comment on these result?

**/


********************************************************************************
*
*	21. Calculate a formal LR test that rho = 0.
*
********************************************************************************

display (-2*(e(ll_c)))-(-2*(e(ll)))

/**

Question: Is this result significant?

**/


********************************************************************************
*
*	22. Compare the results of the logit and probit panel models.
*
********************************************************************************

esttab logit probit	,  ///
       cells(b(nostar fmt(%9.3f)) se(par) )  ///
       nonumbers  mtitles("logit" "probit")
	   
/**

Task: Comment on these results?

**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Comparing Panel Models
*
********************************************************************************

/**

An example using data from

Cornwell, C, and Rupert, P. 1988. 
Efficient estimation with panel data:An empirical comparison of 
instrumental variables estimators. 
Journal of Applied Econometrics, 3, 149-155.

**/

use "$path3\psid_extract_20180121_vg_v1.dta", clear

codebook, compact

xtset id t


********************************************************************************
*
*	1. Estimate a fixed and then a random effect panel model
*      lwage with exp wks occ as xvars
*
********************************************************************************

xtreg lwage exp wks occ, fe
estimates store fe

xtreg lwage exp wks occ, re
estimates store re


********************************************************************************
*
*	2. Compare the fixed and then a random effect panel model.
*
********************************************************************************

esttab fe  re	, ///
       cells(b(star fmt(%9.3f)) se(par))  ///
       nonumbers mtitles("FE" "RE")
	   
/**

Task: Comment on the results.

**/


********************************************************************************
*
*	3. Make a formal comparison using the Hausman test.
*
********************************************************************************

hausman fe re

/**

Questions: Is the result significant?
           Can we reject the null hypothesis?
		   What does conventional theory say we should do?
		   
**/

/**

An example using data from (p.954) of 
Greene, W.H. (1999) Econometric analysis: Pearson Education India.

Variables
--------------------------------------------------------------------------------
i           airline
t           year
c           total cost, in $1000
q           output revenue index (passenger miles)
pf          price of fuel
lf          load factor (average capacity of fleet)
logc        log total cost, in $1000
logq        log output revenue index (passenger miles)
logf        log price of fuel
--------------------------------------------------------------------------------

**/

use "$path3\panel_greene_20180121_vg_v1", clear


********************************************************************************
*
*	4. Estimate a fixed and then a random effect panel model
*      logc with logq logf lf as xvars
*
********************************************************************************

xtreg logc logq logf lf , fe 
est store fe

xtreg logc logq logf lf ,  re
estimates store re


********************************************************************************
*
*	5. Make a formal comparison using the Hausman test.
*
********************************************************************************

hausman fe re

/**

Questions: Is the result significant?
           Can we reject the null hypothesis?
		   What does conventional theory say we should do?
		   
**/


********************************************************************************
*
*	6. Estimate the random effects panel model with the Mundlak adjustment.
*
********************************************************************************


/**

You may have to install the mundlak package

net describe mundlak, from(http://fmwww.bc.edu/RePEc/bocode/m)


**/

mundlak logc logq logf lf, full
estimates store mundlak

#delimit ;
esttab fe mundlak re ,		
	cells(b(star fmt(%9.3f)) se(par)) 					
	stats(r2 r2_a N, fmt(%9.3f %9.3f) labels(R-Squared AdjR-Squared n)) 
	starlevels(* .10 ** .05 *** .01) stardetach 
	nonumbers mtitles("FE" "Mundlak" "RE")		
	nogaps replace ;
#delimit cr


/**

Task: Comment on the results.

**/


********************************************************************************
*
*	7. Test the variables measuring individual respondent’s means.
*
********************************************************************************

mundlak logc logq logf lf, full
test mean__logq mean__logf mean__lf 

/**

Task: Comment on the results.

**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Panel Data Constuction (with loops) 
*
********************************************************************************

/**

In this example we construct a (small) data file from three waves of panel data.

Take a look at the three files...


**/

use "$path3\aindresp_example_20180121_vg_v1" , clear
codebook, compact

use "$path3\bindresp_example_20180121_vg_v1" , clear
codebook, compact

use "$path3\cindresp_example_20180121_vg_v1" , clear
codebook, compact

/**

Task: Think about how you can get all of this data into one file.

**/


/**

This is a loop to harvest the variables from three waves of panel data.

The waves are a, b and c and in the files

aindresp_example_20180121_vg_v1
bindresp_example_20180121_vg_v1
cindresp_example_20180121_vg_v1

**/

* you MUST run all the lines together

**************************************
foreach wave in a b c ///
  {

  use pid `wave'hid `wave'pno ///
      `wave'sex `wave'mastat `wave'age  ///
  using "$path3\`wave'indresp_example_20180121_vg_v1" , clear
  rename `wave'* *
  generate wave = ///
    index("abc","`wave'")
  order pid wave hid pno sex mastat age
  save "$path7\`wave'indresp_temp_20180121_vg_v1.dta", replace

 }

 
 
***************************************

/**

Take a look at the three temporary files.

**/ 

use "$path7\aindresp_temp_20180121_vg_v1.dta", clear
codebook, compact

use "$path7\bindresp_temp_20180121_vg_v1.dta", clear
codebook, compact

use "$path7\cindresp_temp_20180121_vg_v1.dta", clear
codebook, compact


*******************************************************************************

/**

Appending waves a, b and c into one single file 

**/

clear

* you MUST run all the lines together

**************************************
foreach wave in a b c {
   append using "$path7\`wave'indresp_temp_20180121_vg_v1.dta"
}

**************************************

codebook, compact

browse

/**

Question: Are these data in a useable long format?

**/

sort pid wave
browse

/**

Task: Write some comments to remind yourself how loops work.

**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Panel Data Constuction Exercise
*
********************************************************************************

/**

TO USE BHPS data YOU MUST BE REGISTER WITH THE UK DATA ARCHIVE!

YOU MUST DOWNLOAD YOUR OWN COPY OF THE BRITISH HOUSEHOLD PANEL SURVEY.

Task:

Construct a (long format) panel dataset. 

There are many different ways to organise and enable large-scale complex 
datasets. 

The best way to learn is by doing.

Some approaches are more efficient and effective than others. 

Data analysts usually have their own prefered ways of working. 

Remember the 'Gayle-Lambert constant'!

 

Steps:

1. Download the BHPS from UK Data Service  
Study Number 5151 - British Household Panel Survey: Waves 1-18, 1991-2009.

2. Try hard to achieve a good standard of workflow (e.g. start a new log file).

3. Use the individual-level data for respondents files (wINDRESP)
   waves b (1992) - f (1996)
   (see https://www.iser.essex.ac.uk/bhps/documentation/volb/wave2/bvars5.html)

4. Harvest the following variables:-

pid				Cross-wave person identifier
hid				Household identification number
pno				Person number
doby			Year of birth
age 			Age at Date of Interview
sex				Sex (gender)
qfachi			Highest academic qualification
mastat 			Marital status
nchild 			Number of own children in household
jbstat 			Current economic activity
jbft 			Employed full time
jbhas 			Did paid work last week
jboff 			No work last week but has job
jbhrs 			No. of hours normally worked per week
jbcssf 			Cambridge Scale females : present job
region			Region / Metropolitan Area
sampst 			Sample membership status

5. Select only the women aged under 30 in 1992 
   (delete any cases where they are classified as a child under 16).

6. Construct a compact codebook.

7. Summarize the dataset and describe the panel.

8. Estimate a random effects panel model of the
   number of hours normally worked per week (jbhr)
   with the following x vars for the women in paid work
 
age(centred)
number of own children in household
marital status (with sinlge as the reference category)
education (non-graduate / graduate)
Cambridge scale females : present job

Good Luck.

**/

********************************************************************************



/**

© Vernon Gayle, University of Edinburgh.

Professor Vernon Gayle (vernon.gayle@ed.ac.uk) 


********************************************************************************

* End of file *
