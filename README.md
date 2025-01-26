# ActionScript 3 Event Listener Leak

This repository demonstrates a common, yet subtle bug in ActionScript 3 related to event listeners and object lifecycle management.  The bug arises when an object is removed from the display list, but its event listeners remain active.  This can lead to unexpected behavior, crashes, and memory leaks. 

## Bug Description
The `bug.as` file shows an example of an object that adds an event listener but fails to remove it when the object is removed from the display list. Even after `removeChild` is called, the object still receives events, causing issues. 

## Solution
The `bugSolution.as` file provides a corrected version of the code. The key change is ensuring that the event listener is removed using `removeEventListener` before the object is removed from the display list.