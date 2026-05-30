# ☀️ Solar Flow – Intelligent Solar Surplus Management System

Intelligent solar energy management system based on Shelly EM / EM Pro (single & multi-channel configurations depending on setup), with automatic load control via Shelly 1PM and integration with electric vehicle chargers.

The system communicates via the official Shelly REST API, but also supports simulated devices that completely mimic Shelly behavior, allowing for hardware-free development and testing.

👉 Solar Flow is compatible with all solar inverter brands, regardless of manufacturer, as long as production/consumption data can be measured (e.g., via Shelly EM or equivalent shelly meters).

👉 The system does not require access to any inverter manufacturer cloud services, operating independently of vendor ecosystems.

👉 It can operate without internet connection in local mode, ensuring full functionality inside a LAN environment.

👉 Solar Flow is also fully compatible with battery storage systems, allowing intelligent management of stored solar energy, charge/discharge optimization, and self-consumption prioritization.

---

# 🚀 Quick Start

```bash
Download and install Docker Desktop at https://www.docker.com/
git clone https://github.com/lbsanto/SolarFlow.git
cd SolarFlow

./linux_startbuild.sh build
./linux_startbuild.sh start
```

Open your browser and access:

```text
http://localhost
```

# 🐳 Docker Network Configuration

To allow Solar Flow running in Docker to communicate with Shelly devices on your local network, proper network configuration is required.

1. Open Docker Desktop.
2. Go to Settings → Resources → Network.
3. Enable Enable host networking.
4. Apply the changes and restart Docker Desktop if requested.

Note: Without Host Networking enabled, the container may not be able to communicate with Shelly devices available on your local network.

---

# 🧠 Main Concept

The system was designed as a network of abstract energy devices, where:

* 🔌 Real Shelly devices can be added
* 🧪 Simulated devices can be created
* 🔁 Both operate identically through a common API

👉 For the system, there is no difference between real and simulated devices.

---

# ⭐ Key Feature

Solar Flow is not only a solar surplus management platform.

It is also a complete Shelly-compatible simulation environment that allows developers and installers to:

* Develop automations without hardware
* Test energy management scenarios safely
* Validate configurations before deployment
* Reproduce real-world conditions using virtual devices

This significantly reduces development and installation time while improving reliability.

---

# ⚙️ Supported Device Types

## 🔋 Real Shelly Devices

* Shelly EM (single-phase and three-phase)
* Shelly 1PM
* Shelly Plug / compatible relays
* EV chargers integrated via Shelly

## 🧪 Simulated Devices

* Fully virtual equivalents of supported Shelly devices

---

# 🔁 Conceptual Result

```text
Real Shelly Devices  ───►
                         │
                         ▼
                  Solar Flow Core
                         ▲
                         │
Simulated Devices   ───►
```

---

# 🏗️ System Architecture

<img width="2115" height="523" alt="image" src="https://github.com/user-attachments/assets/80e31a99-0586-4319-a733-79cdd907bb3c" />

---

# 🔌 Device Integration

The system supports:

* Adding real Shelly devices
* Creating simulated devices
* Dynamic API endpoint configuration
* Fully uniform behavior between real and simulated devices

👉 The system treats all devices as equal, regardless of their origin.

---

# 🧪 Simulator Mode

Allows you to create a complete energy setup without any hardware:

* ☀️ Real-time simulated solar production
* 🏠 Dynamic household consumption
* 🔌 Virtual devices
* ⚙️ Full energy automation testing

---

# ⚡ Operating Logic

<img width="550" height="550" alt="image" src="https://github.com/user-attachments/assets/db145966-3567-411c-ad62-986b893bfdab" />

---

# 🏠 Example Scenario

1. Solar production exceeds household consumption.
2. Solar Flow detects available surplus energy.
3. Connected devices are managed based on priority and estimated power consumption.
4. A Shelly-controlled load is automatically enabled.
5. EV charging current is adjusted if required.
6. Grid export is minimized and self-consumption is maximized.

👉 The entire process is fully automated.

---

# 📸 User Interface

Screenshots:

* Solar production monitoring ( Automation )

<img width="755" height="408" alt="image" src="https://github.com/user-attachments/assets/98d1827e-d6f1-4254-9b3b-e8b1e1fb8af4" />



 
* Household consumption ( Automation )

<img width="755" height="408" alt="image" src="https://github.com/user-attachments/assets/91f154a6-46d1-4fe4-a430-2a5f4cf561a2" />




  
* Device meter management
  
<img width="755" height="408" alt="image" src="https://github.com/user-attachments/assets/af21f83e-da9e-49b6-ba70-4c7668631232" />





* Device management

<img width="756" height="406" alt="image" src="https://github.com/user-attachments/assets/c19b932b-9672-4bfa-b868-8244ad4fb966" />




* Logs
  
<img width="752" height="407" alt="image" src="https://github.com/user-attachments/assets/fd391a65-c55f-468e-8f41-4c8394085b10" />





