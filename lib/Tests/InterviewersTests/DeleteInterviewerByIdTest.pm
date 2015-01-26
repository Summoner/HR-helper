package lib::Tests::InterviewersTests::DeleteInterviewerByIdTest;
use strict;
use warnings;
use Data::Dumper;


#Test here
use lib::Portal;



my $p = lib::Portal->new();


$p->delete_interviewer(5);
#$p->delete_interviewer_by_id(10);
#$p->delete_interviewer_by_id(11);



