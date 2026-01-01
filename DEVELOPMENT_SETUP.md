# Zephyr Development Environment Setup

This document describes the Zephyr RTOS development environment for Raspberry Pi 4.

## Environment Overview

- **Zephyr Base:** `/home/joseph/wsl_zephyr_rpi4`
- **Zephyr SDK:** `/home/joseph/zephyr-sdk-0.17.0`
- **Python Version:** 3.12.3
- **West Version:** 1.5.0

## Quick Start

### Activate the Environment

Every time you open a new terminal, source the environment setup script:

```bash
cd /home/joseph/wsl_zephyr_rpi4
source zephyr-env-setup.sh
```

This will:
- Activate the Python virtual environment
- Set ZEPHYR_BASE and ZEPHYR_SDK_INSTALL_DIR
- Source the zephyr-env.sh script
- Display environment status

### Building a Sample Application

1. List available boards:
   ```bash
   west boards | grep rpi
   ```

2. Build a sample application (e.g., Hello World):
   ```bash
   west build -b rpi_4b samples/hello_world
   ```

3. Clean build:
   ```bash
   west build -b rpi_4b samples/hello_world --pristine
   ```

### Common West Commands

- **Update repositories:** `west update`
- **List boards:** `west boards`
- **Build:** `west build -b <board> <app>`
- **Flash:** `west flash`
- **Debug:** `west debug`

## Installed Components

### System Packages
- CMake 3.28.3
- Ninja Build
- Python 3.12 with development headers
- Git
- GCC/G++ with multilib support
- Device Tree Compiler
- DFU Utilities
- SDL2 Development libraries
- And more...

### Python Packages (in virtual environment)
- West (Zephyr meta-tool)
- PyElfTools
- PyYAML
- PyOCD (for debugging)
- And many more development tools

### Zephyr SDK 0.17.0
Contains cross-compilation toolchains for:
- ARC
- ARM/ARM64
- MIPS
- RISC-V
- x86/x86_64
- Xtensa
- And more...

## Directory Structure

```
/home/joseph/
├── wsl_zephyr_rpi4/          # Main Zephyr workspace
│   ├── .venv/                 # Python virtual environment
│   ├── zephyr-env-setup.sh    # Environment setup script
│   ├── zephyr-env.sh          # Zephyr environment script
│   ├── CMakeLists.txt
│   ├── west.yml               # West manifest
│   ├── samples/               # Sample applications
│   ├── boards/                # Board definitions
│   ├── drivers/               # Device drivers
│   ├── include/               # Header files
│   ├── kernel/                # Kernel source
│   └── ...
└── zephyr-sdk-0.17.0/         # Zephyr SDK toolchains
```

## Creating a New Application

1. Create application directory:
   ```bash
   mkdir -p ~/myapp/src
   cd ~/myapp
   ```

2. Create CMakeLists.txt:
   ```cmake
   cmake_minimum_required(VERSION 3.20.0)
   find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
   project(myapp)
   
   target_sources(app PRIVATE src/main.c)
   ```

3. Create prj.conf (configuration file):
   ```
   # Add your configuration options here
   CONFIG_PRINTK=y
   ```

4. Create src/main.c:
   ```c
   #include <zephyr/kernel.h>
   #include <zephyr/sys/printk.h>
   
   int main(void)
   {
       printk("Hello World! %s\n", CONFIG_BOARD);
       return 0;
   }
   ```

5. Build:
   ```bash
   west build -b rpi_4b
   ```

## Raspberry Pi 4 Specific Notes

### Supported Boards
- `rpi_4b` - Raspberry Pi 4 Model B

### Building for RPi 4
```bash
west build -b rpi_4b <app_directory>
```

### Flashing
For Raspberry Pi, you typically need to:
1. Build the application
2. Copy the zephyr.bin to the SD card boot partition
3. Configure config.txt appropriately

## Troubleshooting

### Virtual Environment Issues
If the virtual environment doesn't activate:
```bash
cd /home/joseph/wsl_zephyr_rpi4
python3 -m venv .venv --clear
source .venv/bin/activate
pip install -r scripts/requirements.txt
```

### SDK Not Found
Ensure the SDK is installed at:
```bash
ls /home/joseph/zephyr-sdk-0.17.0/
```

### West Command Not Found
Make sure the virtual environment is activated:
```bash
source /home/joseph/wsl_zephyr_rpi4/zephyr-env-setup.sh
```

## Additional Resources

- [Zephyr Documentation](https://docs.zephyrproject.org/)
- [Getting Started Guide](https://docs.zephyrproject.org/latest/getting_started/index.html)
- [Raspberry Pi Support](https://docs.zephyrproject.org/latest/boards/raspberrypi/rpi_4b/doc/index.html)
- [West Tool](https://docs.zephyrproject.org/latest/guides/west/index.html)

## Environment Variables

The following environment variables are set by `zephyr-env-setup.sh`:

- `ZEPHYR_BASE` - Path to Zephyr source
- `ZEPHYR_SDK_INSTALL_DIR` - Path to Zephyr SDK
- Plus variables set by zephyr-env.sh

## Notes

- Always activate the environment before working with Zephyr
- The virtual environment keeps Python dependencies isolated
- SDK toolchains are located in $ZEPHYR_SDK_INSTALL_DIR
- Use `west update` to sync all Zephyr repositories
