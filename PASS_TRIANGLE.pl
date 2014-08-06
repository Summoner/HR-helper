#!/usr/bin/perl -w
use strict;
use warnings;
use Data::Dumper; 
use Benchmark;

my $t0 = new Benchmark;


 

  open my $input, "D:\\Perl\\input.txt" || die "Can't open file: $!\n";
 #open my $result, ">D:\\Perl\\output1.txt" || die "Can't open file: $!\n";

my @list = (); 
	 
	while(<$input>){			
	chomp;	
	push @list,[split / /,$_];
	}
close $input;
	
	 
	  for (my $i = $#list; $i > 0; $i--){
	 	
	 	for (my $j = 1; $j <= $#{$list[$i]}; $j++){
	 	
	 	
			$list[$i-1]->[$j-1] += max($list[$i]->[$j],$list[$i]->[$j-1]);
	 	
	 	
	 	}
	 }
	 
	
	 print $list[0]->[0],"\n";
 
  
 
 
sub max{ 	
	my ($a,$b) = @_; 
	
	 
	   return $a if ($a > $b);
	   return $b;	
}
 
 
 
 
 
 
 
 
my $t1 = new Benchmark;
my $td = timediff($t1, $t0);
print "the code took:",timestr($td),"\n";