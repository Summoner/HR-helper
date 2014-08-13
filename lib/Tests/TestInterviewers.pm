#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 

package Tests::Test;
#Test here
use lib::Portal::InterviewersPortal;

my %interviewer1 = (
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


my $p = lib::Portal::InterviewersPortal->new();
$p->add_interviewer(1,%interviewer1);
my $interviewer = $p->get_interviewer_by_id(1);
print $interviewer->{surname};


