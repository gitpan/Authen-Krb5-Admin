#!/usr/bin/perl -w

# $Id: 34-cpw.t,v 1.4 2002/05/28 21:07:01 ajk Exp $

# Tests for changing passwords

use strict;
use Test;

BEGIN { plan test => 5 }

use Authen::Krb5;
use Authen::Krb5::Admin qw(:constants);

Authen::Krb5::init_context;
Authen::Krb5::init_ets;

my $handle =
    Authen::Krb5::Admin->init_with_creds($ENV{PERL_KADM5_PRINCIPAL},
    Authen::Krb5::cc_resolve('/tmp/perl_test'));
ok $handle or warn Authen::Krb5::Admin::error;

my $p = Authen::Krb5::parse_name($ENV{PERL_KADM5_TEST_NAME});
ok $p;

my $s = Authen::Krb5::parse_name('krbtgt/' . $p->realm);
ok $p;

my $pw = join '', map { chr rand 256 } 1..256;

ok $handle->chpass_principal($p, $pw) or warn Authen::Krb5::Admin::error;

ok Authen::Krb5::get_in_tkt_with_password($p, $s, $pw, undef)
    or warn Authen::Krb5::error;
