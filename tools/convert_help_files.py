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

from sys import argv, exit
from os import listdir
from shutil import copyfile
from FileMakerHelpParser import FileMakerHelpParser

if len(argv) == 1:
    dir_name = 'function_refs'
    files = listdir(dir_name)
    files.remove('.DS_Store')
    files = [dir_name + '/' + s for s in files]

else:
    files = argv[1:]

copyfile('functions_template.txt', 'functions.txt')
for file in files:
    parser = FileMakerHelpParser(file)
    output = parser.output()

    with open('functions.txt', 'a') as templ_file:
        templ_file.write(output)

modeline = 'vim: ft=help:tw=78:ts=2'
with open('functions.txt', 'a') as templ_file:
    templ_file.write(modeline)
