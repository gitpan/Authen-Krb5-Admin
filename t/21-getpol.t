#!/usr/bin/perl -w

# $Id: 21-getpol.t,v 1.3 2002/05/28 20:23:48 ajk Exp $

# Tests for retrieving policies

use strict;
use Test;

BEGIN { plan test => 9 }

use Authen::Krb5;
use Authen::Krb5::Admin qw(:constants);

Authen::Krb5::init_context;
Authen::Krb5::init_ets;

my $handle =
    Authen::Krb5::Admin->init_with_creds($ENV{PERL_KADM5_PRINCIPAL},
    Authen::Krb5::cc_resolve('/tmp/perl_test'));
ok $handle or warn Authen::Krb5::Admin::error;

my $p = $handle->get_policy($ENV{PERL_KADM5_TEST_NAME});

ok $p;
ok $p->name, $ENV{PERL_KADM5_TEST_NAME};
ok $p->pw_history_num, 1;
ok $p->pw_max_life, 10;
ok $p->pw_min_classes, 3;
ok $p->pw_min_length, 4;
ok $p->pw_min_life, 5;
ok $p->policy_refcnt, 0;
