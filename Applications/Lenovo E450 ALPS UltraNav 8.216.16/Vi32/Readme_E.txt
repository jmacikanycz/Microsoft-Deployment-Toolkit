===========================================================================
 Readme_E.txt

     ReadMe file for ThinkPad UltraNav Driver

           Copyright (c) 2006 Alps Electric Co., Ltd.  All rights reserved.
===========================================================================

 This document describes the installation instructions for ThinkPad UltraNav
 Driver and other important information on how to use the driver.

 ThinkPad UltraNav Driver provides a convenient way to adjust various
 settings of the devices it supports.

 NOTE: You need to log on to the Windows as an administrator-privilege user
       to install the driver.

---------------------------------------------------------------------------
 0. Table of Contents
---------------------------------------------------------------------------
   1. Installing the driver with Installer [interactive mode]
   2. Installing the driver with Installer [silent mode]
   3. Installing the driver with Device Manager
   4. Using the ThinkPad UltraNav Property Sheet
   5. Uninstalling the driver


---------------------------------------------------------------------------
 1. Installing the driver with Installer [interactive mode]
---------------------------------------------------------------------------
 In order to install the driver with Installer in interactive mode, follow
 the instructions below:

 [Windows Vista]
 -------------------------
   1) Run DPInst.exe by double-clicking on the file.
   2) Select 'Allow' when prompted.
   3) Press the 'Next' button when the installation wizard is displayed.
   4) Select 'I accept this agreement' when you finish reading the license
       agreement and decide to accept it.
   5) Press the 'Next' button.
   6) Press the 'Finish' button when the driver installation completes.
   7) Press the 'Restart Now' button to restart the computer.


---------------------------------------------------------------------------
 2. Installing the driver with Installer [silent mode]
---------------------------------------------------------------------------
 In order to install the driver with Installer in silent mode, use the
 following command:

     DPInst /q /se /f

   NOTE: You need to run DPInst from a privilege-elevated process when you
         are using Windows Vista.


---------------------------------------------------------------------------
 3. Installing the driver with Device Manager
---------------------------------------------------------------------------
 In order to install the driver with Device Manager, follow the
 instructions below:

 [Windows Vista]
 -------------------------
   1) From the Start menu, select 'Control Panel'.
   2) Select 'System and Maintenance'.
   3) Select 'Device Manager'.
   4) Select 'Continue' when prompted.
   5) Select 'PS/2 Compatible Mouse' under 'Mice and other pointing devices'
       category.
   6) From the 'Action' menu, select 'Update Driver Software...'.
   7) Select 'Browse my computer for driver software'.
   8) Select 'Let me pick from a list of device drivers on my computer'.
   9) Press the 'Have Disk...' button.
  10) Press the 'Browse...' button and then specify the .inf file of the
       driver.
  11) Press the 'OK' button when the .inf file is specified.
  12) Press the 'Next' button on the 'Update Driver Software - PS/2
       Compatible Mouse' dialog.
  13) Press the 'Close' button when the driver installation completes.
  14) Press the 'Yes' button to restart the computer.


---------------------------------------------------------------------------
 4. Using the ThinkPad UltraNav Property Sheet
---------------------------------------------------------------------------
 In order to use the UltraNav Property Sheet, open 'Mouse Properties' by
 following the instructions below and then click on the 'UltraNav' tab.

 [Windows Vista]
 -------------------------
   1) From the Start menu, select 'Control Panel'.
   2) Click on 'Mouse' in the 'Hardware and Sound' group to open the
       'Mouse Properties' dialog.


---------------------------------------------------------------------------
 5. Uninstalling the driver
---------------------------------------------------------------------------
 In order to uninstall the driver, follow the instructions below:

 [Windows Vista]
 -------------------------
   1) From the Start menu, select 'Control Panel'.
   2) Click on 'Uninstall a program' in the 'Programs' category.
   3) Select 'ThinkPad UltraNav Driver'.
   4) Press the 'Uninstall/Change' button.
   5) Press the 'Continue' button when prompted.
   6) Press the 'OK' button when 'Uninstaller' dialog is displayed.
   7) Press the 'Close' button when the driver uninstallation completes.

