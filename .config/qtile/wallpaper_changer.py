#!/usr/bin/env python3

import os
import time

cmd = "feh --bg-fill --randomize ~/Pictures/*"

while True:
    os.system(cmd)
    time.sleep(180)
