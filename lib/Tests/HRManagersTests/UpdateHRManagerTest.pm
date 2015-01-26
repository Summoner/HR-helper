package lib::Tests::HRManagersTests::UpdateHRmanagerTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;

my %hrmanager1 = (
	forename => "Andreyus",
	surname => "Tur",
	phone_number => "375297559887",
	email => "andrtur\@gmail.com"
);
my %hrmanager2 = (
	forename => "Alexander",
	surname => "Tangelov",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com"
);

my $p = lib::Portal->new();
$p->update_hrmanager(4,%hrmanager1);



