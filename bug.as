An uncommon error in ActionScript 3 relates to the handling of events and the lifecycle of objects.  Consider a situation where an object is removed from the display list but continues to receive events.  This can happen because event listeners aren't properly removed when the object is no longer needed.

```actionscript
import flash.events.Event;

public class MyObject extends Sprite {
    public function MyObject() {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(e:Event):void {
        // Event listener is added, but never removed.
    }

    public function removeMe():void {
        parent.removeChild(this); // Object removed from display list
    }
}

// Example usage:
var myObject:MyObject = new MyObject();
addChild(myObject);
myObject.removeMe(); // Object removed, but listener persists
// Subsequent events will still be dispatched to myObject even though it's removed.
```
This can lead to unexpected behavior, crashes, or memory leaks. 