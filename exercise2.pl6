#! /usr/bin/perl6

# Perl6 supports named function arguments and gradual typing!
sub find-multiples(Int $limit, Int $divisor) {
  my @multiples = grep { $_ % $divisor == 0 }, (1..$limit);
  return join(', ', @multiples);
}

say find-multiples 200, 10;
