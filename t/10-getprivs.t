#!/usr/bin/perl -w

# $Id: 10-getprivs.t,v 1.3 2002/05/28 20:23:48 ajk Exp $

# Tests for modifying principals

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

ok $handle->get_privs & (KADM5_PRIV_GET | KADM5_PRIV_ADD |
    KADM5_PRIV_MODIFY | KADM5_PRIV_DELETE) or warn 'Principal ',
    $ENV{PERL_KADM5_PRINCIPAL}, ' needs GET, ADD, MODIFY, and DELETE ',
    "kadmin privileges to run these tests.\n";
