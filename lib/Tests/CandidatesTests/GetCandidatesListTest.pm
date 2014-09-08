package lib::Tests::CandidatesTests::GetCandidatesListTest;
use strict;
use warnings;
use Data::Dumper; 

#Test here
use lib::BLL::Candidates;



my $p = lib::BLL::Candidates->new();

my $candidates = $p->get_list();
print Dumper \$candidates;


