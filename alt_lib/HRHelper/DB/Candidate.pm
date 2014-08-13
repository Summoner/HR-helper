package HRPortal::DB::Candidate;

use base HRPortal::DB;
my $tablename = 'Candidate';
sub new {
    #class to keep database connection
}

sub create_candidate {
   my ($self, $cand_input) = @_;
   # push this ti database
   
   my $cand = HRHelper::Entity::Candidate->new($cand_input);

   return $cand;
}

1;
