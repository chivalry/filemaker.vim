#!/usr/bin/env python

# Convert FileMaker help files, specifically for built-in functions, to Vim
#   help files
# Last Change: 2014 Jul 27
# Version 1.0
# Language: Python
# Maintainer: Charles Ross <chivalry@mac.com>
# License: The MIT License

from bs4 import BeautifulSoup, Tag, NavigableString
import pprint

# ==============================================================================

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

            elif child.name == 'span' and 'o-onscreen' in child['class']:
                result += child.string

            elif child.name == 'span' and 'zan-autonum' in child['class']:
                result += 'Note: '

        else:
            result += child.string.replace('\n', '')

    return result

# ==============================================================================

pp = pprint.PrettyPrinter(indent=2)

soup = BeautifulSoup(open('function_refs/func_ref1.31.2.html'))
content = soup.body.blockquote

func = {}
func['name'] = content.find('div', class_='fh-funchead').string

purpose_div = content.find('div', class_='fpu-funcpurpose')
func['purpose'] = format_div(purpose_div)

func['format'] = content.find('div', class_='ff-funcformat').string

# Find the parameter head div and loop through its siblings until we come to one
# that isn't a body.
param_head = content.find('div', class_='fpah-funcparamhead')
params = []
for sibling in param_head.next_siblings:
    if type(sibling) is Tag:
        if 'b-body' in sibling['class']:
            params.append(format_div(sibling))
        else:
            break
func['params'] = params

type_head = content.find('div', class_='frh-funcreturnhead')
for sibling in type_head.next_siblings:
    if type(sibling) is Tag:
        func['datatype'] = sibling.string
        break

func['origin'] = content.find('div', class_='or-origin').string
func['origin'] = func['origin'].replace(u"\u00A0", ' ')

desc_head = content.find('div', class_='fdh-funcdeschead')
func['desc'] = []
for sibling in desc_head.next_siblings:
    if type(sibling) is Tag:
        if 'feh-funcexamhead' in sibling['class']:
            break
        elif 'b-body' in sibling['class']:
            func['desc'].append(format_div(sibling))
        elif 'bu1-bullet1_outer' in sibling['class']:
            tds = sibling.find_all('div', class_='bu1-bullet1_inner')
            line = tds[1]
            func['desc'].append('- ' + format_div(line))

examp_head = content.find('div', class_='feh-funcexamhead')
func['examp'] = []
for sibling in examp_head.next_siblings:
    if type(sibling) is Tag:
        if 'b-body' in sibling['class']:
            line = format_div(sibling)
            line = line.replace(u"\u2019", "'")
            line = line.replace(u"\u2022", "o")
            func['examp'].append(line)
        else:
            break

func['note'] = format_div(content.find('div', class_='n-note'))
pp.pprint(func)
