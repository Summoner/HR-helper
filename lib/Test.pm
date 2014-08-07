#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

package Test;
#Test here
use lib::Portal;

my %candidat1 = (
	forename => "Andrey",
	surname => "Tur",
	age => "33",
	citizenship => "Belarus",
	marital_status => "Married",
	children => "1",
	phone_number => "+375297559177",
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
	phone_number => "+375297559178",
	email => "scyphius\@gmail.com",
	position_apply => "Software developer",
	expertise_areas => "Perl,Git,SQL",
	prof_exp => "10 years",
	foreign_lang => "English,Russian",
	education => "IT university Harkov 2004 year"
);

my $p = lib::Portal->new();
$p->add_candidat(1,%candidat1);
my $candidat = $p->get_candidat_by_id(1);
print $candidat->{surname};


