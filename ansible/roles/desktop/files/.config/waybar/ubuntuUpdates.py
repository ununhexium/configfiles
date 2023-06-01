#!/usr/bin/env python3

import subprocess
import json

stdout, stderr = subprocess.Popen(['/usr/lib/update-notifier/apt-check'], stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
check=stderr.decode('utf-8')
#check=$(/usr/lib/update-notifier/apt-check 2>&1)
check="10;15"
#check="10;0"


normal,security=[ int(it) for it in check.split(';')]


output= {"text": "", "tooltip": "", "class": "", "percentage": 0 }

if security:
    indicator=""
    if normal != 0:
#        indicator="<sup><span foreground='#FF00FF'>+" + normal + "</span></sup>"
        output['text'] = str(normal)
	
#    output="<span foreground='#FF00FF'> </span><span font_weight='bold' foreground='#FF00FF'>" + security + indicator + "</span>"
    subprocess.run(['notify-send', '--urgency', 'critical', str(security) + ' Security updates available'])
elif normal:
#    output="<span foreground='#00FFFF'> $normal</span>"
    pass

print(json.dumps(output), flush=True)

