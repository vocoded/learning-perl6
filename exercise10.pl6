#! /usr/bin/perl6

sub find_random_multiple(Int $seed, Int $divisor) {
  loop {
    my $num = $seed.rand.truncate;
    return $num if $num % $divisor == 0;
  }
}

sub main() {
  my $promise = start {
    find_random_multiple(1000, 99);
  }
  my $result = await $promise;
  say $result;
}

main();
