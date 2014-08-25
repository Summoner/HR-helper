package lib::Tests::InterviewersTests::DeleteInterviewerByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewersPortal;



my $p = lib::Portal::InterviewersPortal->new();


$p->delete_interviewer_by_id(2);



