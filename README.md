# Cruise-Control
## Group 10
## Jacob Mukkada & David Wong

<br>

# Setup

## Prerequisites
+ Linux
+ XES Graphical Simulator
+ Source Code submitted on Canvas

## Steps

1. Unzip the source code.
2. Open a terminal at the root of the unzipped folder
3. Run the following command to compile and run the program
```
bash ./init.sh
```

**IMPORTANT**

Ensure that the **End of Line Sequence** is set to **LF** for the shell file.

<br>

# Cruise Control System Signal Description

## Inputs
+ On (pure): Enable the cruise control.
+ Off (pure): Disable the cruise control.
+ Resume (pure): Resumethe cruise control after braking.
+ Set (pure):Set the current speed as the new cruise speed.
+ QuickAccel (pure): Increase the cruise speed.
+ QuickDecel (pure): Decrease the cruise speed.
+ Accel (float): Accelerator pedal sensor.
+ Brake (float): Brake pedal sensor.
+ Speed (float): Car speed sensor.

## Outputs
+ CruiseSpeed (float): Cruise speed value.
+ ThrottleCmd (float):Throttle command.
+ CruiseState (integer): State of the cruise control. It can be either OFF = 1, ON = 2, STDBY = 3, or DISABLE = 4.
+ SpeedWarning (pure): Indicates whether the vehicle's current speed is outside the speed limit
+ WarningType (integer) : Speed of the vehicle relative to the speed limit. It can be either UNDER = 1, OVER = 2, WITHIN = 3

<br>

# Module Description
Our Cruise Control system consists of five modules.

1. Pedal Module
2. Speed Monitor Module
3. Cruise Speed Management Module
4. Cruise Regulation Module
5. Cruise Speed FSM Module

<br>

# Pedal Module

## Description
The pedal module is responsible for monitoring whether the brake or accelerator pedal is pressed or not. It is also responsible for setting the <i>ThrottleCmd</i> when the cruise control system is off.

## Inputs

+ Accel 
+ Brake 
+ CruiseState 
+ ThrottleCmd 

## Outputs

+ accelPressed (pure): Indicates whether the accelerator is pressed
+ brakePressed (pure): Indicates whether the accelerator is pressed

<br>

# Speed Monitor Module

## Description
The Speed Monitor Module simply detects whether the car is travelling within the speed limits.

## Inputs
+ Speed: 

## Outputs
+ SpeedWarning 
+ WarningType

<br>

# Cruise Speed Management Module

## Description
The Cruise Speed Management Module manages the cruising speed of the vehicle. <i>QuickAccel</i> and <i>QuickDecel</i> increases or decreases the cruise speed respectively. <i>Set</i> sets a new cruise speed.

## Inputs
+ On
+ Set
+ Speed
+ QuickAccel
+ QuickDecel
+ WarningType
+ CruiseState

## Output
+ CruiseSpeed

<br>

# Cruise Speed Regulation Module
The Cruise Speed Regulation module regulates the cruise speed of the car within the specified speed limit. It also drives the vehicle speed to match the set cruise control speed

## Inputs
+ CruiseState
+ Speed
+ CruiseSpeed
+ Accel

## Output
+ ThrottleCmd

# Cruise Control FSM Module

## Description
The Cruise Control FSM implements the FSM that dictates that state the cruise control system is to be in.

## Inputs

+ On
+ Off
+ Resume
+ AccelPressed
+ BrakePressed
+ SpeedWarning

## Outputs

+ Cruise State