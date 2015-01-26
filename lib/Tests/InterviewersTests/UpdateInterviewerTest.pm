package lib::Tests::InterviewersTests::UpdateInterviewerTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;

my %interviewer1 = (
	forename => "Andreyus",
	surname => "Tur",
	phone_number => "375297559887",
	email => "andrtur\@gmail.com"
);
my %interviewer2 = (
	forename => "Alexandr",
	surname => "Tangelov",
	phone_number => "375297559166",
	email => "scyphius\@gmail.com"
);

my $p = lib::Portal->new();
$p->update_interviewer(5,%interviewer2);



