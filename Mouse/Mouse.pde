// code from http://arduino.cc/forum/index.php?topic=74653.0
// this person had troubel with his code//

// makes servo move with mouse over.


import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
int pos=0; //servo position in degrees (0..180)

void setup()
{
  size(360, 200);

  arduino = new Arduino(this, Arduino.list()[0], 57600); //your offset may vary
  arduino.pinMode(9, 5);
}

void draw()
{
// read mouseX coordinate
  int newPos = constrain(mouseX/2,0,180); // update bg & servo position if mouseX changed
  if(newPos != pos)
  {
    background(newPos);
    arduino.analogWrite(9, newPos);
    println (" newPos = " + newPos );
    pos=newPos; //update servo position storage variable
  }
}  
