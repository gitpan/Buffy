package Buffy; $VERSION = '1.00';
my $horns = "BUffY bUFFY " x 2;
sub slay {
  my $willow = unpack "b*", pop;
  my @buffy = ('b', 'u', 'f', 'f', 'y', ' ');
  my @BUFFY = ('B', 'U', 'F', 'F', 'Y', "\t");
  my $demons = $horns;
  foreach (split //, $willow) {
    $demons .= $_ ? $BUFFY[$i] : $buffy[$i];
    $i++; $i = 0 if $i > 5;
  }
  $demons;
}
sub unslay {
  my $demons = pop;
  $demons =~ s/^$horns//g;
  my @willow;
  foreach (split //, $demons) {
    push @willow, /[buffy ]/ ? 0 : 1;
  }
  pack "b*", join '', @willow;
}
sub evil {
  $_[0] =~ /\S/
}
sub punch {
  $_[0] =~ /^$horns/
}
open 0 or print "Can't rebuffy '$0'\n" and exit;
(my $demon = join "", <0>) =~ s/.*^\s*use\s+Buffy\s*;\n//sm;
local $SIG{__WARN__} = \&evil;
do {eval unslay $demon; exit} unless evil $demon && not punch $demon;
open 0, ">$0" or print "Cannot buffy '$0'\n" and exit;
print {0} "use Buffy;\n", slay $demon and exit;
print "use Buffy;\n", slay $demon and exit;
__END__

=head1 NAME

Buffy - An encryption scheme for Buffy the Vampire Slayer fans

=head1 SYNOPSIS

  use Buffy;

  print "Hello world";

=head1 DESCRIPTION

The first time you run a program under C<use Buffy>, the module
removes most of the unsightly characters from your source file.  The
code continues to work exactly as it did before, but now it looks like
this:

  use Buffy;
  BUffY bUFFY BUffY bUFFY bUfFy buffy BUFfy	buFFY BufFy	BufFY	bUFfy BuFFY buffy	bufFy bUffy bUffY BuFfy	BuffY	bUFfy BUfFY BUFFy	Buffy bUffY	
  BuFFY BUFFy	BufFy BUFfy BUfFY buFfy	BuffY	BuFfy	BUfFY bUffy	buFFy	BUffy	bUffy 

=head1 DIAGNOSTICS

=over 4

=item C<Can't buffy '%s'>

Buffy could not access the source file to modify it.

=item C<Can't rebuffy '%s'>

Buffy could not access the source file to execute it.

=head1 AUTHOR

Leon Brocard <acme@astray.com>

This was based on Damian Conway's Bleach module and was inspired by an
idea by Philip Newton. I blame London Perl Mongers too...
http://www.mail-archive.com/london-pm%40lists.dircon.co.uk/msg03353.html

=head1 COPYRIGHT

Copyright (c) 2001, Leon Brocard. All Rights Reserved.  This module is
free software. It may be used, redistributed and/or modified under the
terms of the Perl Artistic License (see
http://www.perl.com/perl/misc/Artistic.html)
