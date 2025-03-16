#!/data/data/com.termux/files/usr/bin/bash

# Colors for better visuals
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

# Install required packages
echo -e "${BLUE}Checking required packages...${RESET}"
pkg install figlet cowsay lolcat -y > /dev/null 2>&1
echo -e "${GREEN}Packages installed!${RESET}"

# Backup existing bash.bashrc (first time only)
if [ ! -e "$HOME/.bashrc_backup" ]; then
    cp $HOME/.bashrc $HOME/.bashrc_backup
fi

# Remove old banner lines (if any)
sed -i '/figlet/d' $HOME/.bashrc
sed -i '/cowsay/d' $HOME/.bashrc
sed -i '/lolcat/d' $HOME/.bashrc

# Ask user for custom banner text
echo -e "${BLUE}Enter your Cowsay text:${RESET}"
read cowsay_text

echo -e "${BLUE}Enter your Banner text:${RESET}"
read banner_text

# Apply the changes to bash.bashrc
echo -e "${GREEN}Setting up your Termux banner...${RESET}"
echo "" >> $HOME/.bashrc
echo "clear" >> $HOME/.bashrc
echo "figlet '$banner_text' | lolcat" >> $HOME/.bashrc
echo "cowsay '$cowsay_text' | lolcat" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc

echo -e "${GREEN}Done! Restart Termux to see your new banner.${RESET}"
