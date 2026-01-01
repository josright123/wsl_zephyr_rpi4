#!/bin/bash
# Zephyr Development Environment Setup Script
# Source this file to set up the Zephyr development environment

# Set Zephyr workspace root
export ZEPHYR_BASE=/home/joseph/wsl_zephyr_rpi4

# Activate Python virtual environment
if [ -f "$ZEPHYR_BASE/.venv/bin/activate" ]; then
    source "$ZEPHYR_BASE/.venv/bin/activate"
    echo "✓ Activated Python virtual environment"
else
    echo "✗ Python virtual environment not found"
fi

# Set Zephyr SDK path
export ZEPHYR_SDK_INSTALL_DIR=/home/joseph/zephyr-sdk-0.17.0
if [ -d "$ZEPHYR_SDK_INSTALL_DIR" ]; then
    echo "✓ Zephyr SDK path set: $ZEPHYR_SDK_INSTALL_DIR"
else
    echo "✗ Zephyr SDK not found at $ZEPHYR_SDK_INSTALL_DIR"
fi

# Source Zephyr environment script
if [ -f "$ZEPHYR_BASE/zephyr-env.sh" ]; then
    source "$ZEPHYR_BASE/zephyr-env.sh"
    echo "✓ Zephyr environment sourced"
else
    echo "✗ zephyr-env.sh not found"
fi

echo ""
echo "Zephyr Development Environment Ready!"
echo "======================================="
echo "ZEPHYR_BASE: $ZEPHYR_BASE"
echo "ZEPHYR_SDK: $ZEPHYR_SDK_INSTALL_DIR"
echo "Python: $(python --version 2>&1)"
echo "West: $(west --version 2>&1)"
echo ""
echo "To build an application:"
echo "  cd $ZEPHYR_BASE"
echo "  west build -b <board> samples/hello_world"
echo ""
