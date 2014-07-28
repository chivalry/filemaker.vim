#!/usr/bin/env python

"""
Convert FileMaker help files, specifically for built-in functions, to Vim
  help files
Last Change: 2014 Jul 27
Version 1.0
Language: Python
Maintainer: Charles Ross <chivalry@mac.com>
License: The MIT License
"""

from FileMakerHelpParser import FileMakerHelpParser

parser = FileMakerHelpParser()
print parser.description()
