package lib::Tests::HRManagersTests::GetHRmanagersListTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::HRManagersPortal;



my $p = lib::Portal::HRManagersPortal->new();

my $hrmanagers = $p->get_hrmanagers_list();
print Dumper \$hrmanagers;


