#/usr/bin/perl

use strict;
use inc::Module::Install;

name            ('Module-Install-CustomInstallationPath');
author          ('David Coppit <david@coppit.org>');
abstract_from   ('lib/Module/Install/CustomInstallationPath.pm');
version_from    ('lib/Module/Install/CustomInstallationPath.pm');
license         ('gpl');

requires        (
                  'File::HomeDir',
                  'Module::Install',
                );

include         ('ExtUtils/AutoInstall.pm');
auto_install    ( -default => 0 );

WriteAll();

print "\n", '-'x78, "\n\n";

exit;
