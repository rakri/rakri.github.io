#!/usr/local/bin/perl

$file = 'rorig.csv';		
open(INFO, $file);		
@lines = <INFO>;		
close(INFO);			
print @lines;			
foreach $student (@lines)
{
 chomp($student);
 ($name,$email,$q1,$q2,$q3,$q4,$q5,$h1,$h2,$h3,$h4,$h5)=split(/\|/,$student);
$name =~ s/\s*$//;
$email =~ s/\s*$//;
$q1 =~ s/\s*$//;
$q2 =~ s/\s*$//;
$q3 =~ s/\s*$//;
$q4 =~ s/\s*$//;
$q5 =~ s/\s*$//;
$h1 =~ s/\s*$//;
$h2 =~ s/\s*$//;
$h3 =~ s/\s*$//;
$h4 =~ s/\s*$//;
$h5 =~ s/\s*$//;
$name = lc $name;
$name =~ s/(\w+)/\u$1/g;

# print "When $name is in the ring, the crowd might $email when the $q1 is used.\n";
 open(DAT,">temp.txt") || die("Cannot Open File");
 print DAT "Hi All,\n\nSorry for the late notice, but this is just to let you know that we haveput up notes on Lecture 26 in the course blog webpage. The second part of the lecture (on Coding Theory) however will not be included for the final.\n\nGood luck on the final!\nRavi\nVarun";
 system("./smtp.py ravishan\@cs.cmu.edu varun\@cs.cmu.edu $email\@andrew.cmu.edu \"15-359 Final\" temp.txt");

}

