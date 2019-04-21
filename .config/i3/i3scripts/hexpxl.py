#!/usr/bin/env python3

from PIL import Image
import click
import math
from matplotlib import pyplot
import numpy
import subprocess 


@click.command()
@click.option('--input', '-i', 'inputpath', help='Input file')
@click.option('--output', '-o', 'outputpath', help='Input file')
def hexpxl(inputpath: str, outputpath: str):
	print('Open', inputpath)
	i = Image.open(inputpath)
	xstep = 30
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
			points.append((x,y,color))

	print(points)

	pointarray = [ "{},{} rgb({},{},{})".format(x,y,color[0],color[1],color[2]) for (x,y,color) in points ]
	pointsstr = " ".join(pointarray)
	print(pointsstr)

	print(
	"""
	---------------THERE
	"""
	)
	
	cmd = [
		"convert",
		"-size",
		"{}x{}".format(i.width, i.height),
		"xc:",
		"-colorspace",
		"RGB",
		"-sparse-color",
		"Voronoi",
		pointsstr,
		outputpath
	]
	print(cmd)
	subprocess.call(cmd)



if __name__ == '__main__':
  hexpxl()
