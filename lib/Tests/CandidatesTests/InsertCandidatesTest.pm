package lib::Tests::CandidatesTests::InsertCandidatesTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal;
open my $cv, "/home/fanatic/Summoner/HR-helper/Resume.doc" || die "Can't open file: $!\n";

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
	education => "IT university Minsk 2004 year",
    cv => $cv,
    status => 0,
    registration_date => "2014-07-21 17:00:50"
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
	expertise_areas => "Oracle,Perl",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year",
    registration_date => "2014-07-21 17:00:50"
);
my %candidat3 = (
	forename => "Viktor",
	surname => "Sergeev",
	age => "33",
	citizenship => "Belarus",
	marital_status => "Married",
	children => "1",
	phone_number => "375297559161",
	email => "sergeev\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "SQL,C#",
	prof_exp => "7 years",
	foreign_lang => "English,Russian",
	education => "IT university 2004 year",
    registration_date => "2014-07-21 17:00:50"
);
my %candidat4 = (
	forename => "Alex",
	surname => "Petrov",
	age => "33",
	citizenship => "Ukraine",
	marital_status => "Married",
	children => "2",
	phone_number => "375297559178",
	email => "petrov\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Javascript",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year",
    registration_date => "2014-07-21 17:00:50"
);

my %candidat5 = (
	forename => "Sergey",
	surname => "Ivanov",
	age => "30",
	citizenship => "Belarus",
	marital_status => "Married",
	children => "1",
	phone_number => "375297559155",
	email => "ivanov\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL,C#",
	prof_exp => "7 years",
	foreign_lang => "English,Russian",
	education => "IT university Minsk 2004 year",
    registration_date => "2014-07-21 17:00:50"
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
	expertise_areas => "Perl,MySQL",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year",
    registration_date => "2014-07-21 17:00:50"
);

my %candidat7 = (
	forename => "Ivan",
	surname => "Pupkin",
	age => "33",
	citizenship => "Ukraine",
	marital_status => "Married",
	children => "2",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,MySQL",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year",
    registration_date => "2014-07-21 17:00:50"
);


my $p = lib::Portal->new();
$p->add_candidat(%candidat1);
#$p->add_candidat(%candidat2);
#$p->add_candidat(%candidat3);
#$p->add_candidat(%candidat4);
#$p->add_candidat(%candidat5);
#$p->add_candidat(%candidat6);
#$p->add_candidat(%candidat7);

