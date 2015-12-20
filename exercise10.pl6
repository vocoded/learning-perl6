#! /usr/bin/perl6

sub find_random_multiple() {
  loop {
    my $num = 1000.rand.truncate;
    return $num if $num % 99 == 0;
  }
}

sub main() {
  my $promise = start {
    find_random_multiple();
  }
  my $result = await $promise;
  say $result;
}

main();
