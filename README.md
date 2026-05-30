☀️ Solar Flow – Intelligent Solar Surplus Management System

Intelligent solar energy management system based on Shelly EM (single and three-phase), with automatic load control via Shelly 1PM and integration with electric vehicle chargers.

The system communicates via the official Shelly REST API, but also supports simulated devices that completely mimic Shelly behavior, allowing for hardware-free development and testing.
#
🧠 Main concept

The system was designed as a network of abstract energy devices, where:

* 🔌 Real Shelly devices can be added
* 🧪 Simulated devices can be created
* 🔁 Both operate identically through a common API

👉 For the system, there is no difference between real and simulated devices

#
⚙️ Supported device types

🔋 Real Shelly devices

* Shelly EM (single-phase and three-phase)
* Shelly 1PM
* Shelly Plug / compatible relays
* EV chargers integrated via Shelly
* Simulated devices
  
#
🔁 Conceptual result

[SHELLY REAL] == [SIMULATOR]

#
🏗️ System architecture

<img width="2115" height="523" alt="image" src="https://github.com/user-attachments/assets/80e31a99-0586-4319-a733-79cdd907bb3c" />

#
🔌 Device integration


The system supports:


* Adding real Shelly devices
* Creating simulated devices
* Dynamic API endpoint configuration
* Fully uniform behavior between real and simulated devices

👉 The system treats all devices as equal, regardless of their origin

#
🧪 Simulator mode

Allows you to create a complete energy setup without any hardware:

* ☀️ Real-time simulated solar production
* 🏠 Dynamic household consumption
* 🔌 Virtual devices
* ⚙️ Full energy automation testing

#
⚡ Operating logic

<img width="550" height="550" alt="image" src="https://github.com/user-attachments/assets/db145966-3567-411c-ad62-986b893bfdab" />

#
🐳 Docker execution

The system is designed to run entirely inside a Docker environment, ensuring:

* 📦 Full portability across Linux, Windows, and macOS
* 🔁 Consistent environment between development and production
* 🧪 Complete dependency isolation
* 🚀 Fast and predictable deployment
* 🔧 Reproducible execution on any machine
* 👉 Solar Flow always runs the same way, regardless of the operating system or local configuration.

#
🐧 Linux – Management script

📄 linux_startbuild.sh

```
chmod +x linux_startbuild.sh
```

Available commands
```
./linux_startbuild.sh build
./linux_startbuild.sh start
./linux_startbuild.sh stop
./linux_startbuild.sh remove
./linux_startbuild.sh help
```

#
🍎 MacOS – Management script

📄 mac_startbuild.sh

```
chmod +x mac_startbuild.sh
```

Available commands
```
./mac_startbuild.sh build
./mac_startbuild.sh start
./mac_startbuild.sh stop
./mac_startbuild.sh remove
./mac_startbuild.sh help
```

#
🪟 Windows – PowerShell

📄 win_startbuild.sh

Available commands
```
.\win_startbuild.ps1 build
.\win_startbuild.ps1 start
.\win_startbuild.ps1 stop
.\win_startbuild.ps1 remove
.\win_startbuild.ps1 help
```

#
🔌 Shelly API integration

The system communicates via:

* Official Shelly REST API
* Compatible simulated endpoints
* Continuous device state polling

#
🧩 Project structure
```
.
├── deploy
│   ├── Dockerfile
│   ├── nginx.conf
│   └── start.sh
│
├── dist
│   ├── backend
│   └── frontend
│
├── linux_startbuild.sh
├── mac_startbuild.sh
├── win_startbuild.ps1
```

🚀 deploy/

Contains all configuration required for Docker execution:

* Dockerfile for building the application
* Nginx configuration
* Container backend startup script

🏗️ dist/

Contains the compiled system:

* compiled backend
* built frontend (Next.js)

👉 Represents the final output ready for production



🐧 linux_startbuild.sh

Full management script for Linux:

* build the image
* start/stop the container
* remove the system

🍎 mac_startbuild.sh

Full management script for MacOS:

* build the image
* start/stop the container
* remove the system

🪟 win_startbuild.ps1

Full management script for Windows:

* build the image
* start/stop the container
* remove the system

#
▶️ Initial Setup (Linux)

📥 Download the Project

You can obtain the project in two ways:

* 🔧 Option 1 – Clone via Git (Recommended)
```
git clone https://github.com/lbsanto/SolarFlow.git
cd cd solar-flow
```

#
* 📦 Option 2 – Download as ZIP

```
- Click on Code
- Select Download ZIP
- Extract the file on your machine
- Open the project folder in your terminal
```

#
For Linux, open a terminal and run:
```
linux_startbuild.sh build
linux_startbuild.sh start
```
#
🌐 Access the Application

After starting the system, open your browser and navigate to:
```
http://localhost
```
You can then use the system normally.

#
⏹️ Stop the System

To stop the running application:
```
linux_startbuild.sh stop
```
#
🧹 Fully Remove the System

To completely remove all generated files and clean the environment:
```
linux_startbuild.sh remove
```
#

ℹ️ Other Platforms

The same commands apply on other operating systems, only changing the script name:

macOS → mac_startbuild.sh
Windows → win_startbuild.ps1
```
mac_startbuild.sh build
mac_startbuild.sh start
```

#

🎯 System objective

To build an energy platform capable of:

* ☀️ Maximizing solar self-consumption
* 🔌 Automating electrical loads
* 🚗 Managing electric vehicle charging
* 🧪 Running without hardware via simulation
* 🔁 Treating real and simulated devices identically

👨‍💻 Project philosophy

“If it works in perfect simulation, it works in the real world.”











