package lib::Tests::CandidatesTests::GetCandidatesListTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::CandidatesPortal;



my $p = lib::Portal::CandidatesPortal->new();

my $candidates = $p->get_candidates_list();
print Dumper \$candidates;


