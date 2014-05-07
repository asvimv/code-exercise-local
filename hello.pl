#!/usr/bin/perl
use lib 'c:\\Perl64\\lib';
use strict ;
use warnings;
use LWP::Simple;
use JSON::PP;
use Data::Dumper::Names;

my $json_data = get(q[http://graph.facebook.com/pradeep.deepz]);

print $json_data;


