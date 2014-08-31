package lib::Tests::InterviewersTests::InsertInterviewersTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewersPortal;

my %interviewer1 = (
	forename => "John",
	surname => "Smit",
	phone_number => "375297559177",
	email => "andrtur\@gmail.com"	
);
my %interviewer2 = (
	forename => "David",
	surname => "Edison",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com"
);
my %interviewer3 = (
	forename => "Peter",
	surname => "Jackson",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com"
);
my $p = lib::Portal::InterviewersPortal->new();
$p->add_interviewer(%interviewer1);
$p->add_interviewer(%interviewer2);
$p->add_interviewer(%interviewer3);

