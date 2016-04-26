
# Example from here:
# http://matplotlib.org/1.4.1/examples/pylab_examples/simple_plot.html

from pylab import *

t = arange(0.0, 2.0, 0.01)
s = sin(2*pi*t)
plot(t, s)

xlabel('time (s)')
ylabel('voltage (mV)')
title('About as simple as it gets, folks')
grid(True)
show()

