#!/usr/bin/perl -w

# $Id: 35-randkey.t,v 1.3 2002/05/28 20:23:48 ajk Exp $

# Tests for randomizing keys

use strict;
use Test;

BEGIN { plan test => 6 }

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

my $ap = $handle->get_principal($p);
ok $ap;

my $kvno = $ap->kvno;

my @keys = $handle->randkey_principal($p);
ok scalar @keys or warn Authen::Krb5::Admin::error;

$ap = $handle->get_principal($p);
ok $ap;

ok $ap->kvno, $kvno + 1;
