#!/usr/bin/python
from pynput.mouse import Controller

MAIN_DIM = (1920, 1080)
SIDE_DIM = (1348, 768)

mouse = Controller()
x, y = mouse.position

at_main = x < MAIN_DIM[0]

x = x if at_main else x - MAIN_DIM[0]
curr = MAIN_DIM if at_main else SIDE_DIM
other = SIDE_DIM if at_main else MAIN_DIM

new_x, new_y = int((x / curr[0]) * other[0]), int((y / curr[1]) * other[1])
new_x = new_x + MAIN_DIM[0] if at_main else new_x

mouse.position = new_x, new_y
