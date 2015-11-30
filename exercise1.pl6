#! /usr/bin/perl6

# Traditional iterative loop
loop (my $i = 1; $i <= 100; $i++) {
  if ($i % 5 == 0) {
    say $i;
  }
}

# Enumerative loop over a range
for (1..100) -> $i {
  if ($i % 5 == 0) {
    say $i;
  }
}

# More functional style
map { say $_ }, grep { $_ % 5 == 0 }, (1..100)
