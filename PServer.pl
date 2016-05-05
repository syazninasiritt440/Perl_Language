#!/usr/bin/perl
#tcpserver.pl

use IO::Socket::INET;

# flush after every write

$| =1;

my ($socket,$client_socket);
my ($peeraddress,$peerport);

$socket= new IO::Socket::INET(
  LocalHost => '127.0.0.1',
  LocalPort => '5000',
  Proto => 'tcp',
  Listen => 5,
  Reuse => 1
)or die "ERROR in socket Creation : $!\n";

print "SERVER Waiting for client connection on port 5000";

while(1)
{

$client_socket = $socket->accept();
$peer_address - $client_socket->peerhost();
$peer_port = $client_socket->peerport();

print "Accepted New Client Connection From : $peeraddress, $peerport\n";

$data = "DATA from Server";

print $client_socket "$data\n";

$client_socket->send($data);

$data = <$client_socket>;

# $client_socket->recv($data,1024);

print "Received from Client : $data\n";

}

$socket->close();
