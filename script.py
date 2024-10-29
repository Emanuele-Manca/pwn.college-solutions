import os
import subprocess
import signal
'''
arr = ['env', '-i', '311=kqsdvqkqsn', '/challenge/embryoio_level77']
arr.extend(['' for i in range(0, 263)])

arr[265] = 'isjpfvonut'
print(arr)
'''

# output = os.open("/home/hacker/out", os.O_WRONLY)
# input = os.open("/home/hacker/in", os.O_RDONLY)
kid = subprocess.run("/challenge/embryoio_level107")
