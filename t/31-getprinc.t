#!/usr/bin/perl -w

# $Id: 31-getprinc.t,v 1.3 2002/05/28 20:23:48 ajk Exp $

# Tests for retrieving principals

use strict;
use Test;

BEGIN { plan test => 14 }

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

my $adminp = Authen::Krb5::parse_name($ENV{PERL_KADM5_PRINCIPAL});
ok $adminp;

my $ap = $handle->get_principal($p);
ok $ap;

ok $ap->attributes, KRB5_KDB_DISALLOW_TGT_BASED;
ok $ap->aux_attributes, KADM5_POLICY;
ok $ap->kvno, 2;
ok $ap->max_life, 3;
ok $ap->max_renewable_life, 4;
ok(($ap->mod_name->data)[0], ($adminp->data)[0]);
ok $ap->policy, $ENV{PERL_KADM5_TEST_NAME};
ok $ap->princ_expire_time, 1021908731;
ok(($ap->principal->data)[0], ($p->data)[0]);
ok $ap->pw_expiration, 1021908826;



