#! /usr/bin/perl6

sub get-file-matches($file, Str $term) {
  my $previousTerm = "";
  my @snippets = ();
  for map { .chomp }, $file.lines -> $line {
	for map { my $s = $_; $s ~~ s:g/\W//; lc($s) }, split(/\s/, $line) -> $word {
	  if $word eq $term {
		@snippets.push(join(" ", [$previousTerm, $word]));
	  }
	  $previousTerm = $word;
    }
  }
  return @snippets;
}

sub get-matches(Str $term) {
  say "Finding matches for $term";
  my $file = open("terms.txt");
  my @snippets = get-file-matches($file, lc($term));  
  $file.close;
  
  say "Total matches found: " ~ @snippets.elems;
  return @snippets;
}

sub main() {
  my $term = prompt "Enter term to search: ";
  
  say get-matches($term);
}

main();