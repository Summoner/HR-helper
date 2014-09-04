package lib::Tests::InterviewsTests::UpdateInterviewTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewsPortal;

my %interview1 = (
	date => "2014-09-28 19:52:50",
	result => "",
	process_description => ""	
);
$interview1{candidat}->{id} = 7;
$interview1{interviewer1}->{id} = 6;
$interview1{interviewer2}->{id} = 7;
$interview1{interviewer3}->{id} = 8;
$interview1{hrmanager}->{id} = 6;

my $p = lib::Portal::InterviewsPortal->new();
$p->update_interview_by_id(6,%interview1);



