# VHDL Digital Lock with State Machine

## Overview

This project implements a digital lock system using VHDL and a state machine. The lock can be controlled by a 4-digit password entered via a keypad. The system provides security by transitioning through different states based on user input, verifying the password, and granting or denying access accordingly.

## Features
- **4-Digit Password Input**: The system allows for the entry of a 4-digit password.
- **State Machine Design**: The project uses a finite state machine (FSM) to manage the different states, such as idle, password input, and access granted or denied.
- **Keypad Interface**: A matrix keypad is used for password entry.
- **Access Control**: The system verifies the entered password and provides access if correct.
- **Reset and Lockout Mechanism**: Includes a reset feature and lockout if an incorrect password is entered multiple times.

## System Design
The digital lock operates using the following states:
1. **Idle State**: The system waits for user input.
2. **Password Input State**: The user enters a 4-digit password.
3. **Verification State**: The system checks the password against the stored value.
4. **Access Granted State**: If the password is correct, access is granted.
5. **Access Denied State**: If the password is incorrect, the system denies access and returns to the idle state after a timeout.

### State Transition Diagram
(Provide a state transition diagram showing how the FSM transitions between states)

## Hardware Requirements
- FPGA board (compatible with VHDL)
- 4x4 matrix keypad
- 7-segment display (optional for showing status)
- LEDs (optional for showing lock status)
- Reset button

## Software Requirements
- VHDL Simulator (e.g., ModelSim, Xilinx ISE, or Vivado)
- VHDL synthesis toolchain for FPGA programming
