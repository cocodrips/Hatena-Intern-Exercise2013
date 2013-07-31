package LogCounter;
use strict;
use warnings;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
    my $self = shift;
    my $logs = $self->{logs};
}

sub count_error {
    my $self = shift;
    print $self->{logs};
}

1;
