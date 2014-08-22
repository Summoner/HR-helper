package lib::Tests::HRManagersTests::InsertHRmanagersTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::HRManagersPortal;

my %hrmanager1 = (
	forename => "Andrey",
	surname => "Tur",
	phone_number => "375297559177",
	email => "andrtur\@gmail.com"	
);
my %hrmanager2 = (
	forename => "Alexander",
	surname => "Tangelov",
	phone_number => "+375297559178",
	email => "scyphius\@gmail.com"
);

my $p = lib::Portal::HRManagersPortal->new();
$p->add_hrmanager(%hrmanager1);