* Settings
<img width="755" height="405" alt="image" src="https://github.com/user-attachments/assets/1fa8c06d-4913-4237-8634-660e1d03f432" />



---

# 🐳 Docker Execution

The system is designed to run entirely inside a Docker environment, ensuring:

* 📦 Full portability across Linux, Windows, and macOS
* 🔁 Consistent environment between development and production
* 🧪 Complete dependency isolation
* 🚀 Fast and predictable deployment
* 🔧 Reproducible execution on any machine

👉 Solar Flow always runs the same way, regardless of the operating system or local configuration.

---

# 🐧 Linux – Management Script

📄 `linux_startbuild.sh`

```bash
chmod +x linux_startbuild.sh
```

Available commands:

```bash
./linux_startbuild.sh build
./linux_startbuild.sh start
./linux_startbuild.sh stop
./linux_startbuild.sh remove
./linux_startbuild.sh help
```

---

# 🍎 macOS – Management Script

📄 `mac_startbuild.sh`

```bash
chmod +x mac_startbuild.sh
```

Available commands:

```bash
./mac_startbuild.sh build
./mac_startbuild.sh start
./mac_startbuild.sh stop
./mac_startbuild.sh remove
./mac_startbuild.sh help
```

---

# 🪟 Windows – PowerShell

📄 `win_startbuild.ps1`

Available commands:

```powershell
.\win_startbuild.ps1 build
.\win_startbuild.ps1 start
.\win_startbuild.ps1 stop
.\win_startbuild.ps1 remove
.\win_startbuild.ps1 help
```

⚠️ Required permissions:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

# 🔌 Shelly API Integration

The system communicates via:

* Official Shelly REST API
* Compatible simulated endpoints
* Continuous device state polling

---

# 🧩 Project Structure

```text
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

---

## 🚀 deploy/

Contains all configuration required for Docker execution:

* Dockerfile for building the application
* Nginx configuration
* Container backend startup script

---

## 🏗️ dist/

Contains the compiled system:

* Compiled backend
* Built frontend (Next.js)

👉 Represents the final output ready for production.

---

## 🐧 linux_startbuild.sh

Full management script for Linux:

* Build the image
* Start/stop the container
* Remove the system

---

## 🍎 mac_startbuild.sh

Full management script for macOS:

* Build the image
* Start/stop the container
* Remove the system

---

## 🪟 win_startbuild.ps1

Full management script for Windows:

* Build the image
* Start/stop the container
* Remove the system

---

# ▶️ Initial Setup

## 📥 Download the Project

You can obtain the project in two ways:

### 🔧 Option 1 – Clone via Git (Recommended)

```bash
git clone https://github.com/lbsanto/SolarFlow.git
cd SolarFlow
```

### 📦 Option 2 – Download as ZIP

1. Click **Code**
2. Select **Download ZIP**
3. Extract the file on your machine
4. Open the project folder in your terminal

---

## Linux

```bash
./linux_startbuild.sh build
./linux_startbuild.sh start
```

---

# 🌐 Access the Application

After starting the system, open your browser and navigate to:

```text
http://localhost
```

You can then use the system normally.

---

# ⏹️ Stop the System

```bash
./linux_startbuild.sh stop
```

---

# 🧹 Fully Remove the System

```bash
./linux_startbuild.sh remove
```

---

# ℹ️ Other Platforms

The same commands apply on other operating systems, only changing the script name.

### macOS

```bash
./mac_startbuild.sh build
./mac_startbuild.sh start
```

### Windows

```powershell
.\win_startbuild.ps1 build
.\win_startbuild.ps1 start
```

---

# 🌟 Why Solar Flow?

Unlike traditional solar automation platforms, Solar Flow provides:

* Real and simulated device interoperability
* Hardware-independent development
* Docker-based deployment
* Unified device abstraction
* Support for energy optimization and EV charging

This enables faster development, safer testing, and easier deployment.

---

# 🎯 System Objective

To build an energy platform capable of:

* ☀️ Maximizing solar self-consumption
* 🔌 Automating electrical loads
* 🚗 Managing electric vehicle charging
* 🧪 Running without hardware via simulation
* 🔁 Treating real and simulated devices identically

---

# 🏆 Shelly Smart Home Challenge 2026

Solar Flow demonstrates advanced energy automation using the Shelly ecosystem, combining:

* Smart solar surplus management
* EV charger integration
* Shelly REST API integration
* Hardware simulation capabilities
* Docker-based deployment

The project showcases how real and simulated Shelly devices can coexist within the same automation platform.

---

# 👨‍💻 Project Philosophy

> "If it works in perfect simulation, it works in the real world."

---

# 📜 License

Copyright © 2026 Ludger Brandão do Espírito Santo

Licensed under the Apache License, Version 2.0 (the "License").
You may not use this project except in compliance with the License.

See the `LICENSE` file for the full license text.
