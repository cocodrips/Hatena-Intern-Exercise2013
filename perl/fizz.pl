# あまりにわからなすぎるからとりあえず
my $max = 100;
for (my $i = 1; $i <= $max; $i++) {
    if($i % 15 == 0){
        print "fizzbuzz";
    }elsif ($i % 3 == 0) {
        print "fizz";
    }elsif( $i % 5 == 0 ){
        print "buzz";
    }else{
        print  $i;
    }
    print"\n";
}