package LogCounter;
use strict;
use warnings;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
    my $self = shift;
    my $result = {};
    my $log_array = $self->{logs};
    foreach my $log (@$log_array){
        my $user;
        if(exists $log->{user}){
            $user = $log->{user};
        }else{
            $user = 'guest';
        }
        push @{$result->{$user}}, $log;
    }
    return $result;
}

sub count_error {
    my $self = shift;
    my $log_array = $self->{logs};
    return scalar grep {$_->{status} >= 500 && $_->{status} <= 599} @$log_array;
}

1;
