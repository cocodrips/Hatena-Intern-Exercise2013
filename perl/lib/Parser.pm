package Parser;
use strict;
use warnings;
use Log;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
    my $self = shift;
    my @array;
    my $file = $self->{filename};

    open my $fh, '<', $file or die $!;
    my $line;

    while ($line = <$fh>) {
        my $element = {};
        my @data = split(/\t/, $line);
        for (my $i = 0; $i < $#data; $i++) {
            my @el = split(/:/, $data[$i]);
            $element->{$el[0]} = $el[1];
        }
        push @array, Log->new(%$element);
    }    
    return @array;
}

1;
