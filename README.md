![Swift-LightBlue-logo.png](https://raw.githubusercontent.com/Pluto-Y/Swift-LightBlue/master/images/logo.png)

Swift-LightBlue is the tool written in swift for the developers to know the most features of `CoreBluetooth`. It also can help developers who design the bluetooth to debug hardware. On the other hand, it also can simulate a bluetooth hardware to use. It is built on the top version of the `CoreBluetooth`. This project is heavily inspired by the popular [LightBlue](https://itunes.apple.com/cn/app/lightblue-bluetooth-low-energy/id557428110?mt=8). Most of features will be implemented in this tool. If some quetions accurs on you about interfacing with Bluetooth, maybe this tool can help you find some questions. The tool is still in development, if you occurs some quetions, please [issue me](https://github.com/Pluto-Y/Swift-LightBlue/issues).

Finally, if you like this project, please star it.


## Features(Developing)

The LightBlue has two mode, Central and Peripheral.

**The device as central:**
- [x] Scan the nearby peripherals and show some basic information of the peripherals.
- [x] Obtain the advertisement data.
- [x] Connect the peripheral and interrogate it.
- [x] Discover all the services and characteristics.
- [x] Decode the characteristic and service properties.
- [x] Read the data from the peripheral.
- [x] Write the data to the peripheral.
- [ ] Monitor some actions from the `CoreBluetooth`.

**The device as peripheral:**
- [ ] Add new virtual peripheral which is standard service in [Bluetooth Developer Portal](https://developer.bluetooth.org/gatt/services/Pages/ServicesHome.aspx).
- [ ] Manage service for the virtual peripheral.
- [ ] Clone the connected peripheral.
- [ ] Simulate the bluetooth hardware work process.

**Common:**
- [ ] The log of the central or peripheral events.
- [ ] Share the app to others.

## Requirements

* iOS 9.0+
* Xcode 7.0 or above
* Bluetooth 4.0

## Future of Swift-Bluetooth

Presently, this project is developing for iOS, but I want to abstract a convenience bluetooth module for all platforms. Then I will send the module to the [Cocoapods](http://www.cocoapods.org). Finally, I will add more functions for the bluetooth developer to debug the program not only for the software, but also for the hardware. So if you have ideas please contact me.

## Contact

Follow and contact me on [Sina Weibo](http://weibo.com/5690716723/info) or [My Blog](http://www.pluto-y.com). If you find an issue, just [open a ticket on](https://github.com/Pluto-Y/Swift-LightBlue/issues/new) it. Pull requests are warmly welcome as well.

## License

The MIT License (MIT)

Copyright (c) 2016 Pluto Y

Permission is Pluto Y granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

