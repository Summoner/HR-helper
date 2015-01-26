package lib::Tests::InterviewsTests::UpdateInterviewTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;

my %interview1 = (
	date => "2014-09-28 19:52:50",
	result => "",
	process_description => ""
);
$interview1{candidat}->{id} = 6;
$interview1{interviewer1}->{id} = 2;
$interview1{interviewer2}->{id} = 3;
$interview1{interviewer3}->{id} = 4;
$interview1{hrmanager}->{id} = 2;

my $p = lib::Portal->new();
$p->update_interview(11,%interview1);



