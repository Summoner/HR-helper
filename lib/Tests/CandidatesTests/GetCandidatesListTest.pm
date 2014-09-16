package lib::Tests::CandidatesTests::GetCandidatesListTest;
use strict;
use warnings;
use Data::Dumper; 

#Test here
use lib::Portal;


my $p = lib::Portal->new();

my $candidates = $p->get_candidates_list();
print Dumper \$candidates;


