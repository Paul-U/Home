#!/usr/bin/python3

import os;
import sys;
import re;

haskell = """
module Apps (apps) where

apps :: [String]
apps = ["urxvt","emacs","gvim","opera","pcmanfm","keepass","firefox","qgit",
        "","","","","systemctl hibernate"]
"""[1:]

filepath = os.path.expanduser("~/.xmonad/lib/Apps.hs")

if os.path.exists(filepath):
    while True:
        ans = input("%s exists. Replace it? [Y/n] "%(filepath))
        if re.match("^[Yy]([Ee][Ss])?$",ans):
            os.remove(filepath);
            break;
        elif re.match("^[Nn][Oo]?$",ans):
            sys.exit(0)

os.system("mkdir -p "+os.path.dirname(filepath))
with open(filepath,"w") as of:
    of.write(haskell)

