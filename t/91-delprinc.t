#!/usr/bin/perl -w

# $Id: 91-delprinc.t,v 1.4 2002/05/28 21:07:01 ajk Exp $

# Tests for deleting principals

use strict;
use Test;

BEGIN { plan test => 3 }

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

ok $handle->delete_principal($p) or warn Authen::Krb5::Admin::error;
