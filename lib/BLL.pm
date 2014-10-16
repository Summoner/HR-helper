package lib::BLL;
use strict;
use warnings;
use Data::Dumper; 

sub new{	
	my  $class = shift;
	my $self = {@_};
	bless($self,$class);
	return $self;
}

sub insert_by_id {
    my	( $par1 )	= @_;
    return ;
}



sub update_by_id {
    my	( $par1 )	= @_;
    return ;
}


sub delete_by_id {
    my	( $par1 )	= @_;
    return ;
}


sub get_by_id {
    my	( $par1 )	= @_;
    return ;
}


sub get_list {
    my	( $par1 )	= @_;
    return ;
}
1;
