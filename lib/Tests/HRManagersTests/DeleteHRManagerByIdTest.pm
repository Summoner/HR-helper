package lib::Tests::HRManagersTests::DeleteHRmanagerByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::HRManagersPortal;



my $p = lib::Portal::HRManagersPortal->new();


$p->delete_hrmanager_by_id(1);



