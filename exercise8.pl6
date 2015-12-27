#! /usr/bin/perl6

use lib '.';
use utils;

sub reverse(Str $text) {
  # Let me count the ways...
  # my $reverse = $text.flip;
  # my $reverse = $text.split('').reverse().join('');
  my $reverse = '';
  
  loop (my $i = $text.chars - 1; $i >=0; $i--) {
    $reverse ~= $text.substr($i, 1);
  }

  return $reverse;
}

sub main() {
  my $text = prompt_default;
  say reverse($text);
}

main();
