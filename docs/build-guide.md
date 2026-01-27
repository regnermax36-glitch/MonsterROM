# MonsterROM Build Guide

## 🚀 **Multi-Platform Build System**

MonsterROM now supports multiple platforms with an advanced build system that automatically detects your target device and applies the appropriate optimizations.

### 📋 **Prerequisites**

- Linux-based system (Ubuntu 20.04+ recommended)
- At least 16GB RAM (32GB recommended)
- 200GB+ free disk space
- Fast internet connection

### 🛠️ **Required Tools**

```bash
# Install build dependencies
sudo apt update
sudo apt install -y git curl wget unzip zip python3 python3-pip
sudo apt install -y build-essential gcc g++ make cmake
sudo apt install -y openjdk-11-jdk android-tools-adb android-tools-fastboot
sudo apt install -y p7zip-full p7zip-rar rar unrar
```

### 📥 **Getting Started**

1. **Clone the repository:**
```bash
git clone https://github.com/regnermax36-glitch/MonsterROM.git
cd MonsterROM
```

2. **Set up build environment:**
```bash
source buildenv.sh <device_codename>
```

**Supported devices:**
- `b5q` - Galaxy Z Flip5 (Snapdragon 8550)
- `b0s` - Galaxy S22 (Exynos 2200)
- `c1s` - Galaxy S21 (Exynos 2100)
- `c2s` - Galaxy S21+ (Exynos 2100)
- `g0s` - Galaxy S20 (Exynos 990)
- `beyond2lte` - Galaxy S10+ (Exynos 9820)
- And many more...

### 🔧 **Platform-Specific Features**

#### **Snapdragon 8550 (B5Q - Galaxy Z Flip5)**
- Advanced foldable optimizations
- Adreno GPU performance tuning
- Qualcomm audio enhancements
- Wi-Fi 7 support
- Enhanced cover display features

#### **Exynos Platforms**
- Mali GPU optimizations
- Samsung-specific power management
- Advanced thermal management
- EroFS filesystem support

### 🎨 **Customization Options**

#### **Debloat Profiles**
Set your preferred debloat level:
```bash
export DEBLOAT_PROFILE=minimal    # Light debloating
export DEBLOAT_PROFILE=moderate   # Balanced (default)
export DEBLOAT_PROFILE=aggressive # Heavy debloating
export DEBLOAT_PROFILE=custom     # Use custom profile
```

#### **Theming Options**
Enable advanced theming features:
```bash
export ENABLE_DYNAMIC_THEMING=true
export DEFAULT_THEME=monster_dark  # monster_dark, monster_light, amoled_black
export ENABLE_MATERIAL_YOU=true
```

#### **Performance Profiles**
Choose performance optimization level:
```bash
export PERFORMANCE_PROFILE=balanced    # Default
export PERFORMANCE_PROFILE=performance # Maximum performance
export PERFORMANCE_PROFILE=battery     # Battery optimized
export PERFORMANCE_PROFILE=gaming      # Gaming optimized
```

### 🏗️ **Building the ROM**

#### **Quick Build (Recommended)**
```bash
# Download firmware and build ROM in one command
unica make_rom
```

#### **Step-by-Step Build**
```bash
# 1. Download firmware
unica download_fw

# 2. Extract firmware
unica extract_fw

# 3. Apply patches and customizations
unica apply_patches

# 4. Build filesystem images
unica build_fs_image

# 5. Create flashable package
unica build_flashable_zip
```

### 📱 **Device-Specific Build Instructions**

#### **Galaxy Z Flip5 (B5Q)**
```bash
# Set up for B5Q with foldable optimizations
source buildenv.sh b5q
export ENABLE_FOLDABLE_FEATURES=true
export ENABLE_COVER_DISPLAY_ENHANCEMENTS=true
export SNAPDRAGON_OPTIMIZATIONS=true
unica make_rom
```

