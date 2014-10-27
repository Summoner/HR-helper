package lib::Tests::CandidatesTests::GetCandidatesListTest;
use strict;
use warnings;
use Data::Dumper; 

#Test here
use lib::Portal;


my $p = lib::Portal->new();

my $candidates = $p->get_list_candidates_by_registration_date('2014-05-05 17:00:00','2014-06-01 17:00:00');
print Dumper \$candidates;

#get_list_candidates_by_registration_date
