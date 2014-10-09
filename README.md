<a href="https://codeclimate.com/github/jeantroiani/martian_robot"><img src="https://codeclimate.com/github/jeantroiani/martian_robot/badges/gpa.svg" /></a>

Martian Robot
=============
Program that tracks movement of cars on a grid. 
It creates given size grid.
User can deploy cars and send commands to them.
A car can leave the grid, but after the incident
no other car can make the same mistake, as instructions
will be ignore.

Sample Input
------------
53
11E RFRFRFRF
32N FRRFLLFFRRFLL
03W LLFFFLFLFL

Sample Output
-------------
11E
33NLOST
23S

Technologies used
------------------
- Ruby.
- RSpec.

Models
--------------
 **Robot**
 Can move freely in four directions North, South, East, West also rotate, inform where it is, and leave mesagges for other robots.
 **Grid**
 Creates a 2d grid and holds cells where robots can move on.
**Cells**
 Robots can park on them and leave messages to other robots.
**Orientation System**
System used by robots to rotate on spot.
**Controller**
Administrates the data comming from both robots and grids. It holds a grid, deploys robots to it, and parse a line of commands.


How to setup and run it
-----------------------
cd to the root directory
type bundle
require './lib/controller.rb'


Testing instructions
----------------
cd to the root directory
type rspec
