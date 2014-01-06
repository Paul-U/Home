#!/usr/bin/python3

import os;
import shutil;
import sys;

for target in sys.argv[1:]:
    relpath = os.path.relpath(target, os.getenv("HOME"));
    linkfrom = os.path.join("{cwd}", relpath);
    os.makedirs(os.path.dirname(relpath));
    shutil.move(target,linkfrom);
    os.symlink(linkfrom,target);
    
