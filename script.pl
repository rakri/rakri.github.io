#!/usr/local/bin/perl

#$file = 'rorig.csv';		
$file = 'r.txt';		
open(INFO, $file);		
@lines = <INFO>;		
close(INFO);			
print @lines;			
foreach $student (@lines)
{
 chomp($student);
 ($name,$email,$h6,$h7,$h8,$h9,$h10,$h11,$q6,$q7,$q8,$q9,$q10)=split(/\|/,$student);
$name =~ s/\s*$//;
$email =~ s/\s*$//;
$q6 =~ s/\s*$//;
$q7 =~ s/\s*$//;
$q8 =~ s/\s*$//;
$q9 =~ s/\s*$//;
$q10 =~ s/\s*$//;
$h6 =~ s/\s*$//;
$h7 =~ s/\s*$//;
$h8 =~ s/\s*$//;
$h9 =~ s/\s*$//;
$h10 =~ s/\s*$//;
$h11 =~ s/\s*$//;
$name = lc $name;
$name =~ s/(\w+)/\u$1/g;

# print "When $name is in the ring, the crowd might $email when the $q1 is used.\n";
 open(DAT,">temp.txt") || die("Cannot Open File");
 print DAT "Hi $name,\n\nHere is an update on your scores thus far in the 15-359 course. Quizzes 6-10: $q6, $q7, $q8, $q9, $q10. Homeworks 6-11: $h6/30, $h7/40, $h8/40, $h9/50, $h10/60, $h11/60. We will also put up the averages on the blog by tonight. Please report any discrepancy to the course TAs.\n\nGood luck on the final!\nRavi\nVarun";
 system("./smtp.py ravishan\@cs.cmu.edu varun\@cs.cmu.edu $email\@cs.cmu.edu \"Hello from 15-359 TAs\" temp.txt");

}

