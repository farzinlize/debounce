
# Debounce Circuit
A debounce circuit (or module) remove bouncing its input to a clear and steady output. it's necessary for any manual switch input to prevent multiple press instead of a single press.

## Design
In digital design we assume a signal as a steady and not bounced signal if its value remain same for a period of time. In another word if an input signal remain the same in *k* clock, then it is steady. To achieve this goal there are several designs but in this project we assume a timer to measure clocks when the input is unchanged and then if the timer reaches its required value, input will be presented as a debounced signal so output will trigger related to it.

### Trigger Module
In this specific design there is a trigger module to trigger a reset signal for timer register at positive edge of the each clock when input has been changed. There is an inner register (`Q`) that present last value of input and also an output register that compare value of `Q` and input. Output will trigger when last value of input is different than current value of input. 

> This module can be replaced by only one register that can be sensitive to both positive and negative edge of input.

This module suits our design because its output is activated only when it detects a edge at input (change in value of input) for only a single clock. So we can actually use this as a reset trigger because we expect reset signal became deactivated if there is no change in input.

> This Report Written by Farzin Mohammdi with [StackEdit](https://stackedit.io/).
