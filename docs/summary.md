Complete image ready dedicated Windows portable-apps emulate compatibles
========================================================================

Return to [index](https://github.com/marchandd/term_ssh_wine_portableapps/ "Index")

Docker image from term_ssh_root_wine image to run Windows portable-apps
through emulator accessing by view remotely X displays.

Goal
----

Use Docker container to install easily Windows apps on Linux environment.  
Container permits to test apps into independent environment from the host 
without have to install locally Wine emulator and VNC or SSH servers.  
Dedicated to user non-computer specialist, scripts and commands are reduced to minimum.  
VNC client: SSL usage is not available for have less software to install.
SSL client: user & password usage is only available (not secret-key value).

Only 10 minutes to have 5 Portable-Apps ready to run with only 10 scripts to 
launch without parameter and just 1 command line to run !

Take precaution when you use it because portability is not guaranteed...  
Software samples proposed are available with 50 to 100 % functional features 
but it's sufficient to discover great software !  
I recommend to use these great software in last version on Windows OS,
but take advantage to discover them in isolated Linux environment into 
Docker containers.

Softwares tested
----------------

| State | Portable-app  
| --- | ---  
| Gold | [AntRenamer](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/antrenamer.md "AntRenamer_Details") Portable-app  
| Silver | [FreeCommander](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/freecommander.md "FreeCommander_Details") Portable-app  
| Gold | [Notepad++](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/notepad.md "Notepad++_Details") Portable-app  
| Gold | [ToDoList](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/todolist.md "ToDoList_Details") ZIP-app  
| Gold | [WinMerge](https://github.com/marchandd/term_ssh_wine_portableapps/blob/master/docs/winmerge.md "WinMerge_Details") Portable-app  

Dockerfile explanation
----------------------

### Softwares ready to install after download

Graphical user interface portable software presents are:
- AntRenamer by Antp.be to rename files and directories.
- FreeCommander (old version) by Marek Jasinski to manage files and directories 
with multi-tools.
- Notepad++ by Notepad++Team to edit source code supporting several languages.
- ToDoList by AbstractSpoon to manage Todo lists with tree-view and 
calendar display.
- WinMerge by Dean P. Grimm / Thingamahoochie software to differencing and 
merge files and directories.

### Work-flow: 10 minutes to have 5 Portable-Apps ready to run !

- Copy files from local to VE.
- Automatic download software from file with all URLs inside.
- Copy files scripts to install software in container into /root/Downloads 
  directory.
- Give permission to run EXE and SH files.
- Set up directory access.

SSL session explanation
-----------------------

### 1 minute to set Wine emulator !

First, scripting Wine through Winetricks software options.

Script behaviours:
- Prepare Wine user directory.
- Sandbox mode to limit actions for Windows software set.
- Windows 7 environment set.
- Disallow the window manager to decorate the windows.
- Install mfc42 usage for Visual C++ 6 apps.
- If '/data/' directory is presents into container, a symbolic link is created with "C:\users\Public\Documents" available on Windows Portable-apps.

### Few seconds for each Zip-apps install !

Scripting Zip-apps install and alias ready. Use default values to install.

Script behaviours:
- Remove older installed version software.
- Unzip new version software and give permission to run it into target directory.
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
- Run new version installer and give permission to run it into target directory.
- Remove older installed version alias.
- Make new version software alias.
- Install and running logs are save into files.

### Don't remember alias activation !

:warning: Alias have not automatic recognition:
- Run `source ~/.bashrc` command to enable alias access from command line.

### 1 minute when upgrading Portable-Apps versions !

- Make sure new version have same install Features that older and after: 
- Change URLs in /root/Downloads/downloadsLinks.txt file.
- Delete /root/Downloads/old versions XX Portable-Apps
- Run /usr/local/sbin/install_XXPortable.sh
- Run /usr/local/sbin/postInstall_AliasForXXPortable.sh (if EXE program).
- Run `source ~/.bashrc` command to update alias.  
That all to do !

Command build image usage
-------------------------

### Command line

:computer: `docker pull marchandd/term_ssh_wine_portableapps`

Command container usage
-----------------------

### Command line

:computer: `docker run -d -p XXX.XXX.XXX.XXX:YYYYY:22 --name latest_term_ssh_wine_portableapps -v LOCALPATH:/data marchandd/term_ssh_wine_portableapps`

Where XXX.XXX.XXX.XXX is your IP v4 address.  
Where YYYYY is your Private port, if you doesn't know free port, try from 49200...
In case you doesn't want to share data, just leave "-v LOCALPATH:/data" 
from command line.

### Command line explanation

- Run in detached mode.
- Export port 22.
- Share directory between host and container.

Container usage
---------------

### Terminal SSH client access

Open terminal with root/administrator account.

:computer: `ssh -X root@XXX.XXX.XXX.XXX -p YYYYY`

### GUI SSH client access

- Open your Putty GUI SSH client.  
- Choose X11 forwarding option into SSH/X11 Configuration and type IPv4:YYYYY remote desktop.  
  YYYYY is your private port you have choose previously.  
- Choose root user and enter password from marchandd/term_ssh_root_wine image as 'term_ssh_root_wine' for Docker public repository access.

### SSH client session

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

### Alias

When you are connected to container and when you have run all scripts described above.

:computer: `antrenamer`  
:computer: `freecommander`  
:computer: `notepad`  
:computer: `todolist`  
:computer: `winmerge`  
