package lib::Tests::CandidatesTests::UpdateCandidatTest;
use strict;
use warnings;
use Data::Dumper; 
#Test here
use lib::Portal;

#Status:
#0 - Just applayed
#1 - Watched by HR manager
#2 - Declined by HR manager
#3 - Approved by HR manager
#4 - Sent interview offer
#5 - Ready for interview
#6 - Approved by interviewer
#7 - Declined by interviewer
#8 - Sent job offer letter
#9 - Sent decline letter


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
    registration_date => "2014-05-21 17:00:50"
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
    registration_date => "2014-07-21 17:00:50",
    cv => $cv,
    status => 3

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
    registration_date => "2014-07-21 17:00:50",
    cv => $cv,
    status => 2

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
    registration_date => "2014-07-21 17:00:50",
    cv => $cv,
    status => 3

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
    registration_date => "2014-07-21 17:00:50",
    cv => $cv,
    status => 5

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
    registration_date => "2014-07-21 17:00:50",
    cv => $cv,
    status => 6

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
    registration_date => "2014-07-21 17:00:50",
    cv => $cv,
    status => 7

);



my $p = lib::Portal->new();
#$p->update_candidat(7,%candidat1);
$p->update_candidat(8,%candidat2);
#$p->update_candidat(9,%candidat3);
#$p->update_candidat(10,%candidat4);
#$p->update_candidat(11,%candidat5);
#$p->update_candidat(12,%candidat6);
#$p->update_candidat(13,%candidat7);

#my $candidat = $p->get_candidat_by_id(1);
#print $candidat->{surname};


