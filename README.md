# 🌟 Termux Banner

Customize your Termux startup screen with style!  
This script adds a vibrant, personalized ASCII art banner using `cowsay`, `toilet`, and `lolcat`, giving your terminal a cool and colorful identity.

---

## 🚀 Features

✅ Stylish ASCII art banner on Termux startup  
✅ Animated and colorful welcome text  
✅ Custom name input with font and color effects  
✅ Easily removable—restore to default with one command

---

## 📦 Prerequisites

Before getting started, make sure you have:

- ✅ **Termux** installed on your Android device
- ✅ Active internet connection
- ✅ Basic knowledge of running shell scripts in Termux


---

## 📸 Preview
### Input Screen
![Input Screen](https://i.postimg.cc/B6KjBV1R/Screenshot-20250602-124129-1.jpg)
### Output Screen
![Output Screen](https://i.postimg.cc/cL05yqxM/Screenshot-20250602-124441-1.jpg)

---


## 🔧 Installation

Follow these simple steps to get your custom banner:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/lucifer-fernandez/Termux-Banner.git
   cd Termux-Banner
	 ```

2. Make the script executable:
```bash
chmod +x setup-banner.sh
```

3. Run the script:
```bash
./setup-banner.sh
```

4. Provide input:
When prompted, enter the name you want to display (e.g., Mr. Lucifer).


5. Restart Termux:
Simply close and reopen Termux to see your custom banner.




---

🎨 Banner Layout

Top Section:
“Welcome back Chief!” displayed using cowsay with colorful rainbow effects via lolcat.

Bottom Section:
Your custom name in a futuristic font using toilet with lolcat color animation.



---

🗑️ Remove the Banner

To remove the custom banner and return to the default:

1. Make the remove script executable:
```bash
chmod +x remove-banner.sh
```

2. Run the remove script:
```bash
./remove-banner.sh
```

3. Restart Termux to apply the changes.




---

📁 Files Included

setup-banner.sh – Main setup script

remove-banner.sh – Script to remove the custom banner

README.md – You're reading it!

LICENCE - A file include the project owner info

---

🔗 Dependencies

These packages will be installed automatically:

git, curl, wget

figlet, toilet, cowsay

ruby (required for lolcat)

lolcat (installed via gem)



---


🤝 Contributing

Want to improve this project? Great!

Fork the repository

Make your changes

Submit a Pull Request ✅


Feel free to open issues for bugs or suggestions.


---

📄 License

This project is licensed under the MIT License.
See the LICENSE file for more details.


---

👤 Author

Rayhan

GitHub: lucifer-fernandez.github.com
