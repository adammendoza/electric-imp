/* blink
   by: Jim Lindblom
   SparkFun Electronics
   date: October 31, 2013 
   license: Beerware. Use, reuse, and modify this code however you see fit.
   If you find it useful, buy me a beer some day!

   This is an Electric Imp hello, world blink sketch. It'll blink an LED
   connected to pin 1, once every second.
*/

////////////////////////////////////////
// Global Variables                   //
////////////////////////////////////////
ledState <- 0;

////////////////////////////////////////
// Function definitions               //
////////////////////////////////////////

// Loop constantly updates the LED. If ledState is 1, we'll turn the LED on and
// set ledState to 0. Vice-versa is ledState is 0 coming in. This function 
// schedules a wakeup in 1 second, and calls itself again.
function loop()
{
    if (ledState)
    {
        hardware.pin9.write(1); // Write pin 1 high
        ledState = 0; // Flip ledState
    }
    else
    {
        hardware.pin9.write(0); // Write pin 1 low
        ledState = 1; // Flip ledState
    }

    // This must be called at the end. This'll call loop() again in 1s, that way
    // it'll actually loop!
    imp.wakeup(1.00, loop); 
}

////////////////////////////////////////
// Setup Stuff: Runs first at startup //
////////////////////////////////////////
hardware.pin9.configure(DIGITAL_OUT);   // Configure Pin 1 as digital output

loop(); // Call loop, and let the program go!

server.log("Hello from Device");

