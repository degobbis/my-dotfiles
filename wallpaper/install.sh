# ------------------------------------------------------
# Install wallpapers
# ------------------------------------------------------
clear
echo -e "${GREEN}"
cat <<"EOF"
__        __    _ _                             
\ \      / /_ _| | |_ __   __ _ _ __   ___ _ __ 
 \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |   
   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|   
                   |_|         |_|              

EOF
echo -e "${NONE}"
if [ ! -d .git ]; then
    echo "Do you want to download the wallpapers from repository "
    echo "https://gitlab.com/stephan-raabe/wallpaper/ ?"
    echo ""
    if gum confirm "Do you want to download the repository?" ;then
        if [ -d ~/Downloads/wallpaper-main ]; then
            rm -Rf ~/Downloads/wallpaper-main
        fi
        if [ -f ~/Downloads/main.zip ]; then
            rm -f ~/Downloads/main.zip
        fi
        wget -P ~/Downloads/ https://github.com/mylinuxforwork/wallpaper/archive/refs/heads/main.zip
        unzip -o ~/Downloads/main.zip -d ~/Downloads/
        if [ ! -d ~/wallpaper/ ]; then
            mkdir ~/wallpaper
        fi
        echo "--> Remove duplicates blackwhole.png, Solitary-Glow.png, the-sphere2.png, 3d-tech.jpg, default.jpg"
        rm -f ~/Downloads/wallpaper-main/blackwhole.png
        rm -f ~/Downloads/wallpaper-main/Solitary-Glow.png
        rm -f ~/Downloads/wallpaper-main/the-sphere2.png
        rm -f ~/Downloads/wallpaper-main/3d-tech.jpg
        rm -f ~/Downloads/wallpaper-main/default.jpg
        chmod 644 ~/Downloads/wallpaper-main/*.*
        echo "--> Convert *.png to .jpg"
        mogrify -format jpg ~/Downloads/wallpaper-main/*.png
        echo "--> Copy JPGs to ~/wallpaper"
        cp ~/Downloads/wallpaper-main/*.jpg ~/wallpaper/
        echo "--> Copy LICENSE to ~/wallpaper"
        cp ~/Downloads/wallpaper-main/LICENSE ~/wallpaper/
        echo "--> Clean up the downloaded/extracted files in ~/Downloads"
        rm -f ~/Downloads/main.zip
        rm -Rf ~/Downloads/wallpaper-main
        echo ":: Wallpapers from the repository installed successfully."
    elif [ $? -eq 130 ]; then
        exit 130
    else
        exit
    fi
else
    echo "Wallpapers downloaded with git. Update with git pull."
    if gum confirm "Do you want to pull updates from the repository?" ;then
        git pull
        echo "Wallpapers updated successfully from the repository."
    elif [ $? -eq 130 ]; then
        exit 130
    else
        exit
    fi
fi
echo ""
