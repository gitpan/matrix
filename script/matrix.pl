#! /usr/local/bin/perl -w


#################################################################################
#										#
#  										#
#   Matrix v.0.1								#
#   Copyright (C) 2003-2004 - Steven Schubiger <steven@accognoscere.org>	#
#   Last changes: 14th November 2004						#
#										#
#   This program is free software; you can redistribute it and/or modify	#
#   it under the terms of the GNU General Public License as published by	#
#   the Free Software Foundation; either version 2 of the License, or		#
#   (at your option) any later version.						#
#										#
#   This program is distributed in the hope that it will be useful,		#
#   but WITHOUT ANY WARRANTY; without even the implied warranty of		#
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the		#
#   GNU General Public License for more details.				#
#										#
#   You should have received a copy of the GNU General Public License		#
#   along with this program; if not, write to the Free Software			#
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA	#
#										#
#										#
#################################################################################




use strict;
my ($case, $digit, $fillup, $letter);

user_input();
draw_matrix();

sub user_input {
    INPUT:

    print 'Please input an odd number >= 3: ';
    chomp ($digit = <STDIN>);
    print 'Please input a letter (a-z/A-Z): ';
    chomp ($letter = <STDIN>);
    print 'Fillup char: ';
    chomp ($fillup = <STDIN>);

    if ($digit < 3) {
        print "\n$digit too small.\n";
        goto INPUT;
    } 
    elsif ($digit % 2 == 0) {
        print "\n$digit not an odd number.\n";
        sleep (1);
        goto INPUT;
    } 
    elsif ($letter !~ /[a-z]/i) {
        print "\n$letter not a letter.\n";
        sleep (1);
        goto INPUT;
    }

    $case = $letter =~ /[a-z]/ ? 'lower' : 'upper';
}

sub draw_matrix {
    my $times = 1;
    print "\n";

    for (my $i = 1; $i <= $digit; $i++) {
        if ($i < ($digit / 2)) {
            print $fillup x (($digit - $times) / 2);

            if (defined( $letter )) { 
                print $letter x $times; 
            } 
            else { 
                print $i x $times; 
            }

            print $fillup x (($digit - $times) / 2);
            print "\n";

            $times += 2;
        } else {
            print $fillup x (($digit - $times) / 2);

            if (defined ($letter) ) { 
                print $letter x $times; 
            } 
            else {
                print $i x $times; 
            }

            print $fillup x (($digit - $times) / 2);
            print "\n";

            $times -= 2;
        }

        if (defined( $letter )) {
            $letter = chr( ord( $letter ) + 1 );

            if ($letter !~ /[a-z]+/i) { 
                $letter = $case eq 'lower' ? 'a' : 'A';
            }
        }
    }
}