#!/bin/bash

# Check if running on Termux
if [ ! -d "$PREFIX" ]; then
    echo "This script must be run in Termux. Exiting."
    exit 1
fi

# Install required packages
pkg update -y && pkg install -y git curl wget neofetch figlet toilet ruby

# Install lolcat if not installed
if ! command -v lolcat &> /dev/null; then
    gem install lolcat
fi

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
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

# Awesome intro animation
echo -e "${RED}___________________________________________________________"
animate "${CYAN} ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗"
animate "${CYAN} ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝"
animate "${CYAN}    ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ "
animate "${CYAN}    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ "
animate "${CYAN}    ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗"
animate "${CYAN}    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
echo -e "${RED}___________________________________________________________"
animate "${PURPLE} ██████╗  █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ "
animate "${PURPLE}██╔══██╗██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗"
animate "${PURPLE}██████╔╝███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝"
animate "${PURPLE}██╔══██╗██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗"
animate "${PURPLE}██████╔╝██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║"
animate "${PURPLE}╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝"
echo -e "${RED}___________________________________________________________"
animate "${YELLOW}               C R E A T E D   B Y               "
toilet -f future " R A Y H A N " | lolcat
echo -e "${RED}___________________________________________________________${NC}"
echo -e "\n\n"

# Input section with validation
while true; do
    echo -e "${GREEN}[*] ${CYAN}Enter your Hacker Name: ${NC}"
    read -r hacker_name
    if [ -z "$hacker_name" ]; then
        echo -e "${RED}[!] Error: Hacker name cannot be empty!${NC}"
    else
        break
    fi
done

while true; do
    echo -e "${GREEN}[*] ${CYAN}Enter your Tagline: ${NC}"
    read -r tagline
    if [ -z "$tagline" ]; then
        echo -e "${RED}[!] Error: Tagline cannot be empty!${NC}"
    else
        break
    fi
done

# Backup existing files
echo -e "\n${GREEN}[*] ${CYAN}Backing up existing configuration...${NC}"
cp "$PREFIX"/etc/bash.bashrc "$PREFIX"/etc/bash.bashrc.bak 2>/dev/null
cp "$PREFIX"/etc/motd "$PREFIX"/etc/motd.bak 2>/dev/null

# Create new bash.bashrc
echo -e "${GREEN}[*] ${CYAN}Creating advanced banner configuration...${NC}"
cat << EOF > "$PREFIX"/etc/bash.bashrc
# Default bash.bashrc for Termux
PS1='\[\e[0;32m\]\$\[\e[m\] '

# Banner function
display_banner() {
    clear
    echo -e "${RED}___________________________________________________________"
    echo -e "${CYAN}    ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗       "
    echo -e "${CYAN}    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗      "
    echo -e "${CYAN}    ███████║███████║██║     █████╔╝ █████╗  ██████╔╝      "
    echo -e "${CYAN}    ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗      "
    echo -e "${CYAN}    ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║      "
    echo -e "${CYAN}    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝      "
    echo -e "${RED}___________________________________________________________"
    echo -e "${CYAN}    _   _             _             "
    echo -e "${CYAN}   | | | | __ _ _ __ | | _____ _ __ "
    echo -e "${CYAN}   | |_| |/ _\` | '_ \| |/ / _ \ '__|"
    echo -e "${CYAN}   |  _  | (_| | | | |   <  __/ |   "
    echo -e "${CYAN}   |_| |_|\__,_|_| |_|_|\_\___|_|   "
    echo -e "${RED}___________________________________________________________"
    echo -e "${PURPLE}    Hacker: ${WHITE}$hacker_name"
    echo -e "${PURPLE}    Tagline: ${WHITE}$tagline"
    echo -e "${RED}___________________________________________________________"
    echo -e "${YELLOW}                      by ${WHITE}RAYHAN ${YELLOW}                      "
    echo -e "${RED}___________________________________________________________${NC}"
    echo
    neofetch
}

# Display banner on start
display_banner
EOF

# Create motd file
cat << EOF > "$PREFIX"/etc/motd
${RED}___________________________________________________________
${CYAN}    ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗       
${CYAN}    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗      
${CYAN}    ███████║███████║██║     █████╔╝ █████╗  ██████╔╝      
${CYAN}    ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗      
${CYAN}    ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║      
${CYAN}    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝      
${RED}___________________________________________________________
${CYAN}    _   _             _             
${CYAN}   | | | | __ _ _ __ | | _____ _ __ 
${CYAN}   | |_| |/ _\` | '_ \| |/ / _ \ '__|
${CYAN}   |  _  | (_| | | | |   <  __/ |   
${CYAN}   |_| |_|\__,_|_| |_|_|\_\___|_|   
${RED}___________________________________________________________
${PURPLE}    Hacker: ${WHITE}$hacker_name
${PURPLE}    Tagline: ${WHITE}$tagline
${RED}___________________________________________________________
${YELLOW}                      by ${WHITE}RAYHAN ${YELLOW}                      
${RED}___________________________________________________________${NC}
EOF

# Set permissions
chmod 644 "$PREFIX"/etc/bash.bashrc
chmod 644 "$PREFIX"/etc/motd

# Completion message
echo -e "\n${GREEN}[✓] ${CYAN}Banner setup completed successfully!${NC}"
echo -e "${YELLOW}[!] ${CYAN}Please restart Termux to see your awesome new banner!${NC}\n"

# Preview
echo -e "${GREEN}[*] ${CYAN}Here's a preview of your hacker banner:${NC}"
echo -e "${RED}___________________________________________________________"
echo -e "${CYAN}    ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗       "
echo -e "${CYAN}    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗      "
echo -e "${CYAN}    ███████║███████║██║     █████╔╝ █████╗  ██████╔╝      "
echo -e "${CYAN}    ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗      "
echo -e "${CYAN}    ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║      "
echo -e "${CYAN}    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝      "
echo -e "${RED}___________________________________________________________"
echo -e "${CYAN}    _   _             _             "
echo -e "${CYAN}   | | | | __ _ _ __ | | _____ _ __ "
echo -e "${CYAN}   | |_| |/ _\` | '_ \| |/ / _ \ '__|"
echo -e "${CYAN}   |  _  | (_| | | | |   <  __/ |   "
echo -e "${CYAN}   |_| |_|\__,_|_| |_|_|\_\___|_|   "
echo -e "${RED}___________________________________________________________"
echo -e "${PURPLE}    Hacker: ${WHITE}$hacker_name"
echo -e "${PURPLE}    Tagline: ${WHITE}$tagline"
echo -e "${RED}___________________________________________________________"
echo -e "${YELLOW}                      by ${WHITE}RAYHAN ${YELLOW}                      "
echo -e "${RED}___________________________________________________________${NC}"
