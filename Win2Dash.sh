clear
echo "Welcome"
echo "Choose an option :"
echo "1 : Install Windows on a USB key or a Hard Disk"
echo "2 : Install Windows setup on a USB key"
echo "3 : Install another OS on a USB key (Installation Program)"
echo "4 : Quit"

read choice

case $choice in
	1)
       echo "This action will download ~5Go"
       echo "Do you want to continue ? y/n"
       case "$r1" in
         y|Y) 
           echo "The download will now begin"
           wget 
           ;;
         n|N)
            clear
            exit 0
            ;;
         *)
           echo "Error"
           ;;
       esac
       ;;

    2)
       echo "This action will download ~3.6Go"
       echo "Do you want to continue ? y/n"
       read r2
       case "$r2" in
         y|Y) 
           echo "The download will now begin"
           wget -q --show-progress https://archive.org/download/tiny-10-23-h2/tiny10%20x64%2023h2.iso -O tiny10.iso && echo "Please enter the path of your usb key"
           read pathusb
           sudo diskutil unmount $pathusb
           echo "Writing..."
           sudo dd if=tiny10.iso of=$pathusb bs=4m status=progress
           echo "Success !"
           ;;
         n|N)
            clear
            exit 0
            ;;
         *)
           echo "Error"
           ;;
       esac
       ;;

    3)
       echo "Please enter the path of your disk image"
       read pathiso
       echo "Your Disk image is " $pathiso
       echo "Please enter the path of your usb key (ex:/dev/disk1)"
       read pathusb
       echo "Warning : All your data on this disk will be erased, do you want to continue ? y/n"
       read r3
       case "$r3" in
         y|Y) 
           echo "Unmounting USB"
           sudo diskutil unmountDisk $pathusb
           echo "Writing Image"
           sudo dd if=$pathiso of=$pathusb bs=4m
           ;;
         n|N)
           ./cmdline.sh
           ;;
         *)
           echo "Réponse invalide. Veuillez saisir y ou n."
           ;;
        esac

       ;;

    4)
       clear
       exit 0
       ;;

    *)
      echo "Error"
      sleep 2
      ./cmdline.sh
      ;;

esac