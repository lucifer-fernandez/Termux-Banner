# Ultimate Termux Banner by Rayhan

A powerful and customizable Termux banner script that transforms your terminal into a hacker's workstation with stunning ASCII art and personalized information.

## Features ✨

- 🔥 **Hacker-themed ASCII art** with realistic face
- 🌈 **Colorful animated introduction**
- 📛 **Customizable hacker name and tagline**
- 📊 **System info integration** (via neofetch)
- 💾 **Automatic backup** of original configuration
- ✅ **Input validation** to prevent errors
- 🎭 **Cool typing animation effect**
- 🖥️ **Preview system** before applying changes

## Installation Guide 📥

### Prerequisites
Ensure you have these packages installed:
```bash
pkg update -y && pkg upgrade -y
pkg install -y git wget curl neofetch figlet toilet ruby
gem install lolcat
```

### Installation Method 1 (Direct Download)
```bash
wget https://raw.githubusercontent.com/yourusername/yourrepo/main/termux-banner.sh
chmod +x termux-banner.sh
./termux-banner.sh
```

### Installation Method 2 (Git Clone)
```bash
git clone https://github.com/yourusername/yourrepo.git
cd yourrepo
chmod +x termux-banner.sh
./termux-banner.sh
```

## Usage 🚀
After running the script:
1. Enter your desired hacker name
2. Enter your custom tagline
3. The script will automatically configure everything
4. Restart Termux to see your awesome new banner!

## Customization Options 🎨
You can easily modify these elements:
- Hacker name
- Personal tagline
- Color schemes (by editing the script)
- ASCII art designs

## Troubleshooting 🔧
If you encounter any issues:
1. Try running `termux-setup-storage` first
2. Ensure all required packages are installed
3. Check your internet connection
4. Verify you have sufficient storage space

## Contributing 🤝
Contributions are welcome! Please:
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a pull request

## License 📜
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits 👏
- Developed by **[Rayhan]**
- ASCII art inspired by various open-source projects
- Special thanks to the Termux community
