#! /usr/bin/perl6

use lib '.';
use utils;

sub find_unique_substrings(Str $text, Int $length) {
  return [$text] unless $text.chars > $length;
  
  my %substrings = ();
  
  map { %substrings{$_} = True }, map { $text.substr($_, $length); }, (0..$text.chars-$length);
  
  return %substrings.keys;
}

sub write_file(@strings) {
  my $file = open("strings.txt", :w);
  for @strings -> $string {
    $file.say($string)
  }
  $file.close();
}

sub main() {
  my $text = prompt_default;
  write_file(find_unique_substrings($text, 3))
}

main();
