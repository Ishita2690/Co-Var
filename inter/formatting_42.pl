#! /usr/bin/perl

use Statistics::Basic qw(:all);


$in=@ARGV[0]; #interaction file name 
chomp $in;
@aa=`cat $in`;
open (pri,">laneA");
open (pri1,">laneB");
foreach $l(@aa)
{
        chomp $l;
        undef @bb;
        @bb=split(/\t/,$l);
	chomp @bb[0];chomp @bb[1];
	
	print pri "@bb[0]\n";
	print pri1 "@bb[1]\n";	
}
`cat laneA laneB |sort -n |uniq > $in.uniq`;
@nm=`cat $in.uniq`;
open (pri2,">$in-NetworkParam-int");
print pri2 "Node\tDegree\n";
foreach $w (@nm)
{
	chomp $w;
	$w=~ s/\;//g;
#	$ch1=`grep -w ";$w;" betweenness`;
	$ch2=`grep -w ";$w;" degree`;
#	$ch3=`grep -w ";$w;" clustering`;
#	$ch4=`grep -w ";$w;" closeness`;
#	@cc1=split(/\:/, $ch1);
#	chomp @cc1[1];
	@cc2=split(/\:/, $ch2);
	chomp $cc2[1];
$cc2[1]=~s/}//g;
push(@sax,$cc2[1]);
#	@cc3=split(/\:/, $ch3);
#	chomp @cc3[1];
#	@cc4=split(/\:/, $ch4);
#	chomp @cc4[1];
	print pri2 "$w\t$cc2[1]\n";	
	
}
$median = median( @sax );
print "$median";

@dos=`cat $in-NetworkParam-int`;
open (ri,">$in-HighDegCoEvo");

$pd=`pwd`;
chomp $pd;

foreach $de (@dos)
{
chomp $de;
@zz=split(/\t/, $de);
chomp $zz[1];
chomp $zz[0];

if( $zz[1] > $median)
{

$zz[0]=~s/$pd\///g;
print ri"$zz[0]\n";


}

}
