import os
import time
import subprocess
import shutil

RED = '\033[1;31m'
GREEN = '\033[1;32m'
CYAN = '\033[1;36m'
YELLOW = '\033[1;33m'
WHITE = '\033[1;37m'
NC = '\033[0m'

prefix = os.environ.get("PREFIX")
if not prefix:
    print(f"{RED}[!] This script must be run in Termux. Exiting.{NC}")
    exit(1)

bashrc = os.path.join(prefix, "etc/bash.bashrc")
motd = os.path.join(prefix, "etc/motd")
bashrc_backup = bashrc + ".bak"
motd_backup = motd + ".bak"

def x(text, delay=0.005):
    for char in text:
        print(char, end='', flush=True)
        time.sleep(delay)
    print()







os.system("clear")
x("\n\t\t\t\033[1;32mConnecting...\033[0m")
time.sleep(3)
os.system("clear")
time.sleep(1)
print("""\033[1;32m

_________     ______   _______  _        _        _______  _______ 
\\__   __/    (  ___ \\ (  ___  )( (    /|( (    /|(  ____ \\(  ____ )
   ) (       | (   ) )| (   ) ||  \\  ( ||  \\  ( || (    \\/| (    )|
   | | _____ | (__/ / | (___) ||   \\ | ||   \\ | || (__    | (____)|
   | |(_____)|  __ (  |  ___  || (\\ \\) || (\\ \\) ||  __)   |     __)
   | |       | (  \\ \\ | (   ) || | \\   || | \\   || (      | (\\ (   
   | |       | )___) )| )   ( || )  \\  || )  \\  || (____/\\| ) \\ \\__
   )_(       |/ \\___/ |/     \\||/    )_)|/    )_)(_______/|/   \\__/
                                                                                                         
\033[1;31m=====================================================================
    \033[1;34mTools Author: \033[1;33mMohammad Rayhan Khan 
    \033[1;34mVersion     : \033[1;33m1.0
    \033[1;34mTool Name   : \033[1;33mT-Banner
    \033[1;34mFacebook    : \033[1;33mhttps://www.facebook.com/azad.farabi.2024
    \033[1;34mGithub      : \033[1;33mhttps://github.com/lucifer-fernandez/Termux-Banner.git
\033[1;31m=====================================================================
""")

def set_banner():
    while True:
        banner_name = input(f"{GREEN}[*] {CYAN}Enter your Banner Name (e.g., Mr. Lucifer): {YELLOW}").strip()
        if not banner_name:
            print(f"{RED}[!] Error: Banner name cannot be empty!{NC}")
        else:
            break

    print(f"{GREEN}[*] {CYAN}Installing required packages...{NC}")
    os.system("pkg update -y && pkg install -y git curl wget figlet toilet ruby cowsay")

    try:
        subprocess.run(['lolcat', '--help'], stdout=subprocess.DEVNULL)
    except FileNotFoundError:
        print(f"{GREEN}[*] {CYAN}Installing lolcat gem...{NC}")
        os.system("gem install lolcat")

    print(f"{GREEN}[*] {CYAN}Backing up existing configuration...{NC}")
    shutil.copyfile(bashrc, bashrc_backup)
    shutil.copyfile(motd, motd_backup)

    os.system(f"sed -i '/# Custom Banner Start/,/# Custom Banner End/d' {bashrc}")

    print(f"{GREEN}[*] {CYAN}Creating advanced banner...{NC}")
    with open(bashrc, "a") as f:
        f.write('\n# Custom Banner Start\n')
        f.write('clear\n')
        f.write('echo -e "\\033[1;37m"\n')
        f.write('cowsay -f eyes "Welcome back Chief!" | lolcat\n')
        f.write('echo -e "\\033[0m"\n')
        f.write(f'toilet -f future "{banner_name}" -F gay | lolcat\n')
        f.write('# Custom Banner End\n')

    print(f"{GREEN}[*] {CYAN}Banner configuration updated successfully!{NC}")
    print(f"{GREEN}[*] {CYAN}Restart Termux to see your new banner.{NC}\n\n")

def remove_banner():
    if not os.path.isfile(bashrc_backup):
        print(f"{RED}[!] Error: No backup file found. Cannot remove banner.{NC}")
        return

    print(f"{GREEN}[*] {CYAN}Removing custom banner...{NC}")
    with open(bashrc, "r") as f:
        lines = f.readlines()
    with open(bashrc, "w") as f:
        skip = False
        for line in lines:
            if "# Custom Banner Start" in line:
                skip = True
                continue
            if "# Custom Banner End" in line:
                skip = False
                continue
            if not skip:
                f.write(line)

    print(f"{GREEN}[*] {CYAN}Restoring original configuration...{NC}")
    shutil.copyfile(bashrc_backup, bashrc)

    try:
        os.remove(bashrc_backup)
    except FileNotFoundError:
        pass

    try:
        os.remove(motd_backup)
    except FileNotFoundError:
        pass

    print(f"{GREEN}[*] {CYAN}Custom banner removed successfully!{NC}")
    print(f"{GREEN}[*] {CYAN}Restart Termux to apply changes.{NC}\n\n")

while True:
    
    print(f"{CYAN}[1]{GREEN} Set Custom Banner")
    print(f"{CYAN}[2]{GREEN} Remove Custom Banner")
    print(f"{CYAN}[0]{GREEN} Exit\n")

    choice = input(f"{RED}Choose an option: {YELLOW}").strip()

    if choice == "1":
        set_banner()
        break
    elif choice == "2":
        remove_banner()
        break
    elif choice == "0":
        x(f"\n\t\t{GREEN}[*] System Colsed...\n\n\n{NC}")
        break
    else:
        print(f"{RED}[!] Invalid choice. Try again.{NC}")
        time.sleep(1)
