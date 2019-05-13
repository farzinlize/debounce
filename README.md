
# Debounce Circuit
A debounce circuit (or module) remove bouncing its input to a clear and steady output. it's necessary for any manual switch input to prevent multiple press instead of a single press.

## Design
In digital design we assume a signal as a steady and not bounced signal if its value remain same for a period of time. In another word if an input signal remain the same in *k* clock, then it is steady. To achieve this goal there are several designs but in this project we assume a timer to measure clocks when the input is unchanged and then if the timer reaches its required value, input will be presented as a debounced signal so output will trigger related to it.

### Trigger Module
In this specific design there is a trigger module to trigger a reset signal for timer register at positive edge of the each clock when input has been changed. There is an inner register (`Q`) that present last value of input and also an output register that compare value of `Q` and input. Output will trigger when last value of input is different than current value of input. 

> This module can be replaced by only one register that can be sensitive to both positive and negative edge of input.

This module suits our design because its output is activated only when it detects a edge at input (change in value of input) for only a single clock. So we can actually use this as a reset trigger because we expect reset signal became deactivated if there is no change in input.

## Current Problems
This design has one problem. It counts 2 more clocks than desired input delay value. (note that timer will count from *zero* to desired delay so actual delay will be *delay + 1* and it isn't a problem for our design)

 1. Reset trigger: reset signal will be active throughout whole clock so even reset signal became deactivate at the end of the clock but assumes active at next positive edge of clock. So it wastes one clock.
 2. Output register: This register need a clock to changes its value after activation of enable signal. In another word enable signal can't be seen by output register at the same clock when it activated. so it wastes one more extra clock.

## Updates

 - Reset trigger extra clock solved by using a register sensitive to both positive and negative edge of the clock in **Trigger Module** so instead of whole clock, reset trigger only active at positive value of clock (half of the whole clock period) This solution covers the extra clock relating to reading reset as active at the negative edge of its signal.

> This Report Written by Farzin Mohammdi with [StackEdit](https://stackedit.io/).