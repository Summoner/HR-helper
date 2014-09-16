package lib::Tests::InterviewersTests::InsertInterviewersTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal;

my %interviewer1 = (
	forename => "John",
	surname => "Smit",
	phone_number => "375297559173",
	email => "smit\@gmail.com"	
);
my %interviewer2 = (
	forename => "David",
	surname => "Edison",
	phone_number => "375297559174",
	email => "edison\@gmail.com"
);
my %interviewer3 = (
	forename => "Peter",
	surname => "Jackson",
	phone_number => "375297559175",
	email => "jackson\@gmail.com"
);
my %interviewer4 = (
);
my $p = lib::Portal->new();
$p->add_interviewer(%interviewer1);
#$p->add_interviewer(%interviewer2);
#$p->add_interviewer(%interviewer3);

