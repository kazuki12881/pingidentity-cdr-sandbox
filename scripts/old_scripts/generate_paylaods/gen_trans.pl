#!/usr/bin/perl -w
use Data::UUID;
open(SHOPS,"shops.txt");
my $int=1;
my $token=$ENV{'TOKEN'}; 
print "token is $token";
my @shops;
while(my $line=<SHOPS>)
{
chomp $line;
push @shops, $line;
}

open(ACC,"accounts.txt");
while (my $line=<ACC>)
{
chomp $line;
my $filename=&gen_payload();
my $cmd=<<EOF
curl -H "Content-Type: application/json" -H "Authorization: Bearer $token" --data \@$filename http://localhost:8088/dio-au/v1/brand/abaaef28-e212-4532-8223-c875e80692ac/branch/e93331de-3de6-4401-9429-b166e983304c/bank-account/$line/transaction

EOF
;
system($cmd);
#print $cmd
}


