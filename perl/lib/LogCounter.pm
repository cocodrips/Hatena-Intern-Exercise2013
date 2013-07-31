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
    foreach (@{$self->{logs}}){
        push(@{$result->{$_->{user} // 'guest'}}, $_ );
    }

    return $result;
}

sub count_error {
    my $self = shift;
    # print $self->{logs};
    return scalar grep {$_->{status} > 499 && $_->{status} < 600} @{ $self->{logs} };
}

1;
