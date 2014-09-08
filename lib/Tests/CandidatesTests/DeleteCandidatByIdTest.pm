package lib::Tests::CandidatesTests::DeleteCandidatTest;
use strict;
use warnings;
use Data::Dumper; 
#Test here
use lib::BLL::Candidates;


my $p = lib::BLL::Candidates->new();
$p->delete_by_id(7);



