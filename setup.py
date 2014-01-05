#!/usr/bin/python3

import os;
import re;

foo=lambda s:os.path.abspath(os.path.normpath(s))

fnames = ([(root[2:],fname)
          for root,dirs,fnames in os.walk(".")
              if not ".git" in root
          for fname in fnames
              if not ".git" in fname]);
ignore= ("./README.org","./setup.py");
fnames =[item for item in fnames if not foo(os.path.join(item[0],item[1])) in [foo(file) for file in ignore]];

for root,fname in fnames:
    targetdir = foo(os.path.join(os.environ.get("HOME"),root))
    if not os.path.exists(targetdir):
        os.makedirs(targetdir);
        
    target = os.path.join(targetdir,fname);
    
    try:
        if os.path.exists(target):
            while True:
                ans = input("%s exists. Replace it? [Y/n] "%(foo(target)));
                if re.match("^[Yy]([Ee][Ss])?$",ans):
                    os.remove(target);
                    break;
                elif re.match("^[Nn][Oo]?$",ans):
                    raise Exception;
        os.symlink(foo(os.path.join(root,fname)),foo(target));
        print("make symbolic link from %s to %s"%
              (foo(os.path.join(root,fname)),foo(target)))
    except:
        pass;
    else:
        pass;
