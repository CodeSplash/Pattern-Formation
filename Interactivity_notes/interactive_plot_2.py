# -*- coding: utf-8 -*-
"""
Created on Tue Apr 26 16:45:09 2016

@author: hugobowne
"""

# Example from here:
# http://bokeh.pydata.org/en/latest/docs/user_guide/quickstart.html#userguide-quickstart
 

from bokeh.plotting import figure, output_file, show

# prepare some data
x = [1, 2, 3, 4, 5]
y = [6, 7, 2, 4, 5]

# output to static HTML file
output_file("lines.html", title="line plot example")

# create a new plot with a title and axis labels
p = figure(title="simple line example", x_axis_label='x', y_axis_label='y')

# add a line renderer with legend and line thickness
p.line(x, y, legend="Temp.", line_width=2)

# show the results
show(p)