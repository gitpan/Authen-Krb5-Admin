#!/usr/bin/perl -w

# $Id: 92-delpol.t,v 1.4 2002/05/28 21:07:01 ajk Exp $

# Tests for deleting policies

use strict;
use Test;

BEGIN { plan test => 2 }

use Authen::Krb5;
use Authen::Krb5::Admin qw(:constants);

Authen::Krb5::init_context;
Authen::Krb5::init_ets;

my $handle =
    Authen::Krb5::Admin->init_with_creds($ENV{PERL_KADM5_PRINCIPAL},
    Authen::Krb5::cc_resolve('/tmp/perl_test'));
ok $handle or warn Authen::Krb5::Admin::error;

ok $handle->delete_policy($ENV{PERL_KADM5_TEST_NAME})
    or warn Authen::Krb5::Admin::error;
