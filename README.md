# lazycalc

*OVERVIEW*

For this challenge you are asked to build a very, very simplistic ‘calculator’ app interface on either iOS or
Android. Your app should present a simple layout. Your app need not do anything
when the buttons are pressed, but it must be able to rescale itself automatically to any reasonable display
size. (That is, generally speaking, any phone supported by your IDE. Looking not-ridiculous on a tablet is
not required.)

*LAYING OUT THE CALCULATOR*
Your calculator must look more or less like a calculator. At the minimum, it must include a full (decimal)
number pad, along with buttons for the basic operations (+, -, *, /), equals, and clear. You may include
other buttons if you wish.

Your interface must take up either the full screen, or a deliberately sized subset of the screen. For example,
you could choose to fill the entire screen (like the Android example, above), or a particularly shaped section
(the iOS example puts everything in a 2:3 box), but you may not simply build an interface that fits the
smallest device and not have it rescale. The buttons must form a neatly aligned grid. Buttons which are
out of alignment with one another will not receive full credit, even if they rescale successfully.

*RESIZING THE LAYOUT*
Your layout must automatically adapt to being displayed on devices of various sizes. It is likely possible
to handle this programmatically, but I would recommend using the constraint system available on your
chosen platform (or, again, SwiftUI). I will test your interface by loading it in Xcode or Android Studio, as
appropriate, and then changing which device is used to display the interface. In cases where it’s not clear
that the interface is being scaled (or with SwiftUI), I’ll run your app on simulated devices. Your interface
must remain fully visible and appropriately scaled regardless of the (phone-class) device I choose. You do
not need to account for rotating the device, though you may if you wish.
