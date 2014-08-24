package lib::Tests::HRManagersTests::GetHRmanagerByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::HRManagersPortal;




my $p = lib::Portal::HRManagersPortal->new();

my $hrmanager = $p->get_hrmanager_by_id(1);
print $hrmanager->{surname};


