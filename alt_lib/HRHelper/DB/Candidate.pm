package HRPortal::DB::Candidate;

use base HRPortal::DB;
my $tablename = 'Candidate';
sub new {
    #class to keep database connection
}

sub create_candidate {
   my ($self, $cand_input) = @_;
   
   my $cand = HRHelper::Entity::CandidateEntity->new($cand_input);

   $self->create($cand);

   return $cand;
}

1;
