#!/bin/bash

# This Script was created to setup Raspberry Pi's for room displays
# Please change out the variables listed below to setup the Raspberry Pi
# Run this script as sudo
# Created by Kris Hamade April, 2019

# Copy over Wireless Profile
#cp /boot/pi_setup/wpa_supplicant.conf /etc/wpa_supplicant/

# Turn on Wireless
#rfkill unblock 0

# Restart Wireless
#ifconfig wlan0 down
#ifconfig wlan0 up

# Gather user input
repeat=n
while [ "$repeat" = n ]
do
    read -p "Enter the Raspberry Pi's Name(Based on Location): [PIDASH] " HOSTNAME
    HOSTNAME=${HOSTNAME:-PIDASH}
    echo $HOSTNAME

    read -p "Enter the website URL that will automatically open: [{INSERT URL HERE}] " SITENAME
    SITENAME=${SITENAME:-{INSERT URL HERE}}
    echo $SITENAME

    echo "Below Are Your Selections"
    echo "The Device Name is: $HOSTNAME"
    echo "The Website Address is: $SITENAME"

    echo "Does everything look correct? Type y to continue: [[y] to continue or [n] to go back]"
    read repeat
    done

# Make directories for autostart on bootup
mkdir /home/pi/.config/lxsession
mkdir /home/pi/.config/lxsession/LXDE-pi

# Add autostart commands to new file
echo "" >> /home/pi/.config/lxsession/LXDE-pi/autostart
echo "@chromium-browser --incognito --noerrdialogs --kiosk $SITENAME" >> /home/pi/.config/lxsession/LXDE-pi/autostart

# Change the device hostname
hostnamectl set-hostname "$HOSTNAME"

# Set Timezone to America/Detroit
timedatectl set-timezone America/Detroit

# Set keyboard to US by default
sed -i 's/gb/us/g' /etc/default/keyboard

# Remove script from startup
rm /boot/pi_setup/autostart
rm /boot/pi_setup/launch.sh
rm /boot/pi_setup/wpa_supplicant.conf