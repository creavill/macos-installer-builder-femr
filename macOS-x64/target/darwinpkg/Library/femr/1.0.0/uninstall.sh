#!/bin/bash

#Generate application uninstallers for macOS.

#Parameters
DATE=`date +%Y-%m-%d`
TIME=`date +%H:%M:%S`
LOG_PREFIX="[$DATE $TIME]"

#Functions
log_info() {
    echo "${LOG_PREFIX}[INFO]" $1
}

log_warn() {
    echo "${LOG_PREFIX}[WARN]" $1
}

log_error() {
    echo "${LOG_PREFIX}[ERROR]" $1
}

#Check running user
if (( $EUID != 0 )); then
    echo "Please run as root."
    exit
fi

echo "Welcome to Application Uninstaller"
echo "The following packages will be REMOVED:"
<<<<<<<< HEAD:macOS-x64/target/darwinpkg/Library/femr/1.2.3/uninstall.sh
echo "  femr-1.2.3"
========
echo "  femr-1.0.0"
>>>>>>>> 2f598ac6a8bea1cdd6deff521da650ce2ebc1031:macOS-x64/target/darwinpkg/Library/femr/1.0.0/uninstall.sh
while true; do
    read -p "Do you wish to continue [Y/n]?" answer
    [[ $answer == "y" || $answer == "Y" || $answer == "" ]] && break
    [[ $answer == "n" || $answer == "N" ]] && exit 0
    echo "Please answer with 'y' or 'n'"
done


#Need to replace these with install preparation script
<<<<<<<< HEAD:macOS-x64/target/darwinpkg/Library/femr/1.2.3/uninstall.sh
VERSION=1.2.3
========
VERSION=1.0.0
>>>>>>>> 2f598ac6a8bea1cdd6deff521da650ce2ebc1031:macOS-x64/target/darwinpkg/Library/femr/1.0.0/uninstall.sh
PRODUCT=femr

echo "Application uninstalling process started"
# remove link to shorcut file
<<<<<<<< HEAD:macOS-x64/target/darwinpkg/Library/femr/1.2.3/uninstall.sh
find "/usr/local/bin/" -name "femr-1.2.3" | xargs rm
========
find "/usr/local/bin/" -name "femr-1.0.0" | xargs rm
>>>>>>>> 2f598ac6a8bea1cdd6deff521da650ce2ebc1031:macOS-x64/target/darwinpkg/Library/femr/1.0.0/uninstall.sh
if [ $? -eq 0 ]
then
  echo "[1/3] [DONE] Successfully deleted shortcut links"
else
  echo "[1/3] [ERROR] Could not delete shortcut links" >&2
fi

#forget from pkgutil
pkgutil --forget "org.$PRODUCT.$VERSION" > /dev/null 2>&1
if [ $? -eq 0 ]
then
  echo "[2/3] [DONE] Successfully deleted application informations"
else
  echo "[2/3] [ERROR] Could not delete application informations" >&2
fi

#remove application source distribution
[ -e "/Library/${PRODUCT}/${VERSION}" ] && rm -rf "/Library/${PRODUCT}/${VERSION}"
if [ $? -eq 0 ]
then
  echo "[3/3] [DONE] Successfully deleted application"
else
  echo "[3/3] [ERROR] Could not delete application" >&2
fi

echo "Application uninstall process finished"
exit 0
