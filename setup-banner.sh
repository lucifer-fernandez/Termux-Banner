#!/bin/bash

# Check if running on Termux
if [ ! -d "$PREFIX" ]; then
    echo "This script must be run in Termux. Exiting."
    exit 1
fi

# Install required packages
pkg update -y && pkg install -y git curl wget figlet toilet ruby cowsay -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"

# Install lolcat if not installed
if ! command -v lolcat &> /dev/null; then
    gem install lolcat
fi

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'  # For brighter text in cowsay
NC='\033[0m'

# Animation function
animate() {
    local text=$1
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.03
    done
    echo
}

clear

# Intro animation
echo "___________________________________________________________"
animate "████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗"
animate "╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝"
animate "   ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ "
animate "   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ "
animate "   ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗"
animate "   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
echo "___________________________________________________________"
animate "██████╗  █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ "
animate "██╔══██╗██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗"
animate "██████╔╝███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝"
animate "██╔══██╗██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗"
animate "██████╔╝██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║"
animate "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝"
echo "___________________________________________________________"
animate "               C R E A T E D   B Y               "
toilet -f future " R A Y H A N " | lolcat
echo "___________________________________________________________"
echo -e "\n\n"

# Input section with validation
while true; do
    echo -e "${GREEN}[*] ${CYAN}Enter your Banner Name (e.g., Mr. Lucifer): ${NC}"
    read -r banner_name
    if [ -z "$banner_name" ]; then
        echo -e "${RED}[!] Error: Banner name cannot be empty!${NC}"
    else
        break
    fi
done

# Backup existing files including current banner
echo -e "\n${GREEN}[*] ${CYAN}Backing up existing configuration and current banner...${NC}"
sed -i '/# Custom Banner Start/,/# Custom Banner End/d' "$PREFIX"/etc/bash.bashrc 2>/dev/null
cp "$PREFIX"/etc/bash.bashrc "$PREFIX"/etc/bash.bashrc.bak 2>/dev/null
cp "$PREFIX"/etc/motd "$PREFIX"/etc/motd.bak 2>/dev/null

# Create new bash.bashrc with custom banner
echo -e "${GREEN}[*] ${CYAN}Creating advanced banner configuration...${NC}"
cat << EOF > "$PREFIX"/etc/bash.bashrc
# Default bash.bashrc for Termux
PS1='\[\e[0;32m\]\$\[\e[m\] '

# Custom Banner Start
clear
echo -e "\${WHITE}"  # Bright white color for cowsay text
cowsay -f eyes "Welcome back Chief!" | lolcat
echo -e "\${NC}"  # Reset color
toilet -f future "$banner_name" -F gay | lolcat  # Attractive font for big name
# Custom Banner End
EOF

echo -e "${GREEN}[*] ${CYAN}Banner configuration updated successfully!${NC}"
echo -e "${GREEN}[*] ${CYAN}Restart Termux to see the new banner.${NC}"
