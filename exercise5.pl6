#! /usr/bin/perl6

class FileTermCounter {
  has Str $.source_file;

  method get-file-terms($file) {
    my %terms = ();
    for map { .chomp }, $file.lines -> $line {
      for grep { $_ ne '' }, map { my $s = $_; $s ~~ s:g/\W//; lc($s) }, split(/\s/, $line) -> $word {
        %terms{$word} = True;
      }
    }
    return %terms.keys;
  }

  method get-terms() {
    say "Finding unique terms";
    my $file = open($.source_file);
    my @terms = self.get-file-terms($file);  
    $file.close;
  
    say "Total terms found: " ~ @terms.elems;
    return @terms;
  }
}

sub main() {
  my $counter = FileTermCounter.new( source_file => "terms.txt" );
  my $sort = prompt "Sort terms? [y/n]: ";  
  my @terms = $counter.get-terms();
  
  say ($sort ~~ /:i^y/ ?? @terms.sort !! @terms);
}

main();
