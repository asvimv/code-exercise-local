#!/usr/bin/perl
use lib 'c:\\Perl64\\lib';
use strict ;
use warnings;
use LWP::Simple;
use JSON;
use Data::Dumper;
use DBI;
use DBD::mysql;


#get the input file with json objects from github
my $json_data = get("$ARGV[0]");
die "Couldn't get it!" unless defined $json_data;

#store the JSON in a hash
my $json_obj = new JSON;
my $perl_data = $json_obj->decode($json_data);

#check if the hash is empty
if(!keys @{$perl_data}) 
{
	print " No JSON objects retrieved from the url";
}
else
{

	my $database = "testdb"
	my $connection = ConnectToMySql($database);

	#iterate through the json object to make up the insert 	#statement for the database insert opertaion
	for my $item( @{$perl_data} ){
    		my $name  = $item->{name};
    		my $id    = $item->{id};
    		my $value = $item->{value};
 		my $ts    = $item->{timestamp};

		#set the query
		my $query = "insert into persons(name, id, value,ts) 					vlaues(?,?,?,?)";

		# prepare your statement for connecting to the 		   		#database
		my $statement = $connection->prepare($query);

		#excute the statement
		$statement->execute($name,$id,$value,$ts);
	
	}
}


#--- start sub-routine ------------------------------------------------
sub ConnectToMySql {
#----------------------------------------------------------------------


#assing the connection specific values
my $database = shift;
my $host = "localhost";
my $userid = "user";
my $password = "passwd";

# assign the values to your connection variable
my $connectionInfo="dbi:mysql:$db:$host";


# make connection to database
my $l_connection = DBI->connect($connectionInfo,$userid,$password);

# the value of this connection is returned by the sub-routine
return $l_connection;

}





