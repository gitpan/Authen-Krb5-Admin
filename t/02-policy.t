#!/usr/bin/perl -w

# $Id: 02-policy.t,v 1.2 2002/05/28 20:11:33 ajk Exp $

# Tests for creating and manipulating Authen::Krb5::Admin::Policy
# objects

use strict;
use Test;

BEGIN { plan test => 14 }

use Authen::Krb5::Admin qw(:constants);

my $p = Authen::Krb5::Admin::Policy->new;
ok $p;

$p->mask(KADM5_PW_HISTORY_NUM);
ok $p->mask, KADM5_PW_HISTORY_NUM;

$p->mask(0);
ok $p->mask, 0;

$p->name($ENV{PERL_KADM5_TEST_NAME});
ok $p->name, $ENV{PERL_KADM5_TEST_NAME};

$p->pw_history_num(1);
ok $p->pw_history_num, 1;
ok $p->mask & KADM5_PW_HISTORY_NUM;

$p->pw_max_life(2);
ok $p->pw_max_life, 2;
ok $p->mask & KADM5_PW_MAX_LIFE;

$p->pw_min_classes(3);
ok $p->pw_min_classes, 3;
ok $p->mask & KADM5_PW_MIN_CLASSES;

$p->pw_min_length(4);
ok $p->pw_min_length, 4;
ok $p->mask & KADM5_PW_MIN_LENGTH;

$p->policy_refcnt(5);
ok $p->policy_refcnt, 5;
ok !($p->mask & KADM5_REF_COUNT);
