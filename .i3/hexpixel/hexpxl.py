#!/usr/bin/env python3

from PIL import Image, ImageDraw
import click
import math
import subprocess
import os

def hex1char(value):
	return ''.join('%01x' % math.floor(value/16))


@click.command()
@click.option('--input', '-i', 'inputpath', help='Input file')
@click.option('--output', '-o', 'outputpath', help='Input file')
def hexpxl(inputpath: str, outputpath: str):
	here = os.path.dirname(os.path.abspath(__file__))
	i = Image.open(inputpath)
	o = Image.new('RGB', i.size, color=(0,0,0))
	h = Image.open(os.path.join(here, 'hexes', '14.png'))
	d = ImageDraw.Draw(o)
	xstep = 14
	ystep = round( xstep * math.cos(math.pi/6) )
	points = []
	xmax = i.width
	ymax = i.height
	for yindex, y in enumerate(range(0, ymax, ystep)):
		if yindex%2 == 0:
			xs = range(0, xmax, xstep)
		else:
			xoffset = round( xstep * math.sin(math.pi/6) )
			xs = [ math.floor(x+xoffset) for x in range(0, xmax - xoffset, xstep)]
		for x in xs :
			pos = (x,y)
			color = i.getpixel(pos)
			d.bitmap((x - h.size[0]/2, y - h.size[1]/2), h, fill=color)
			
	o.save(outputpath)


if __name__ == '__main__':
  hexpxl()
