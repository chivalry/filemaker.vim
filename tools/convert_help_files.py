#!/usr/bin/env python

# Convert FileMaker help files, specifically for built-in functions, to Vim help files
# Last Change: 2014 Jul 27
# Version 1.0
# Language: Python
# Maintainer: Charles Ross <chivalry@mac.com>
# License: The MIT License

from bs4 import BeautifulSoup, Tag, NavigableString
import pprint

def format_div(div):
    result = ''
    for child in div:
        if type(child) is Tag:
            if child.name == 'a':
                result += child.string

            elif child.name == 'span' and 'c-code' in child['class']:
                result += '`' + child.string + '`'

            elif child.name == 'span' and 'g-glosslink' in child['class']:
                result += child.string

        else:
            result += child.string

    return result

pp = pprint.PrettyPrinter(indent=2)

soup = BeautifulSoup(open('function_refs/func_ref1.31.2.html'))
blockquote = soup.body.blockquote
# print(blockquote.prettify())

func = {}
func['name'] = blockquote.find('div', class_='fh-funchead').string

purpose_div = blockquote.find('div', class_='fpu-funcpurpose')
func['purpose'] = format_div(purpose_div)

func['format'] = blockquote.find('div', class_='ff-funcformat').string

func['params'] = ''
element = blockquote.find('div', class_='fpah-funcparamhead')
param_elements = []
i = 0
for sibling in element.next_siblings:
    if type(sibling) is Tag:
        if 'b-body' in sibling['class']:
            param_elements.append(sibling)
        else:
            break

params = []
for param_element in param_elements:
    params.append(format_div(param_element))
func['params'] = params

pp.pprint(func)
