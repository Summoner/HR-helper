package lib::Tests::HRManagersTests::GetHRmanagerByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal;




my $p = lib::Portal->new();

my $hrmanager = $p->get_hrmanager(2);
print $hrmanager->{surname};


