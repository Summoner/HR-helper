package HRPortal::PortalFacade;

use Portal::Candidate;

sub create_candidate() {
    my ($self, $cand_input) = @_;
    my $cand = Portal::Candidate::create_candidate($cand_input);

   return $cand;
}
1;