#### **Galaxy S22 Series (Exynos 2200)**
```bash
# Set up for S22 series
source buildenv.sh b0s  # or c2s, r8s depending on model
export EXYNOS_OPTIMIZATIONS=true
export ENABLE_GAMING_MODE=true
unica make_rom
```

### 🔍 **Advanced Build Options**

#### **Custom Firmware Source**
```bash
# Use specific firmware version
export CUSTOM_FIRMWARE_URL="https://example.com/firmware.zip"
export CUSTOM_FIRMWARE_VERSION="A546BXXU5CXL3"
```

#### **Kernel Customization**
```bash
# Enable custom kernel features
export ENABLE_CUSTOM_KERNEL=true
export KERNEL_VARIANT=performance  # performance, battery, gaming
```

#### **Security Features**
```bash
# Enable advanced security features
export ENABLE_ADVANCED_SECURITY=true
export ENABLE_FIREWALL=true
export ENABLE_PRIVACY_FEATURES=true
```

### 📊 **Build Monitoring**

Monitor your build progress:
```bash
# View build logs in real-time
tail -f out/make_rom-$(date +%Y%m%d)*.log

# Check build status
unica build_status

# View detailed build report
cat out/build_report.txt
```

### 🐛 **Troubleshooting**

#### **Common Issues**

1. **Out of disk space:**
```bash
# Clean build artifacts
unica cleanup
# Or clean specific components
rm -rf out/tmp out/fw
```

2. **Download failures:**
```bash
# Retry download with different mirror
export FIRMWARE_MIRROR=alternative
unica download_fw --retry
```

3. **Build failures:**
```bash
# Enable debug mode
export DEBUG=true
source buildenv.sh <device> --debug
```

4. **Platform detection issues:**
```bash
# Manually specify platform
export TARGET_PLATFORM=sdm8550  # or exynos2100, exynos2200, etc.
```

#### **Platform-Specific Issues**

**Snapdragon devices:**
- Ensure Qualcomm tools are properly installed
- Check for missing vendor blobs
- Verify bootloader compatibility

**Exynos devices:**
- Samsung-specific tools may be required
- Check for proper Exynos kernel sources
- Verify device tree compatibility

### 📋 **Build Output**

After successful build, you'll find:
- `out/odin/` - Odin flashable files (.tar.md5)
- `out/flashable/` - Custom recovery flashable ZIP
- `out/reports/` - Build and debloat reports
- `out/logs/` - Detailed build logs

### 🚀 **Flashing Instructions**

#### **Using Odin (Windows)**
1. Download Odin from Samsung
2. Boot device into Download Mode
3. Flash the .tar.md5 file from `out/odin/`

#### **Using Heimdall (Linux/macOS)**
```bash
# Flash using Heimdall
heimdall flash --SYSTEM out/odin/system.img.lz4 --VENDOR out/odin/vendor.img.lz4
```

#### **Using Custom Recovery**
1. Boot into custom recovery (TWRP/CWM)
2. Flash the ZIP file from `out/flashable/`
3. Wipe cache and dalvik
4. Reboot

### 🔄 **Updating MonsterROM**

```bash
# Update source code
git pull origin oneui8.5

# Rebuild with latest changes
unica cleanup
source buildenv.sh <device>
unica make_rom
```

### 🤝 **Contributing**

Want to add support for your device or platform?

1. **Fork the repository**
2. **Create device configuration:**
   - Add `target/<device>/config.sh`
   - Add device-specific patches if needed
3. **Add platform support if new:**
   - Create `platform/<platform>/debloat.sh`
   - Add platform-specific patches
4. **Test thoroughly**
5. **Submit pull request**

### 📞 **Support**

- **Telegram**: https://t.me/monsterrom6
- **GitHub Issues**: https://github.com/regnermax36-glitch/MonsterROM/issues
- **XDA Thread**: Coming soon

### ⚠️ **Disclaimer**

- Flashing custom firmware voids your warranty
- Always backup your device before flashing
- MonsterROM team is not responsible for bricked devices
- Use at your own risk

---

**Happy building! 🎉**
