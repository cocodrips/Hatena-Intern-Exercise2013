package Log;
use strict;
use warnings;
use DateTime;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub protocol {
    my $self = shift;
    my @split_req = split (/ /, $self->{req});
    my $protocol = $split_req[2];
    return $protocol;
}

sub method {
    my $self = shift;
    my @split_req = split (/ /, $self->{req});
    my $method = $split_req[0];
    return $method;
}

sub path {
    my $self = shift;
    my @split_req = split (/ /, $self->{req});
    my $path = $split_req[1];
    return $path;
}

sub uri {
    my $self = shift;
    my $host = $self->{host};
    my $path = $self->path;
    return "http://".$host.$path;
}

sub time {
    my $self = shift;
    my $time = $self->{epoch};
    my $gmt = DateTime->from_epoch(time_zone => 'GMT', epoch => $time); 
    return $gmt;
}

1;
