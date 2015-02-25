Complete image ready dedicated Windows portable-apps emulate compatibles
========================================================================

Return to [index](https://github.com/marchandd/term_ssh_wine_portableapps/ "Index")

Docker image from vncxvfb_wine_firefox image to run Windows portable-apps
through emulator accessing by view remotely X displays.

Goal
----

Use Docker container to install easily Windows apps on Linux environment.  
Container permits to test apps into independent environment from the host 
without have to install Wine emulator and VNC server.  
Dedicated to non-computer specialist user, scripts and commands are reduce to 
minimum and SSL usage is not available.

Only 10 minutes to have 5 Portable-Apps ready to run with only 10 scripts to 
launch without parameter and 1 command line to run !

Take precaution when you use it because portability is not guaranteed...  
Samples software proposed are available with 50 to 100 % functional features 
but it's sufficient to discover great software !  
I recommend to use these great software in last version on Windows OS,
but take advantage to discover them in isolated Linux environment into 
Docker containers.

Softwares tested
----------------

- | State |  | Portable-app
-- | -- | --
| Silver | | [ToDoList](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/todolist.md "ToDoList_Details") ZIP-app
| Silver | | [FreeCommander](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/freecommander.md "FreeCommander_Details") Portable-app
| Gold | | [Notepad++](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/notepad.md "Notepad++_Details") Portable-app
| Gold | | [WinMerge](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/winmerge.md "WinMerge_Details") Portable-app
| Gold | | [AntRenamer](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/antrenamer.md "AntRenamer_Details") Portable-app

Dockerfile explanation
----------------------

### Softwares ready to install after download

Graphical user interface portable software presents are:
- ToDoList by AbstractSpoon to manage Todo lists with tree-view and 
calendar display.
- FreeCommander (old version) by Marek Jasinski to manage files and directories 
with multi-tools.
- Notepad++ by Notepad++Team to edit source code supporting several languages.
- WinMerge by Dean P. Grimm / Thingamahoochie software to differencing and 
merge files and directories.
- AntRenamer by Antp.be to rename files and directories.

### Work-flow: 10 minutes to have 5 Portable-Apps ready to run !

- Download software from file with all URLs inside.
- Copy files scripts to install software in container into /root/Downloads 
  directory.
- Give permission to run EXE and SH files.
- Set up directory access.

VNC session explanation
-----------------------

### 1 minute to set Wine emulator !

First, scripting Wine through Winetricks software options.

Script behaviours:
- Prepare Wine user directory.
- Sandbox mode to limit actions for Windows software set.
- Windows 7 environment set.
- Disallow the window manager to decorate the windows.
- Install mfc42 usage for Visual C++ 6 apps.

### Few seconds for each Zip-apps install !

Scripting Zip-apps install and alias ready. Use default values to install.

Script behaviours:
- Remove older installed version software.
- Unzip new version software and give permission to run it into target 
  directory.
- Remove older installed version alias.
- Make new version software alias.
- Install and running logs are save into files.
- Remarks: running alias launched software install.

### Few seconds for each Portable-apps install !

Scripting in two steps Portable-apps (EXE) install and to be alias ready.
Use default values to install.

Scripts behaviours:
- Remove older installed version software.
- Copy from /root/Downloads/ to a Wine installer directory.
- Run new version installer and give permission to run it into target 
  directory.
- Remove older installed version alias.
- Make new version software alias.
- Install and running logs are save into files.

### Don't remember alias activation !

:warning: Alias have not automatic recognition:
- Run source ~/.bashrc command to enable alias access from command line.

### 1 minute when upgrading Portable-Apps versions !

- Make sure new version have same install Features that older and after: 
- Change URLs in /root/Downloads/downloadsLinks.txt file.
- Delete /root/Downloads/old versions XX Portable-Apps
- Run /usr/local/sbin/install_XXPortable.sh
- Run /usr/local/sbin/postInstall_AliasForXXPortable.sh (if EXE program).
- Run source ~/.bashrc command to update alias.
That all to do !

Command build image usage
-------------------------

### Command line

- :computer: `cd YOUR_DIRECTORY`
- :computer: `docker build --rm=true -t term_ssh_wine_portableapps . > 
build.log`

### Command line explanation

First, you copy all files in YOUR_DIRECTORY directory.  
Then, you build the image with command line above.  
In case you doesn't want keep tracks, just leave "> build.log" from command 
line and search VNC password access on screen.

### Firewall

:warning: If your Firewall is enabled on the host, with default outgoing policy turned to 
deny, 
you will have to disable 5900 port filtering:
- Make a new rule for VNC (5900/TCP) to enable outgoing policy.

Command container usage
-----------------------

### Command line

- :computer: `docker run -d -p 127.0.0.1:XXXXX:5900 --name 
latest -v LOCALPATH:/data term_ssh_wine_portableapps`

Where XXXXX is your Private port, if you doesn't know free port, try from 
49200...  
LOCALPATH is a local directory to share data between host and container.
In case you doesn't want to share data, just leave "-v LOCALPATH:/data" 
from command line.

Container usage
---------------

### VNC client access

- Open your VNC client (Terminal Server Client on Gnome, KRDC on KDE).
- Choose VNC option and type localhost:XXXXX remote desktop.
  XXXXX is your private port you have choose previously.
- Choose root user and enter VNC password you have find previously when 
  building vncxvfb_wine_firefox image.
- You can have unsecured channel warning message because SSL is not activated.

### VNC client session

Wine have not been set at the end of install and must been configured in 
first step:
- :computer: `/usr/local/sbin/_installFirst_winetricksOptions.sh` to make 
it for you.

Install XX software and aliases running each pre-set scripts in 
/root/Downloads directory:
- :computer: `/usr/local/sbin/install_XXPortable.sh`
- :computer: `/usr/local/sbin/postInstall_AliasForXXPortable.sh` (if EXE 
program).

Active aliases at the end of all installs made:
- :computer: `source ~/.bashrc`

If you have run container with "V option" you can share data with host.
