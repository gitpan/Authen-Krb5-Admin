#!/usr/bin/perl -w

# $Id: 30-addprinc.t,v 1.4 2002/05/28 21:07:01 ajk Exp $

# Tests for adding principles

use strict;
use Test;

BEGIN { plan test => 20 }

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

my $ap = Authen::Krb5::Admin::Principal->new;
ok $ap;

$ap->attributes(KRB5_KDB_DISALLOW_TGT_BASED);
ok $ap->attributes, KRB5_KDB_DISALLOW_TGT_BASED;
ok $ap->mask & KADM5_ATTRIBUTES;

$ap->kvno(2);
ok $ap->kvno, 2;
ok $ap->mask & KADM5_KVNO;

$ap->max_life(3);
ok $ap->max_life, 3;
ok $ap->mask & KADM5_MAX_LIFE;

$ap->max_renewable_life(4);
ok $ap->max_renewable_life, 4;
ok $ap->mask & KADM5_MAX_RLIFE;

$ap->policy($ENV{PERL_KADM5_TEST_NAME});
ok $ap->policy, $ENV{PERL_KADM5_TEST_NAME};
ok $ap->mask & KADM5_POLICY;

$ap->princ_expire_time(1021908731);
ok $ap->princ_expire_time, 1021908731;
ok $ap->mask & KADM5_PRINC_EXPIRE_TIME;

$ap->principal($p);
ok $ap->principal->realm, $p->realm;
ok $ap->mask & KADM5_PRINCIPAL;

$ap->pw_expiration(1021908826);
ok $ap->pw_expiration, 1021908826;
ok $ap->mask & KADM5_PW_EXPIRATION;

ok $handle->create_principal($ap, join '', map { chr rand 256 } 1..256)
    or warn Authen::Krb5::Admin::error;
