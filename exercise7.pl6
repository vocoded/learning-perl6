#! /usr/bin/perl6

use LWP::Simple;

sub get_url(Str $url) {
  my $response = get($url);
  $response;
}

sub main() {
  my $url = prompt "Enter a url: ";
  my $start = now;
  get_url($url);
  say "Took " ~ (now - $start) ~ "ms to retrieve " ~ $url;
}

main();
