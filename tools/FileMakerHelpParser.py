#!/usr/bin/env python

"""
Extracts the information in a FileMaker HTML help file into instance
  variables that can be accessed by the calling script.
Last Change: 2014 Jul 27
Version 1.0
Language: Python
Maintainer: Charles Ross <chivalry@mac.com>
License: The MIT License
"""

from bs4 import BeautifulSoup, Tag, NavigableString
import pprint
import sys
from cStringIO import StringIO

class FileMakerHelpParser:

# ==============================================================================

    def format_div(self, div):
        """
        Format a div element for inclusion in vimdoc.

        Loops through the children elements of the div and translates each one
        based on a combination of the type of element as well as any class
        information included in the element.

        Args:
            div: A div element to be parsed.

        Returns:
            A string translated from FileMaker's HTML format into a vimdoc line.
        """
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
                result += child.string.replace('\n', '')

        result = result.replace('\n', '')
        result = result.replace(u"\u2019", "'")
        result = result.replace(u"\u2022", "o")

        return result

# ==============================================================================

    def get_purpose(self):
        purpose_div = self.content.find('div', class_='fpu-funcpurpose')
        return self.format_div(purpose_div)

# ==============================================================================

    def get_params(self, content):
        """
        Find the parameter head div and return each of its bodies as a list.

        Args:
            content: The content that the parameter div should be contained in.

        Returns:
            A list of the lines within the paramter head div.
        """
        param_head = content.find('div', class_='fpah-funcparamhead')
        params = []

        for sibling in param_head.next_siblings:
            if type(sibling) is Tag:
                if 'b-body' in sibling['class']:
                    params.append(format_div(sibling))

                else:
                    break

        return params

# ==============================================================================

    def get_params(self):
        param_head = self.content.find('div', class_='fpah-funcparamhead')
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
        type_head = self.content.find('div', class_='frh-funcreturnhead')

        for sibling in type_head.next_siblings:

            if type(sibling) is Tag:
                return sibling.string

# ==============================================================================

    def get_origin(self):
        result = self.content.find('div', class_='or-origin').string
        result = result.replace(u"\u00A0", ' ')

        return result

# ==============================================================================

    def get_desc(self):
        desc_head = self.content.find('div', class_='fdh-funcdeschead')
        result = []

        for sibling in desc_head.next_siblings:
            if type(sibling) is Tag:
                if 'feh-funcexamhead' in sibling['class']:
                    break

                elif 'b-body' in sibling['class']:
                    result.append(self.format_div(sibling))

                elif 'bu1-bullet1_outer' in sibling['class']:
                    tds = sibling.find_all('div', class_='bu1-bullet1_inner')
                    line = tds[1]
                    result.append('- ' + self.format_div(line))

        return result

# ==============================================================================

    def get_examp(self):
        examp_head = self.content.find('div', class_='feh-funcexamhead')
        result = []

        for sibling in examp_head.next_siblings:
            if type(sibling) is Tag:
                if 'b-body' in sibling['class']:
                    result.append(self.format_div(sibling))

                else:
                    break

        return result

# ==============================================================================
    def find_div(self, class_):
        return self.content.find('div', class_=class_)

# ==============================================================================

    def description(self):
        result = {}
        result['name'] = self.name
        result['purpose'] = self.purpose
        result['format'] = self.format
        result['params'] = self.params
        result['datatype'] = self.datatype
        result['origin'] = self.origin
        result['desc'] = self.desc
        result['examp'] = self.examp
        result['note'] = self.note

        pp = pprint.PrettyPrinter(indent=2)

        old_stdout = sys.stdout
        sys.stdout = redirect = StringIO()
        pp.pprint(result)
        sys.stdout = old_stdout

        return redirect.getvalue()

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
        self.desc     = self.get_desc()
        self.examp    = self.get_examp()
        self.note     = self.format_div(self.content.find('div', class_ = 'n-note'))
        self.note     = self.format_div(self.find_div('n-note'))
