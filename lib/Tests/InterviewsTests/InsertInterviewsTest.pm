package lib::Tests::InterviewsTests::InsertInterviewsTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewsPortal;

my %interview1 = (
	date => "2014-08-28 19:52:50",
	result => "Job offer",
	process_description => "All ok"	
);
$interview1{candidat}->{id} = 5;
$interview1{interviewer1}->{id} = 6;
$interview1{interviewer2}->{id} = 7;
$interview1{interviewer3}->{id} = 8;
my $p = lib::Portal::InterviewsPortal->new();
$p->add_interview(%interview1);

