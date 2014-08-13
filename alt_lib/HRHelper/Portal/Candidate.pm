package HRPortal::Portal::Candidate;
# Class Handler of Candidate Action
use base HRPortal::Portal;
use HRHelper::DB::Candidate;
sub new {
   # to create blessed object
}
sub create_candidate {
    my ($self, $cand_input) = @_;

    die "message" if !HRHelper::Portal::CandidateValidator->validate($cand_input);

    my $cand = HRHelper::Portal::DB::Candidate::create_candidate($cand_input);
    return $cand;
}
1;
