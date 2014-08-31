package lib::Tests::HRManagersTests::InsertHRmanagersTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::HRManagersPortal;

my %hrmanager1 = (
	forename => "Anna",
	surname => "Ivanova",
	phone_number => "375297559177",
	email => "andrtur\@gmail.com"	
);
my %hrmanager2 = (
	forename => "Elena",
	surname => "Petrova",
	phone_number => "375297559178",
	email => "scyphius\@gmail.com"
);

my $p = lib::Portal::HRManagersPortal->new();
$p->add_hrmanager(%hrmanager1);
$p->add_hrmanager(%hrmanager2);


