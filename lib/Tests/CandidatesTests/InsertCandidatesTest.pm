package lib::Tests::CandidatesTests::Test;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::CandidatesPortal;

my %candidat1 = (
	forename => "Andrey",
	surname => "Tur",
	age => "33",
	citizenship => "Belarus",
	marital_status => "Married",
	children => "1",
	phone_number => "375297559177",
	email => "andrtur\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL,C#",
	prof_exp => "7 years",
	foreign_lang => "English,Russian",
	education => "IT university Minsk 2004 year"	
);
my %candidat2 = (
	forename => "Alexander",
	surname => "Tangelov",
	age => "33",
	citizenship => "Ukraine",
	marital_status => "Married",
	children => "2",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year"
);
my %candidat3 = (
	forename => "Viktor",
	surname => "Sergeev",
	age => "33",
	citizenship => "Belarus",
	marital_status => "Married",
	children => "1",
	phone_number => "375297559177",
	email => "andrtur\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL,C#",
	prof_exp => "7 years",
	foreign_lang => "English,Russian",
	education => "IT university Minsk 2004 year"	
);
my %candidat4 = (
	forename => "Alex",
	surname => "Petrov",
	age => "33",
	citizenship => "Ukraine",
	marital_status => "Married",
	children => "2",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year"
);

my %candidat5 = (
	forename => "Sergey",
	surname => "Ivanov",
	age => "30",
	citizenship => "Belarus",
	marital_status => "Married",
	children => "1",
	phone_number => "375297559155",
	email => "andrtur\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL,C#",
	prof_exp => "7 years",
	foreign_lang => "English,Russian",
	education => "IT university Minsk 2004 year"	
);
my %candidat6 = (
	forename => "Ivan",
	surname => "Pupkin",
	age => "33",
	citizenship => "Ukraine",
	marital_status => "Married",
	children => "2",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year"
);

my $p = lib::Portal::CandidatesPortal->new();
$p->add_candidat(%candidat1);
$p->add_candidat(%candidat2);
$p->add_candidat(%candidat3);
$p->add_candidat(%candidat4);
$p->add_candidat(%candidat5);
$p->add_candidat(%candidat6);


