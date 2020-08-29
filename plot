#!/usr/bin/env python2
import numpy as np

# just assume -p for now
opt_names = ["function", "start", "end", "step"]
defaults = [None, -10.0, 10.0, 0.1]
types = [str, float, float, float]
options = {}

for name, default, cast in zip(opt_names, defaults, types):
    if default == None:
        prompt = "{} (required): ".format(name)
    else:
        prompt = "{} (default: {}): ".format(name, default)

    complain = False
    done = False
    while not done:
        if complain:
            print "Invalid response"
        ui = raw_input(prompt)
        if ui == "":
            if default == None:
                complain = True
            else:
                options[name] = default
                done = True
        else:
            try:
                choice = cast(ui)   # possible error
                options[name] = choice
                done = True
            except:
                complain = True

start = options["start"]
stop = options["end"]
step = options["step"]

num = (stop - start) / step

xs = np.linspace(start, stop, num)
func = options["function"]

from math import *
ln = log # alias natural log function, for clarity

#ys = [eval(func.replace("x", str(x))) for x in xs]

import re
regex = re.compile(r"\bx\b")
ys = []
for x in xs:
    #expression = func.replace("x", str(x))
    expression = regex.sub(str(x), func)
    y = eval(expression)
    ys.append(y)

import matplotlib.pyplot as plt
plt.plot(xs, ys)
plt.show()
