#!/usr/local/bin/perl

$file = 'rscores.txt';	
open(INFO, $file);		
@lines = <INFO>;		
close(INFO);			
print @lines;			

$q1t = 0;
$nq1 = 0;
$q2t = 0;
$nq2 = 0;
$q3t = 0;
$nq3 = 0;
$q4t = 0;
$nq4 = 0;
$q5t = 0;
$nq5 = 0;
$h1t = 0;
$nh1 = 0;
$h2t = 0;
$nh2 = 0;
$h3t = 0;
$nh3 = 0;
$h4t = 0;
$nh4 = 0;
$h5t = 0;
$nh5 = 0;

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

if($q1 != "ab" || $q1 != "tbd")
{
$q1t += $q1;
$nq1 += 1;
}

if($q2 != "ab" || $q2 != "tbd")
{
$q2t += $q2;
$nq2 += 1;
}
if($q3 != "ab" || $q3 != "tbd")
{
$q3t += $q3;
$nq3 += 1;
}
if($q4 != "ab" || $q4 != "tbd")
{
$q4t += $q4;
$nq4 += 1;
}
if($q5 != "ab" || $q5 != "tbd")
{
$q5t += $q5;
$nq5 += 1;
}
if($h1 != "ab" || $h1 != "tbd")
{
$h1t += $h1;
$nh1 += 1;
}
if($h2 != "ab" || $h2 != "tbd")
{
$h2t += $h2;
$nh2 += 1;
}
if($h3 != "ab" || $h3 != "tbd")
{
$h3t += $h3;
$nh3 += 1;
}
if($h4 != "ab" || $h4 != "tbd")
{
$h4t += $h4;
$nh4 += 1;
}

# print "When $name is in the ring, the crowd might $email when the $q1 is used.\n";
# open(DAT,">temp.txt") || die("Cannot Open File");
# print DAT "Hi $name,\n\nHere is an update on your scores thus far in the 15-359 course. Quizzes: $q1, $q2, $q3. Homeworks: $h1, $h2. Please report any discrepancy to the course TAs.\n\nRavi\nVarun";
# system("./smtp.py ravishan\@cs.cmu.edu varun\@cs.cmu.edu $email\@andrew.cmu.edu \"Hello from 15-359 TAs\" temp.txt");

}

$aq1 = $q1t/32;
$aq2 = $q2t/32;
$aq3 = $q3t/32;
$aq4 = $q4t/32;
$aq5 = $q5t/32;
$ah1 = $h1t/32;
$ah2 = $h2t/32;
$ah3 = $h3t/32;
$ah4 = $h4t/32;
$qt = $aq1 + $aq2 + $aq3 + $aq4 + $aq5;
$ht = $ah1 + $ah2 + $ah3 + $ah4;

print "Quiz1: Total is $q1t and students is $nq1 \; avg is $aq1 \n";
print "Quiz2: Total is $q2t and students is $nq2 \; avg is $aq2 \n";
print "Quiz3: Total is $q3t and students is $nq3 \; avg is $aq3 \n";
print "Quiz4: Total is $q4t and students is $nq4 \; avg is $aq4 \n";
print "Quiz5: Total is $q5t and students is $nq5 \; avg is $aq5 \n";
print "HW1: Total is $h1t and students is $nh1 \; avg is $ah1 \n";
print "HW2: Total is $h2t and students is $nh2 \; avg is $ah2 \n";
print "HW3: Total is $h3t and students is $nh3 \; avg is $ah3 \n";
print "HW4: Total is $h4t and students is $nh4 \; avg is $ah4 \n";
print "Avg total Q: $qt Avg total HW: $ht \n";

