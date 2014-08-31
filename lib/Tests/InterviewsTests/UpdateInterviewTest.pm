package lib::Tests::HRManagersTests::UpdateInterviewerTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewersPortal;

my %interviewer1 = (
	forename => "Andreyus",
	surname => "Tur",
	phone_number => "375297559887",
	email => "andrtur\@gmail.com"	
);
my %interviewer2 = (
	forename => "Alexandrr1",
	surname => "Tangelov",
	phone_number => "375297559166",
	email => "scyphius\@gmail.com"
);

my $p = lib::Portal::InterviewersPortal->new();
$p->update_interviewer_by_id(2,%interviewer2);



