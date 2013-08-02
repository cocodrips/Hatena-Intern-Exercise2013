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

        foreach my $data (@data) {
            $data =~ /^(.+?):(.+)$/;
            my $key = $1;
            my $val = $2 || '-';
            if ($val ne '-') {
                $element->{$key} = $val;
            }
        }       
        push @array, Log->new(%$element);
    }    
    return \@array;
}

1;
