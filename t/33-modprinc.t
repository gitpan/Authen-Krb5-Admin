#!/usr/bin/perl -w

# $Id: 33-modprinc.t,v 1.5 2002/05/28 23:38:18 ajk Exp $

# Tests for modifying principals

use strict;
use Test;

BEGIN { plan test => 28 }

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

$ap->attributes(0);
ok $ap->attributes, 0;
ok $ap->mask & KADM5_ATTRIBUTES;

$ap->kvno(5);
ok $ap->kvno, 5;
ok $ap->mask & KADM5_KVNO;

$ap->max_life(6);
ok $ap->max_life, 6;
ok $ap->mask & KADM5_MAX_LIFE;

$ap->max_renewable_life(7);
ok $ap->max_renewable_life, 7;
ok $ap->mask & KADM5_MAX_RLIFE;

$ap->policy_clear;
ok !defined $ap->policy;
ok $ap->mask & KADM5_POLICY_CLR;

# set expire time to zero so cpw test will work later

$ap->princ_expire_time(0);
ok $ap->princ_expire_time, 0;
ok $ap->mask & KADM5_PRINC_EXPIRE_TIME;

$ap->principal($p);
ok(($ap->principal->data)[0], ($p->data)[0]);
ok $ap->mask & KADM5_PRINCIPAL;

$ap->pw_expiration(1021993140);
ok $ap->pw_expiration, 1021993140;
ok $ap->mask & KADM5_PW_EXPIRATION;

ok $handle->modify_principal($ap) or warn Authen::Krb5::Admin::error;

$ap = $handle->get_principal($p);

ok $ap->attributes, 0;
ok $ap->kvno, 5;
ok $ap->max_life, 6;
ok $ap->max_renewable_life, 7;
ok !defined $ap->policy;
ok $ap->princ_expire_time, 0;
ok(($ap->principal->data)[0], ($p->data)[0]);
ok $ap->pw_expiration, 1021993140;
