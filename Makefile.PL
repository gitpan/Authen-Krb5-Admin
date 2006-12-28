# Copyright (c) 2002 Andrew J. Korty
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

# $Id: Makefile.PL,v 1.10 2006/12/28 18:37:32 ajk Exp $

use ExtUtils::MakeMaker;

# location of Kerberos 5 libraries and header files

print 'checking for Kerberos 5 prefix ... ';
my ($PREFIX) = grep { -r $_ . '/include/krb5.h' }
    qw(/opt/krb5 /usr/local /usr /usr/kerberos) or die 'Cannot find Kerberos 5';
print $PREFIX, "\n";

my $KRB5_BINDIR = join '/', $PREFIX, 'bin';
my $KRB5_LIBDIR = join '/', $PREFIX, 'lib';
my $KRB5_INCDIR = join '/', $PREFIX, 'include';

# any extra libraries or include flags

my $KRB5_EXTRALIBS = '';
my $KRB5_EXTRAINCS = '';

# principal used by test suite to authenticate to kadmin server (will
# prompt if undef--you must do your own kinit if you set this)

my $KADM5_PRINCIPAL = undef;

# principal/policy name used by test suite--will be created, modified,
# deleted, etc.

my $KADM5_TEST_NAME = 'perl_test';
my $KADM5_TEST_NAME_2 = 'perl_test_2';

##### DO NOT CHANGE ANYTHING BELOW HERE #####

# check for libk5crypto -- only in krb5-1.1 and above

print 'checking for libk5crypto ... ';
my $cryptolib;
if ( -r $KRB5_LIBDIR . '/libk5crypto.a' ||
     -r $KRB5_LIBDIR . '/libk5crypto.so' ) {
	print "found\n";
	$cryptolib = '-lk5crypto';
} else {
	print "not found (using libcrypto)\n";
	$cryptolib = '-lcrypto';
}

# get values for test suite

unless ($KADM5_PRINCIPAL) {
	print 'Authenticate as user/instance[@REALM] for testing [',
	    $ENV{USER}, '/admin]: ';
	$KADM5_PRINCIPAL = <STDIN>;
	chomp $KADM5_PRINCIPAL;
	$KADM5_PRINCIPAL ||= $ENV{USER} . '/admin';
}

unless ($KADM5_TEST_NAME) {
	print 'Use user/instance (should NOT exist!) for testing ',
	    '[perl_test]: ';
	$KADM5_TEST_NAME = <STDIN>;
	chomp $KADM5_TEST_NAME;
	$KADM5_TEST_NAME ||= 'perl_test';
}

unless ($KADM5_TEST_NAME_2) {
	print 'Use user/instance (should NOT exist!) for testing renames ',
	    '[perl_test_2]: ';
	$KADM5_TEST_NAME_2 = <STDIN>;
	chomp $KADM5_TEST_NAME_2;
	$KADM5_TEST_NAME_2 ||= 'perl_test_2';
}

sub MY::insert_kinit_maybe {
    my ($commands) = @_;
    my $test_cache = $ENV{PERL_KADM5_TEST_CACHE} || '/tmp/perl_test';
    my $new_vars = join ' ', "PERL_KADM5_PRINCIPAL=$KADM5_PRINCIPAL",
        "PERL_KADM5_TEST_NAME=$KADM5_TEST_NAME",
        "PERL_KADM5_TEST_NAME_2=$KADM5_TEST_NAME_2",
        "PERL_KADM5_TEST_CACHE=$test_cache ";
    $commands =~ s/PERL_DL_NONLAZY=1 /$new_vars /;
    return exists $ENV{PERL_KADM5_TEST_CACHE}
         ? $commands
         : "\t$KRB5_BINDIR/kinit -S kadmin/admin -c $test_cache -l 5m "
           . "$KADM5_PRINCIPAL\n$commands"
         ;
}

sub MY::test_via_harness {
    package MY;
    return insert_kinit_maybe shift->SUPER::test_via_harness(@_);
}

sub MY::test_via_script {
    package MY;
    return insert_kinit_maybe shift->SUPER::test_via_script(@_);
}

WriteMakefile(
	DEFINE		=> '',
	INC		=> join(' ', '-I' . $KRB5_INCDIR, $KRB5_EXTRAINCS),
	LIBS		=> [
				join(' ', '-L' . $KRB5_LIBDIR,
				    '-lkrb5 -lkadm5clnt', $cryptolib,
				    '-lcom_err'),
				$KRB5_EXTRALIBS
			],
	NAME		=> 'Authen::Krb5::Admin',
	PREREQ_PM	=> {'Authen::Krb5' => 1.2},
	VERSION_FROM	=> 'Admin.pm',
);
