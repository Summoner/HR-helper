package lib::Tests::CandidatesTests::GetCandidateByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal;

my $p = lib::Portal->new();

my $candidat = $p->get_candidat( 10 );
print $candidat->{ surname };


