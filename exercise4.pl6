#! /usr/bin/perl6

class FileMatcher {
  has Str $.source_file;

  method get-file-matches($file, Str $term) {
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

  method get-matches(Str $term) {
    say "Finding matches for $term";
    my $file = open($.source_file);
    my @snippets = self.get-file-matches($file, lc($term));  
    $file.close;
  
    say "Total matches found: " ~ @snippets.elems;
    return @snippets;
  }
}

sub main() {
  my $term = prompt "Enter term to search: ";
  my $matcher = FileMatcher.new( source_file => "terms.txt" );

  say $matcher.get-matches($term);
}

main();
