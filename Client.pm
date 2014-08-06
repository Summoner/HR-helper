#!/usr/bin/perl -w
use lib 'D:/Perl/Summoner/HR-helper';
use strict;
use warnings;
use Portal;
use Data::Dumper; 



my $access = Portal->new();


my $candidat = $access->Create_candidat(

	(surname =>"Tur",
	 forename => "Andrey")
);

print $candidat->surname," ",$candidat->forename;