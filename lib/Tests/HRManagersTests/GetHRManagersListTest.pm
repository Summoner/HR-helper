package lib::Tests::HRManagersTests::GetHRmanagersListTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;



my $p = lib::Portal->new();

my $hrmanagers = $p->get_hrmanagers_list();
print Dumper \$hrmanagers;


