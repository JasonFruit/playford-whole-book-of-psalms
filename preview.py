import os, sys

fn = sys.argv[1]

os.system("cat preview.ly %s > tmp.ly" % fn)
os.system("lilypond -o %s tmp.ly" % fn.replace(".ly", ""))
os.system("rm tmp.ly")
