#!/usr/bin/env python

"""
Extracts the information in a FileMaker HTML help file into instance
  variables that can be accessed by the calling script.
Last Change: 2014 Jul 28
Version 1.0
Language: Python
Maintainer: Charles Ross <chivalry@mac.com>
License: The MIT License
"""

import pprint
import sys

from bs4 import BeautifulSoup, Tag, NavigableString
from cStringIO import StringIO

class FileMakerHelpParser:

    hierarchy = {'desc':  ['fdh-funcdeschead', 'feh-funcexamhead'],
                 'examp': ['feh-funcexamhead', 'n-note']}

# ==============================================================================
    def find_div(self, class_):
        return self.content.find('div', class_=class_)

# ==============================================================================

    def format_div(self, div):
        result = ''

        for child in div:
            if type(child) is Tag:
                if child.name == 'a':
                    result += child.string

                elif child.name == 'span' and 'c-code' in child['class']:
                    result += '`' + child.string + '`'

                elif child.name == 'span' and 'g-glosslink' in child['class']:
                    result += child.string

                elif child.name == 'span' and 'o-onscreen' in child['class']:
                    result += child.string

                elif child.name == 'span' and 'zan-autonum' in child['class']:
                    result += 'Note: '

            else:
                result += child.string

        result = result.replace('\n', '')
        result = result.replace(u"\u2019", "'")
        result = result.replace(u"\u2022", "  -")

        return result

# ==============================================================================

    def get_purpose(self):
        purpose_div = self.find_div('fpu-funcpurpose')
        return self.format_div(purpose_div)

# ==============================================================================

    def get_params(self):
        param_head = self.find_div('fpah-funcparamhead')
        params = []

        for sibling in param_head.next_siblings:
            if type(sibling) is Tag:
                if 'b-body' in sibling['class']:
                    params.append(self.format_div(sibling))

                else:
                    break

        return params

# ==============================================================================

    def get_datatype(self):
        type_head = self.find_div('frh-funcreturnhead')

        for sibling in type_head.next_siblings:

            if type(sibling) is Tag:
                return sibling.string

# ==============================================================================

    def get_origin(self):
        result = self.find_div('or-origin').string
        result = result.replace(u"\u00A0", ' ')

        return result

# ==============================================================================

    def get_hierarchy(self, type_):
        class_      = FileMakerHelpParser.hierarchy[type_][0]
        break_class = FileMakerHelpParser.hierarchy[type_][1]

        head = self.find_div(class_)
        result = []

        for sibling in head.next_siblings:
            if type(sibling) is Tag:
                if break_class in sibling['class']:
                    break

                elif 'b-body' in sibling['class']:
                    result.append(self.format_div(sibling))

                elif 'bu1-bullet1_outer' in sibling['class']:
                    tds = sibling.find_all('div', class_='bu1-bullet1_inner')
                    line = tds[1]
                    result.append('  - ' + self.format_div(line))

        return result

# ==============================================================================

    def description(self):
        result = {}
        result['name']     = self.name
        result['purpose']  = self.purpose
        result['format']   = self.format
        result['params']   = self.params
        result['datatype'] = self.datatype
        result['origin']   = self.origin
        result['desc']     = self.desc
        result['examp']    = self.examp
        result['note']     = self.note

        pp = pprint.PrettyPrinter(indent=2)

        old_stdout = sys.stdout
        sys.stdout = redirect = StringIO()
        pp.pprint(result)
        sys.stdout = old_stdout

        return redirect.getvalue()

# ==============================================================================

    def build_tag(self, type_):
        if type_ == 'long':
            prefix = 'filemaker'
        else:
            prefix = 'fmv'

        tag = '*' + prefix + '-func-' + self.name.lower() + '*'
        justified = tag.rjust(79) + '\n'
        return justified

# ==============================================================================

    def build_subheading(self, name):
        return name + '\n' + ('-' * len(name)) + '\n'

# ==============================================================================

    def output(self):
        output = ('-' * 79) + '\n'
        
        output += self.build_tag('long')
        output += self.build_tag('short')

        output += self.name + ' ~\n\n'

        output += self.build_subheading('Purpose')
        output += self.purpose + '\n\n'

        output += self.build_subheading('Format')
        output += self.format + '\n\n'

        output += self.build_subheading('Parameters')
        for param in self.params:
            output += param + '\n'
        output += '\n'

        output += self.build_subheading('Data type returned')
        output += self.datatype + '\n\n'

        output += self.build_subheading('Originated in')
        output += self.origin + '\n\n'

        output += self.build_subheading('Description')
        for desc in self.desc:
            output += desc + '\n'
        output += '\n'

        output += self.build_subheading('Examples')
        for examp in self.examp:
            output += examp + '\n'
        output += '\n'

        output += self.note + '\n\n'

        return output

# ==============================================================================

    def __init__(self, filepath=''):
        if filepath == '':
            filepath = 'function_refs/func_ref1.31.2.html'

        soup = BeautifulSoup(open(filepath))
        self.content = soup.body.blockquote

        self.name     = self.find_div('fh-funchead').string
        self.purpose  = self.get_purpose()
        self.format   = self.find_div('ff-funcformat').string
        self.params   = self.get_params()
        self.datatype = self.get_datatype()
        self.origin   = self.get_origin()
        self.desc     = self.get_hierarchy('desc')
        self.examp    = self.get_hierarchy('examp')
        self.note     = self.format_div(self.content.find('div', class_ = 'n-note'))
        self.note     = self.format_div(self.find_div('n-note'))
