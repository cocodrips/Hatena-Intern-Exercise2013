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
    foreach(@{$self->{logs}}){
        my $user = $_->{user} || 'guest';
        push @{$result->{$user}}, $_;
    }
    return $result;
}

sub count_error {
    my $self = shift;
    return scalar grep {$_->{status} >= 500 && $_->{status} <= 599} @{$self->{logs}};
}

1;
