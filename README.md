# Setting Up New RaspberryPi Device #

Created by Kris Hamade October 2019

Last Updated October 21, 2019

## Imaging the Raspberry Pi ##

1. Install PiBakery through the PiBakery.Setup.exe including in this package or Download from PiBakery.org
2. Within the PiBakery application click Import.
3. Select the file "recipe.xml" located within the RaspberryPi Folder.
4. Write to your SD card using the Raspbian Full image of Raspbian.
5. After card has written successfully, drag the pi_setup folder directly onto the SD card labeled "boot".

* Note that you may have to manually wipe the SD card using a tool such as Win32DiskImager or SD Card Formatter
* Google them, the applications will show up

## Raspberry Pi Setup ##

Most of the setup is automated altough you will need to reboot the device and enter information for SimpleHelp to function correctly and for the device to set the correct hostname. Follow the remaining steps to complete the setup.

1. Reboot the device after it first reaches the Raspbian Desktop
2. On second boot the device will ask for information to be entered.