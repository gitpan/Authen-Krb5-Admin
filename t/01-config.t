#!/usr/bin/perl -w

# $Id: 01-config.t,v 1.3 2002/05/22 03:14:11 ajk Exp $

# Tests for creating and manipulating Authen::Krb5::Admin::Principal
# objects

use strict;
use Test;

BEGIN { plan test => 11 }

use Authen::Krb5::Admin qw(:constants);

my $c = Authen::Krb5::Admin::Config->new;
ok $c;

$c->admin_server('example.com');
ok $c->admin_server, 'example.com';
ok $c->mask & KADM5_CONFIG_ADMIN_SERVER;

$c->kadmind_port(1);
ok $c->kadmind_port, 1;
ok $c->mask & KADM5_CONFIG_KADMIND_PORT;

$c->kpasswd_port(2);
ok $c->kpasswd_port, 2;
ok $c->mask & KADM5_CONFIG_KPASSWD_PORT;

$c->profile('/tmp/krb5.conf');
ok $c->profile, '/tmp/krb5.conf';
ok $c->mask & KADM5_CONFIG_PROFILE;

$c->realm('PERL.TEST');
ok $c->realm, 'PERL.TEST';
ok $c->mask & KADM5_CONFIG_REALM;
