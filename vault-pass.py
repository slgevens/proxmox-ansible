#!/usr/bin/python

import sys, subprocess

sys.stdout.write(subprocess.check_output(['pass', 'vault/personnel']))
