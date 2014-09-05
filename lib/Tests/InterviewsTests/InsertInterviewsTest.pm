package lib::Tests::InterviewsTests::InsertInterviewsTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewsPortal;

my %interview1 = (
	date => "2014-07-21 17:00:50",
	result => "Job offer",
	process_description => "All was good"	
);
$interview1{candidat}->{id} = 1;
#$interview1{interviewer1}->{id} = 2;
$interview1{interviewer2}->{id} = 3;
$interview1{interviewer3}->{id} = 4;
$interview1{hrmanager}->{id} = 3;

my $p = lib::Portal::InterviewsPortal->new();
$p->add_interview(%interview1);

