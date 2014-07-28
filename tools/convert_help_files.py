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
        output = ''
        output += '----------------------------------------'
        output += '---------------------------------------\n'

        full_tag       = '*filemaker-func-' + parser.name.lower() + '*'
        short_tag      = '*fmv-func-' + parser.name.lower() + '*'
        full_tag_line  = full_tag.rjust(79) + '\n'
        short_tag_line = short_tag.rjust(79) + '\n'
        output        += full_tag_line + short_tag_line

        output += parser.name + '\n\n'

        output += 'Purpose\n-------\n'
        output += parser.purpose + '\n\n'

        output += 'Format\n------\n'
        output += parser.format + '\n\n'

        output += 'Parameters\n----------\n'
        for param in parser.params:
            output += param + '\n'
        output += '\n'

        output += 'Data type returned\n------------------\n'
        output += parser.datatype + '\n\n'

        output += 'Originated in\n-------------\n'
        output += parser.origin + '\n\n'

        output += 'Description\n-----------\n'
        for desc in parser.desc:
            output += desc + '\n'
        output += '\n'

        output += 'Examples\n--------\n'
        for examp in parser.examp:
            output += examp + '\n'
        output += '\n'

        output += parser.note

        print output

        # print parser.description()
