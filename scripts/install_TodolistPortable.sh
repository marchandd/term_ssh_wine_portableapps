#!/bin/bash
#DM*20151117 ToDoList(7.0.8) English/French version succesfully based
#On Host: KUbuntu(15.10), Docker(1.9.0)
#On Client with Root account: Ubuntu(14.10), Wine(1.17.50)

#Specific Windows Zip registry
programName="todolist"
winProgramName="ToDoList"
wineStartCommand="wine start 'C:\PortableApps\Todolist\ToDoList.exe'"

#Common for all Windows Zip registry
downloadPattern=~/Downloads/$programName*.zip
downloadFilePath=$(find $downloadPattern)
portableAppsDirectory=~/.wine/drive_c/PortableApps
targetDirectory=$portableAppsDirectory/$winProgramName
targetFilePath=$targetDirectory/$winProgramName.exe
installLogFilePath=$targetDirectory/start$programName.zip.log.txt
aliasFileLog="/start$winProgramName.log.txt"
function addBashAliases()
{
  echo alias $programName=$'"'$wineStartCommand' > '$targetDirectory''$aliasFileLog' 2>&1"' >> ~/.bash_aliases
}

#Common for all Windows Zip script
if [ $downloadFilePath ];
  then
    echo "$downloadFilePath new version available ! Preparing installation..."
  else
    echo "$downloadPattern required but not found. Installation aborted !"
    exit
fi
#Directories and bash_aliases
if [ -f ~/.bash_aliases ];
  then
    echo ""
  else
    touch ~/.bash_aliases
fi
if [ -d $portableAppsDirectory ];
  then
    echo "$portableAppsDirectory available."
  else
    mkdir $portableAppsDirectory && chmod 755 $portableAppsDirectory
    echo "$portableAppsDirectory created."
fi
#Uninstall if present
if [ -f $downloadFilePath ] && [ -d $targetDirectory ];
  then
    rm -Rf $targetDirectory
    echo "$targetDirectory/ previous version deleted."
fi
#Wine install from download
if [ -f $downloadFilePath ];
  then
    mkdir $targetDirectory
    echo "$downloadFilePath new version used."
    unzip $downloadFilePath -d $targetDirectory > $installLogFilePath
    chmod 777 $targetDirectory/*.exe
    if [ -x $targetFilePath ];
      then
        #Unalias if present
        if [ -n "$(grep "$programName" ~/.bash_aliases)" ];
          then
            sed -i '/^alias '$programName'/d' ~/.bash_aliases
            echo "Previous version of $programName alias deleted."
        fi
        #Alias
        addBashAliases
        `source ~/.bashrc`
        echo "Ready to launch with new $programName alias. If not able on your session, please type : source ~/.bashrc"
      else
        echo "Failed to find $targetFilePath"
    fi
  else
    echo "$downloadFilePath not available. Please download portable application before retry..."
fi
