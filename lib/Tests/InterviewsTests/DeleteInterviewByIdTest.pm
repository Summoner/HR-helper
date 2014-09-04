package lib::Tests::InterviewsTests::DeleteInterviewByIdTest;
use strict;
use warnings;
use Data::Dumper; 


#Test here
use lib::Portal::InterviewsPortal;



my $p = lib::Portal::InterviewsPortal->new();


$p->delete_interview_by_id(2);
$p->delete_interview_by_id(3);
$p->delete_interview_by_id(4);
$p->delete_interview_by_id(5);
$p->delete_interview_by_id(6);



