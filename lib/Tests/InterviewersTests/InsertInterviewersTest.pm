package lib::Tests::InterviewersTests::InsertInterviewersTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewersPortal;

my %interviewer1 = (
	forename => "Andrey",
	surname => "Tur",
	phone_number => "375297559177",
	email => "andrtur\@gmail.com"	
);
my %interviewer2 = (
	forename => "Alexander",
	surname => "Tangelov",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com"
);

my $p = lib::Portal::InterviewersPortal->new();
$p->add_interviewer(%interviewer1);
$p->add_interviewer(%interviewer2);


