package lib::Tests::CandidatesTests::GetCandidateByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::CandidatesPortal;



my $p = lib::Portal::CandidatesPortal->new();

my $candidat = $p->get_candidat_by_id(6);
print $candidat->{surname};


