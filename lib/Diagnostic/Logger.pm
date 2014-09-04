#Class for logging processes
package lib::Diagnostic::Logger;
use strict;
use warnings;
use Data::Dumper; 
use DateTime;
use base 'Class::Singleton';


sub _new_instance{	
	my  $class = shift;
    my $self = {};
	bless($self,$class);
	return $self;
}

sub write_to_candidate_log{

	my($self,$message) = @_;
	my $dt3 = DateTime->now(time_zone=>'local');
	$dt3 = join (" ", split (/T/,$dt3));
	my $messageForWrite = $dt3 ." " . $message  . "\n";
	open my $logfile,">> /home/fanatic/Summoner/HR-helper/lib/Diagnostic/CandidateLog.txt" || die "Can not open file $!\n";
	print $logfile $messageForWrite;
	close $logfile;
}
sub write_to_interviewer_log{

	my($self,$message) = @_;
	my $dt3 = DateTime->now(time_zone=>'local');
	$dt3 = join (" ", split (/T/,$dt3));
	my $messageForWrite = $dt3 ." " . $message  . "\n";
	open my $logfile,">> /home/fanatic/Summoner/HR-helper/lib/Diagnostic/InterviewerLog.txt" || die "Can not open file $!\n";
	print $logfile $messageForWrite;
	close $logfile;
}
sub write_to_interview_log{

	my($self,$message) = @_;
	my $dt3 = DateTime->now(time_zone=>'local');
	$dt3 = join (" ", split (/T/,$dt3));
	my $messageForWrite = $dt3 ." " . $message  . "\n";
	open my $logfile,">> /home/fanatic/Summoner/HR-helper/lib/Diagnostic/InterviewLog.txt" || die "Can not open file $!\n";
	print $logfile $messageForWrite;
	close $logfile;
}
sub write_to_hrmanager_log{

	my($self,$message) = @_;
	my $dt3 = DateTime->now(time_zone=>'local');
	$dt3 = join (" ", split (/T/,$dt3));
	my $messageForWrite = $dt3 ." " . $message  . "\n";
	open my $logfile,">> /home/fanatic/Summoner/HR-helper/lib/Diagnostic/HRManagerLog.txt" || die "Can not open file $!\n";

	print $logfile $messageForWrite;
	close $logfile;
}
1;

