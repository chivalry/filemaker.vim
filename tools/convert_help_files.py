#!/usr/bin/env python

"""
Convert FileMaker help files, specifically for built-in functions, to Vim
  help files
Last Change: 2014 Jul 28
Version 1.0
Language: Python
Maintainer: Charles Ross <chivalry@mac.com>
License: The MIT License
"""

import sys
from FileMakerHelpParser import FileMakerHelpParser

if len(sys.argv) == 1:
    parser = FileMakerHelpParser()
    print parser.description()
else:
    for file in sys.argv[1:]:
        parser = FileMakerHelpParser(file)
        print parser.description()
