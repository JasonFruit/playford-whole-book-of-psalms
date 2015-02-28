import re
from glob import glob

title_rgx = re.compile(r'tuneTitle = "([^"]+)"')

titles = set([])

for fn in [fn for fn in glob("*.ly")
           if "tmpl" not in fn]:
    lilypond = open(fn, "r").read()
    matches = title_rgx.findall(lilypond)
    if matches:
        titles.add(matches[0])
        
for title in sorted(list(titles)):
    print title
    
