#!/usr/bin/perl -w

# $Id: 00-loadme.t,v 1.1 2002/05/21 18:36:39 ajk Exp $

# Test for loading the module

use strict;
use Test;

BEGIN { plan test => 1 }

use strict;
use Authen::Krb5::Admin;

ok 1;

