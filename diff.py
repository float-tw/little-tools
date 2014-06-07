import sys

if __name__=='__main__':
	f1 = open(sys.argv[1])
	f2 = open(sys.argv[2])
	ans1 = [ ans.strip("\r\n") for ans in f1.readlines() ]
	ans2 = [ ans.strip("\r\n") for ans in f2.readlines() ]
	f1.close()
	f2.close()
	diff = 0
	for i in xrange(len(ans1)):
		if ans1[i] != ans2[i]:
			print "{0:<5} {1:>3} {2:>3}".format(i+1, ans1[i], ans2[i])
			diff += 1
	print diff
	print "f1:{} f2:{}".format(len(ans1), len(ans2))
