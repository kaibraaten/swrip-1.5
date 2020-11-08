from mudprog import *

# This script restocks the fridge with a randomly picked item of food.
def on_rand(obj):
    if otypeincontainer(obj, "food") < 3:
        food = spawnobj(random([31522, 31523, 31524]))
        transfer(food, obj)
        echoaround(obj, "The refridgerator makes a loud humming noise.")
