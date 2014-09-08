package lib::Tests::CandidatesTests::GetCandidateByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::BLL::Candidates;

my $p = lib::BLL::Candidates->new();

my $candidat = $p->get_by_id(6);
print $candidat->{surname};


