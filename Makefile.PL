# $Id: Makefile.PL,v 1.3 2002/05/22 03:25:48 ajk Exp $

use ExtUtils::MakeMaker;

# location of Kerberos 5 libraries and header files

print 'checking for Kerberos 5 prefix ... ';
my ($PREFIX) = grep { -r $_ . '/include/krb5.h' }
    qw(/opt/krb5 /usr/local /usr) or die 'Cannot find Kerberos 5';
print $PREFIX, "\n";

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
	$KADM5_PRINCIPAL = <>;
	chomp $KADM5_PRINCIPAL;
	$KADM5_PRINCIPAL ||= $ENV{USER} . '/admin';
}

unless ($KADM5_TEST_NAME) {
	print 'Use user/instance (should NOT exist!) for testing ',
	    '[perl_test]: ';
	$KADM5_TEST_NAME = <>;
	chomp $KADM5_TEST_NAME;
	$KADM5_TEST_NAME ||= 'perl_test';
}

sub MY::test_via_harness {
	package MY;
	my $inherited = shift->SUPER::test_via_harness(@_);
	$inherited =~ s/PERL_DL_NONLAZY=1 /PERL_KADM5_PRINCIPAL=$KADM5_PRINCIPAL PERL_KADM5_TEST_NAME=$KADM5_TEST_NAME /;
	join '', "\tkinit -c /tmp/perl_test -l 5m ", $KADM5_PRINCIPAL,
	    "\n", $inherited;
}

sub MY::test_via_script {
	package MY;
	my $inherited = shift->SUPER::test_via_script(@_);
	$inherited =~ s/PERL_DL_NONLAZY=1 /PERL_KADM5_PRINCIPAL=$KADM5_PRINCIPAL PERL_KADM5_TEST_NAME=$KADM5_TEST_NAME /;
	join '', "\tkinit -c /tmp/perl_test -l 5m ", $KADM5_PRINCIPAL,
	    "\n", $inherited;
}

WriteMakefile(
	NAME		=> 'Authen::Krb5::Admin',
	VERSION_FROM	=> 'Admin.pm',
	LIBS		=> [
				join(' ', '-L' . $KRB5_LIBDIR,
				    '-lkrb5 -lkadm5clnt', $cryptolib,
				    '-lcom_err'),
				$KRB5_EXTRALIBS
			],
	DEFINE		=> '',
	INC		=> join ' ', '-I' . $KRB5_INCDIR, $KRB5_EXTRAINCS
);
