package Module::Install::CustomInstallationPath;

use strict;
use File::HomeDir;

use vars qw( @ISA $VERSION );

use Module::Install::Base;
@ISA = qw( Module::Install::Base );

$VERSION = '0.10.1';

# ---------------------------------------------------------------------------

sub Check_Custom_Installation
{
  my $self = shift;

  return if (grep {/^PREFIX=/} @ARGV) || (grep {/^INSTALLDIRS=/} @ARGV);

  my $install_location = $self->prompt(
    "Choose your installation type:\n[1] normal Perl locations\n" .
    "[2] custom locations\n=>" => '1');

  if ($install_location eq '2')
  {
    my $home = home();

    die "Your home directory could not be determined. Aborting."
      unless defined $home;

    print "\n","-"x78,"\n\n";

    my $prefix = $self->prompt(
      "What PREFIX should I use?\n=>" => $home);

    push @ARGV,"PREFIX=$prefix";
  }
}

1;

# ---------------------------------------------------------------------------

=head1 NAME

Module::Install::CustomInstallationPath - A Module::Install extension that
allows the user to interactively specify custom installation directories


=head1 SYNOPSIS

  In Makefile.PL:
    use inc::Module::Install;
    ...
    Check_Custom_Installation();


=head1 DESCRIPTION

This is a Module::Install extension that helps users who do not have root
access to install modules. It first prompts the user for a normal installation
into the default Perl paths, or a custom installation. If the user selects a
custom installation, it prompts the user for the value for PREFIX. This value
is then used to add PREFIX=value to @ARGV.

If the user specifies PREFIX or INSTALLDIRS as arguments to Makefile.PL, then
the prompts are skipped and a normal installation is done.


=head1 METHODS

=over 4

=item Check_Custom_Installation()

Imported into Makefile.PL by Module::Install when invoked. This causes the
prompts to be displayed and @ARGV to be updated (if necessary).

=back


head1 AUTHOR

David Coppit <david@coppit.org>.


=head1 LICENSE

This software is distributed under the terms of the GPL. See the file
"LICENSE" for more information.

=cut

