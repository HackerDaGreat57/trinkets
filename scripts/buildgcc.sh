#buildgcc.sh: a user-friendly installation script for GCC
#Designed for GCC 12.2

declare -A os_info; #Check what package manager the user is running
os_info[/etc/redhat-release]=yum
os_info[/etc/arch-release]=pacman
os_info[/etc/gentoo-release]=emerge
os_info[/etc/SuSE-release]=zypp
os_info[/etc/debian_version]="\033[38;2;226;2;52mapt\033[0m"
os_info[/etc/alpine-release]=apk

for f in ${!os_info[@]}
do
  if [[ -f $f ]];then
    echo -e "Your package manager is: ${os_info[$f]}"
  fi
done

builddir=$(pwd) #Current directory -> $builddir

#Function that checks if the necessary TUI components exist
check_if_tui_supported() {
  if hash dialog 2>/dev/null; then
    echo -e "TUI components exist. \x1b[38;2;0;100;0mLaunching with TUI\033[5m..."
    return 0
  else
    echo "It doesn't look like you have the dialog binary installed, which is required for the TUI. Would you like to:"
    echo "  0. Install the dialog binary via your package manager, and then proceed with the installation"
    echo "  1. Ignore and attempt to launch the TUI anyway (ONLY IF YOU KNOW WHAT YOU ARE DOING!!)"
    echo "  2. Proceed with the installation in a non-TUI way, similar to the way I'm communicating with you right now."
    echo "  3. Specify a custom location for the dialog binary (make sure you have its depencies installed!)"
  fi
}

check_if_tui_supported #After this is done executing, the user should have TUI components installed or they might install in "phonecall" mode.

#mkdir obj #Object files will be placed here
#mkdir ultragcc #Finished GCC build will end up here

#./src/configure --prefix=

echo -e "\x1b[0m"
exit 0