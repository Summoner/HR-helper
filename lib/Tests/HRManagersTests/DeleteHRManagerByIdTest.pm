package lib::Tests::HRManagersTests::DeleteHRmanagerByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal;

my $p = lib::Portal->new();


$p->delete_hrmanager(5);



