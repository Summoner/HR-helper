package lib::Tests::HRManagersTests::InsertHRmanagersTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::HRManagersPortal;

my %hrmanager1 = (
	forename => "Anna",
	surname => "Ivanova",
	phone_number => "375297559171",
	email => "ivanova\@gmail.com"	
);
my %hrmanager2 = (
	forename => "Elena",
	surname => "Petrova",
	phone_number => "375297559172",
	email => "petrova\@gmail.com"
);
my %hrmanager3 = (
);
my $p = lib::Portal::HRManagersPortal->new();
$p->add_hrmanager(%hrmanager1);
$p->add_hrmanager(%hrmanager2);



