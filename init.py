#!/usr/bin/python3

import os;
import re;
from stat import *
import argparse

parser = argparse.ArgumentParser(description="Initialize dotfiles for your $HOME")
parser.add_argument("-y", dest="auto", action="store_const", const=True, default=False,
                    help="Automatically Overwrite, even if the same named file exists.")

args=parser.parse_args()

if args.auto:
    print("running in automatic mode.")

foo=lambda s:os.path.abspath(os.path.normpath(s))

fnames = [(root[2:],fname)
        for root,dirs,fnames in os.walk(".") if not ".git" in root and "./init.d" != root
        for fname in fnames if not ".git" in fname
        ]
ignore= ("./README.org", "./init.py", "./add-dotfiles-repos");
fnames = ([item for item in fnames
    if not foo(os.path.join(item[0],item[1])) in [foo(file) for file in ignore]]);

for root,fname in fnames:
    targetdir = foo(os.path.join(os.environ.get("HOME"),root))
    if not os.path.exists(targetdir):
        os.makedirs(targetdir);

    target = foo(os.path.join(targetdir,fname));
    base   = foo(os.path.join(root,fname));
    try:
        if os.path.exists(target):
            if os.path.samefile(base,target):
                continue;
            while True:
                if args.auto:
                    ans = True
                else:
                    input_text = input("%s exists. Replace it? [Y/n] "%(target));
                    if re.match("^[Nn][Oo]?$",input_text):
                        raise Exception;
                    ans = re.match("^[Yy]([Ee][Ss])?$",input_text)
                    
                if ans:
                    os.remove(target);
                    break;
        os.symlink(base,target);
        print("make symbolic link from %s to %s"%
                (base,target))
    except:
        pass;
    else:
        pass;

scriptname=os.path.join(os.getenv("HOME"),"bin","add-dotfiles-repos");
with open(scriptname, "w") as of:
    of.write(open("add-dotfiles-repos").read().format(cwd=os.getcwd()));
os.chmod(scriptname,
        S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IROTH);

for root,dirs,fnames in os.walk("init.d"):
    for fname in fnames:
        f = root+"/"+fname
        if os.stat(f).st_mode & S_IXUSR:
            os.system(root+"/"+fname)
