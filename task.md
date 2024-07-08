# Toy Robot Challenge

## Challenge specification

- The application is a simulation of a toy robot moving on a square tabletop
- The table top should have dimensions of 5 units x 5 units
- There are no obstructions on the table surface
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction
- Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed
- You should be able to run this application from the command line by running `docker-compose up`

Create an application that can read in commands of the following form:
```
PLACE X,Y,FACING
MOVE
LEFT
RIGHT
REPORT
```

**PLACE** will put the toy robot on the table in position X, Y and facing NORTH, SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command
- The application should discard all commands in the sequence until a valid PLACE command has been executed

**MOVE** will move the toy robot one unit forward in the direction it is currently facing.

**LEFT** and **RIGHT** will rotate the robot 90 degrees in the specified direction without changing the position of the robot. Ie. the facing should change but the position should not.

**REPORT** will announce the X, Y and FACING of the robot. This can be in any form, but standard output is sufficient.

- A robot that is not on the table can choose to ignore the MOVE, LEFT, RIGHT and REPORT commands
- Input can be from a file, or from standard input, as the developer chooses
- Provide test data to exercise the application

## Constraints:

The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.

Any move that would cause the robot to be outside of the bounds of the table should be prevented or ignored.

### Example Input and Output:

#### A

```
PLACE 0, 0, NORTH
MOVE
REPORT
```
Output: 0, 1, NORTH

#### B

```
PLACE 0, 0, NORTH
LEFT
REPORT
```
Output: 0, 0, WEST

```
PLACE 1, 2, EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
Output: 3, 3, NORTH

## Dockerization

As part of your submission please include the necessary files such that your challenge can be run by executing `docker-compose up`.

## Submitting The Test

1. Ensure that your project directory is tracked with git, and everything you wish to submit is committed to the `master` branch
1. In your project directory, run: `tar -czvf firstname_lastname.tar.gz` (where _firstname_ and _lastname_ are your names)
1. Email the generated `.tar.gz` file back to the person that sent you the test.

## What We Care About

Here's what you should aim for with your code:
- Clean, readable, production quality code; would we want to work with your code as part of a bigger codebase?
- Solid testing approach
- Use Git (but not GitHub or other public hosting)!
- Commit small changes often so we can see your approach, and progress.
- Include the `.git` directory in the packaged .tar.gz file you send to us.
- Include a README.md explaining how to run your code after it's extracted.
- We haven't hidden any nasty tricks in the test. Don't overthink it. Just write nice, solid code.
