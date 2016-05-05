#!/usr/bin/perl
#tcpclient.pl

use IO::Socket::INET

$| = 1;

my ($socket,$client_socket);

$socket = new IO::Socket::INET(
PeerHost => '127.0.0.1',
PeerPort => '5000',
Proto => 'tcp'
) or die "ERROR in Socket Creation : $!\n";

print "TCP Connection Success,\n";
$data = <$socket>;

# $socket->recv($data,1024);

print"Received from server : $data\n";

$data = "DATA from Client";

print $socket "$data\n";

# $socket->send($data);

sleep(10);

$socket->close();
