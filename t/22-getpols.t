#!/usr/bin/perl -w

# $Id: 22-getpols.t,v 1.3 2002/05/28 20:23:48 ajk Exp $

# Tests for listing policies

use strict;
use Test;

BEGIN { plan test => 4 }

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

ok grep { $_ eq $ENV{PERL_KADM5_TEST_NAME} } $handle->get_policies;
ok grep { $_ eq $ENV{PERL_KADM5_TEST_NAME} } $handle->get_policies('perl_*');
