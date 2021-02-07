#!/usr/bin/env python

import smtplib, sys, time

# change this to a new SMTP server if desired
smtpHost = 'smtp.srv.cs.cmu.edu'

# sys.argv[1] is the sender
# sys.argv[2] is the filename pointing to the list of recipients
# sys.argv[3] is the subject
# sys.argv[4] is the message content

if len(sys.argv) != 6:
  print 'Usage: ./smtp <sender> <recipient FN> <subj> <msg FN>'
  sys.exit(1)

# each recipient takes one line; '#' signals comments
# rList = []
# for line in open(sys.argv[2]).readlines():
#   r = line.split('#')[0].strip()
#  if r: rList.append(r)

sender = sys.argv[1]
ccer = sys.argv[2]
receiver = sys.argv[3]
subj = sys.argv[4]
date = time.ctime(time.time())
msg = 'From: %s\nTo: %s\nCc: %s\nDate: %s\nSubject: %s\n%s' \
       % (sender, receiver, ccer, date, subj, open(sys.argv[5]).read())

server = smtplib.SMTP(smtpHost) # connect, no login step
failed = server.sendmail(sender, receiver, msg)
server.quit() 

if failed:
  print 'smtp.py: Failed recipients:', failed
else:
  print 'smtp.py: No errors.'
