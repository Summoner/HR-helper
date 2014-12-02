package lib::Tests::CandidatesTests::GetCandidatesListTest;
use strict;
use warnings;
use Data::Dumper; 

#Test here
use lib::Portal;


my $p = lib::Portal->new();
#my $candidat = $p->get_candidat( 7 );
#my $forename = $candidat->forename;
#my $surname = $candidat->surname;
#my $phone_number = $candidat->phone_number;
#my $message = "Hello, dear $forename $surname! We just want to check, if your phone number: $phone_number is right. Thank you.\n";
#$p->send_letter_to_candidat( "zfanatic\@yandex.ru","test mail",$candidat,$message );

#my $candidates = $p->get_list_candidates_by_registration_date('2014-05-05 17:00:00','2014-06-01 17:00:00');
#my $candidates = $p->get_candidates_list();
my $candidates = $p->get_list_candidates_by_status( 0 );


print Dumper \$candidates;


