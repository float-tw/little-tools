#!/usr/bin/env python
# -*- coding: utf-8 -*-

import string
import sys
from random import Random

if( len(sys.argv) > 1 ):
	passwd_len = int(sys.argv[1])
else:
	passwd_len = 8

if( len(sys.argv) > 2 ):
	num = int(sys.argv[2])
else:
	num = 1

for i in range(num):
	#newpasswd = ''.join( Random().sample(string.letters+string.digits, passwd_len) )
	newpasswd = ''.join( Random().sample(string.lowercase, passwd_len) )
	print newpasswd
