#!/usr/bin/perl -w

# $Id: 20-addpol.t,v 1.4 2002/05/28 21:07:01 ajk Exp $

# Tests for adding policies

use strict;
use Test;

BEGIN { plan test => 15 }

use Authen::Krb5;
use Authen::Krb5::Admin qw(:constants);

Authen::Krb5::init_context;
Authen::Krb5::init_ets;

my $handle =
    Authen::Krb5::Admin->init_with_creds($ENV{PERL_KADM5_PRINCIPAL},
    Authen::Krb5::cc_resolve('/tmp/perl_test'));
ok $handle or warn Authen::Krb5::Admin::error;

my $p = Authen::Krb5::Admin::Policy->new;
ok $p;

$p->name($ENV{PERL_KADM5_TEST_NAME});
ok $p->name, $ENV{PERL_KADM5_TEST_NAME};
ok $p->mask & KADM5_POLICY;

$p->pw_history_num(1);
ok $p->pw_history_num, 1;
ok $p->mask & KADM5_PW_HISTORY_NUM;

$p->pw_max_life(10);
ok $p->pw_max_life, 10;
ok $p->mask & KADM5_PW_MAX_LIFE;

$p->pw_min_classes(3);
ok $p->pw_min_classes, 3;
ok $p->mask & KADM5_PW_MIN_CLASSES;

$p->pw_min_length(4);
ok $p->pw_min_length, 4;
ok $p->mask & KADM5_PW_MIN_LENGTH;

$p->pw_min_life(5);
ok $p->pw_min_life, 5;
ok $p->mask & KADM5_PW_MIN_LIFE;

ok $handle->create_policy($p) or warn Authen::Krb5::Admin::error;
