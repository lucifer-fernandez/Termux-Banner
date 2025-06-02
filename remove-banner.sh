#!/bin/bash

# Check if running on Termux
if [ ! -d "$PREFIX" ]; then
    echo "This script must be run in Termux. Exiting."
    exit 1
fi

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

# Check if backup file exists
if [ ! -f "$PREFIX/etc/bash.bashrc.bak" ]; then
    echo -e "${RED}[!] Error: No backup file found. Cannot remove banner.${NC}"
    exit 1
fi

# Remove custom banner lines from bash.bashrc
echo -e "${GREEN}[*] ${CYAN}Removing custom banner...${NC}"
sed -i '/# Custom Banner Start/,/# Custom Banner End/d' "$PREFIX/etc/bash.bashrc" 2>/dev/null

# Restore original bash.bashrc from backup
echo -e "${GREEN}[*] ${CYAN}Restoring original configuration...${NC}"
cp "$PREFIX/etc/bash.bashrc.bak" "$PREFIX/etc/bash.bashrc" 2>/dev/null

# Remove the backup file (optional, comment out if you want to keep the backup)
rm "$PREFIX/etc/bash.bashrc.bak" 2>/dev/null

# Remove motd backup if exists (optional)
rm "$PREFIX/etc/motd.bak" 2>/dev/null

echo -e "${GREEN}[*] ${CYAN}Custom banner removed successfully!${NC}"
echo -e "${GREEN}[*] ${CYAN}Restart Termux to apply changes.${NC}"
