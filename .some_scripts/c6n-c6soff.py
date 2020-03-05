"""
Script that I written to disable C6N and C6S states on my N3540 baytrail CPU.

Idea is based on the old bash script by Wolfgang M. Reimer, but I decided to write it in python
"""
import os

cpu0 = '/sys/devices/system/cpu/cpu0/cpuidle/'
cpu1 = '/sys/devices/system/cpu/cpu1/cpuidle/'
cpu2 = '/sys/devices/system/cpu/cpu2/cpuidle/'
cpu3 = '/sys/devices/system/cpu/cpu3/cpuidle/'

cpus = [cpu0, cpu1, cpu2, cpu3]
    

def disable(state):
    """Disable C6N and C6S states to prevent random kernel panic"""
    cstate_disable = open(state + 'disable', 'w')
    cstate_disable.write('1')
    cstate_disable.close()
    
    
for core in cpus:
    cstatename1 = core + 'state2/'
    disable(cstatename1)
    print(cstatename1 + ' :Disabled')

for core in cpus:
    cstatename2 = core + 'state3/'
    disable(cstatename2)
    print(cstatename2 + ' :Disabled')

print('\nC6N and C6S have been disabled on all CPU cores.')
