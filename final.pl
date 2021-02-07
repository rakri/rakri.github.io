#!/usr/local/bin/perl

$file = 'rorig.tsv';		
open(INFO, $file);		
@lines = <INFO>;		
close(INFO);			
print @lines;			
foreach $student (@lines)
{
 chomp($student);
 ($email,$final)=split(/\|/,$student);
$email =~ s/\s*$//;

# print "When $name is in the ring, the crowd might $email when the $q1 is used.\n";
 open(DAT,">temp.txt") || die("Cannot Open File");
 print DAT "Hi,\n\nSince there were some queries about your scores in the final, we've decided to email everybody their scores. The finals are available for pick-up with Charlotte Yano (GHC 8118). In the final, your score is $final (upon 100).\n\nThanks and Happy Holidays!\nRavi\nVarun";
 system("./smtp.py ravishan\@cs.cmu.edu varun\@cs.cmu.edu $email\@andrew.cmu.edu \"15-359 Final Update\" temp.txt");

}

