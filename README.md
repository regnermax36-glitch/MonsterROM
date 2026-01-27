<h1 align="center">
  <img loading="lazy" src="readme-res/banner.png"/>
</h1>
<p align="center">
  <a href="https://github.com/devcore94/MonsterROM/blob/fifteen/LICENSE"><img loading="lazy" src="https://img.shields.io/github/license/devcore94/MonsterROM?style=for-the-badge&logo=github"/></a>
  <a href="https://github.com/devcore94/MonsterROM/commits/fifteen"><img loading="lazy" src="https://img.shields.io/github/last-commit/devcore94/MonsterROM?style=for-the-badge"/></a>
  <a href="https://github.com/devcore94/MonsterROM/stargazers"><img loading="lazy" src="https://img.shields.io/github/stars/devcore94/MonsterROM?style=for-the-badge"/></a>
  <a href="https://github.com/devcore94/MonsterROM/graphs/contributors"><img loading="lazy" src="https://img.shields.io/github/contributors/devcore94/MonsterROM?style=for-the-badge"/></a>
</p>
<p align="center">MonsterROM is a work-in-progress custom firmware for Samsung Galaxy devices.</p>

<p align="center">
  <a href="https://t.me/monsterrom6">💬 Telegram</a>
  <a href="https://github.com/devcore94/MonsterROM/CHANGELOG.md">📝 Changelog</a>
  <a href="https://github.com/devcore94/MonsterROM/MAINTAINERS">🧑‍💻 Maintainers</a>
</p>

# What is MonsterROM?
MonsterROM is a work-in-progress custom firmware for Samsung Galaxy devices. It's based on the latest and greatest iteration of Samsung's UX and it also includes additional features and tweaks to ensure the best possible experience out of the box.
It is based on the UN1CA build system which allows automatic downloading/extraction of the firmware, applying the required patches and generating a flashable zip package for the specified target device.
MonsterROM supports devices using multiple platforms including Exynos (9820, 990, 2100, 2200) and Snapdragon (8550) SoCs, with more platforms coming soon

Any form of contribution, suggestions, bug report or feature request for the project will be welcome.

# Features

## 🚀 **Core Features**
- Based on the latest pre-release OneUI 8.5 Galaxy S24+ firmware
- All software features from S24+
- S25 Ultra CSC, ringtones and more
- Full Galaxy AI support
- Now Brief Support
- Super HDR support
- Multi-User support
- EroFS partitions
- High end animations
- Native/live blur support

## 🎨 **Advanced Theming System**
- Dynamic theming with multiple built-in themes (Monster Dark, Monster Light, AMOLED Black)
- Material You integration with wallpaper-based colors
- Custom accent colors and icon packs
- Gaming mode and productivity mode themes
- Scheduled dark mode with sunset detection
- Per-app theming support

## 🔧 **Multi-Platform Support**
- **Exynos platforms**: 9820, 990, 2100, 2200
- **Snapdragon platforms**: 8550 (with more coming soon)
- **MediaTek support**: Coming soon
- Universal debloating system across all platforms
- Platform-specific optimizations

## 📱 **Foldable Enhancements (B5Q - Galaxy Z Flip5)**
- Enhanced cover display functionality with widgets and apps
- Advanced Flex mode optimizations for camera and video
- Foldable-specific gestures and productivity features
- Dual display power management
- Seamless display transitions

## ⚡ **Performance Optimizations**
- Adaptive Brightness and Refresh Rate support
- Platform-specific performance tuning (Snapdragon Adreno GPU, Exynos Mali GPU)
- Gaming mode with reduced animations and performance boost
- Advanced memory management and background app limits
- F2FS filesystem support for better storage performance

## 🛡️ **Advanced Security & Privacy**
- Enhanced app permissions system
- Network traffic monitoring and blocking
- Advanced firewall with per-app rules
- Anti-tracking features
- Secure folder enhancements

## 🎮 **Gaming Features**
- Snapdragon Elite Gaming optimizations
- Gaming mode auto-detection
- Performance profiles (battery saver, balanced, performance, gaming)
- Reduced input latency and optimized touch response

## 🧹 **Universal Debloating System**
- Configurable debloat profiles (minimal, moderate, aggressive)
- Platform-agnostic bloatware removal
- Category-based debloating (Samsung, Google, Carrier, Social Media)
- Detailed debloat reports

## 🔊 **Audio Enhancements**
- High-resolution audio support up to 192kHz
- Spatial audio for foldables
- Qualcomm audio enhancements (Snapdragon devices)
- Advanced audio effects and processing

## 📶 **Connectivity Features**
- Wi-Fi 7 support (where hardware supports)
- Enhanced hotspot features (WPA3, 6GHz, Wi-Fi 6)
- Advanced Bluetooth codecs (aptX, aptX HD)
- 5G and eSIM optimizations

# Bugs
Some Small Camerastuffs.

# Licensing
This project is licensed under the terms of the [GNU General Public License v3.0](LICENSE). External dependencies might be distributed under a different license, such as:
- [android-tools](https://github.com/nmeum/android-tools), licensed under the [Apache License 2.0](https://github.com/nmeum/android-tools/blob/master/LICENSE)
- [apktool](https://github.com/iBotPeaches/Apktool), licensed under the [Apache License 2.0](https://github.com/iBotPeaches/Apktool/blob/master/LICENSE.md)
- [erofs-utils](https://github.com/sekaiacg/erofs-utils/), dual license ([GPL-2.0](https://github.com/sekaiacg/erofs-utils/blob/dev/LICENSES/GPL-2.0), [Apache-2.0](https://github.com/sekaiacg/erofs-utils/blob/dev/LICENSES/Apache-2.0))
- [img2sdat](https://github.com/xpirt/img2sdat), licensed under the [MIT License](https://github.com/xpirt/img2sdat/blob/master/LICENSE)
- [platform_build](https://android.googlesource.com/platform/build/) (ext4_utils, f2fs_utils, signapk), licensed under the [Apache License 2.0](https://source.android.com/docs/setup/about/licenses)
- [smali](https://github.com/google/smali), [multiple licenses](https://github.com/google/smali/blob/main/third_party/NOTICE)

# Accountability
```cpp
#include <std_disclaimer.h>

/*
* Your warranty is now void.
*
* I am not responsible for bricked devices, dead SD cards,
* thermonuclear war, or you getting fired because the alarm app failed. Please
* do some research if you have any concerns about doing this to your device
* YOU are choosing to make these modifications, and if
* you point the finger at me for messing up your device, I will laugh at you.
*
* I am also not responsible for you getting in trouble for using any of the
* features in this ROM, including but not limited to Call Recording, secure
* flag removal etc.
*/
```

# Credits
A big thanks goes to the following for their invaluable contributions in no particular order (MORE INFO AND PEOPLE: TO BE WRITTEN)
- **[salvogiangri](https://github.com/salvogiangri)** for the UN1CA build system, OneUI patches, and general help and support while developing
- **[Ocin4Ever](https://github.com/Ocin4Ever)** for a lot of help especially on smali, advice and emotional support :D
- **[Igor](https://github.com/BotchedRPR)** for getting me into porting, teaching me the basics, and emotional support down the road
- **[Halal Beef](https://github.com/halal-beef)** for lk3rd, testing and misc help
- **[Emad](https://github.com/emadhamid7)** for help with S10-specific fixes
- **[Duhan](https://github.com/duhansysl)** for help with vendor backports, a lot of fixes and advice
- **[Anan](https://github.com/ananjaser1211)** for all of his contributions to OneUI porting
- **[PeterKnecht93](https://github.com/PeterKnecht93)** for help with smali and a lot of misc fixes
- **[tsn](https://github.com/tisenu100)** for some smali fixes and advice
- **[Nguyen Long](https://github.com/LumiPlayground)** for misc fixes and support
- **[AlexFurina](https://github.com/AlexFurina)** for S10 specific fixes
- **[Luphaestus](https://github.com/Luphaestus)** for Note 20 specific fixes
- **[Yagzie](https://github.com/Yagzie)** for engmode and misc fixes
- **[Fred](https://github.com/xfwdrev)** for WFD, HDR10+, audiopolicy and more fixes
- **[Saad](https://github.com/saadelasfur)** for help with build system
- **[Vince](https://github.com/borbelyvince)** for help with kernel upstream
- **Nhat Vo** for Google Telemetry app removal
- **[Code Malaya](https://github.com/jomiejoshiro)** for SPen Air Actions
- **[Renox](https://github.com/renoxtv)** for overlay patches and testing
- **[Ksawlii](https://github.com/Ksawlii)** for updating the build system and FOD animation patch
- **[nalz0](https://github.com/nalz0)** for Multi-User support
- **[EndaDwagon](https://github.com/EndaDwagon)** for the big majority of the ExtremeROM Wiki
- **[Oskar](https://github.com/osrott61-gh)** for Odinpacks, Building before we started using CI, Wiki
- **[Mesazane](https://github.com/Mesazane)** for Building before we started using CI
- **[Dupa](https://github.com/dupazlasu)** for Maintaining S22 Series (ROM + Kernel)
- **[RayShocker](https://github.com/RayShocker)** for HRM fix
- **[Szucsy92](https://github.com/Szucsy92)** for SingleTake fix
- **[Kurt](https://github.com/kurtbahartr)** for ASCII art and some minor fixes
- And everyone else who aided in testing, wiki, translations etc!

Original UN1CA credits:
- **[ShaDisNX255](https://github.com/ShaDisNX255)** for his help, time and for his [NcX ROM](https://github.com/ShaDisNX255/NcX_Stock) which inspired this project
- **[DavidArsene](https://github.com/DavidArsene)** for his help and time
- **[paulowesll](https://github.com/paulowesll)** for his help and support
- **[Simon1511](https://github.com/Simon1511)** for his support and some of the device-specific patches
- **[ananjaser1211](https://github.com/ananjaser1211)** for troubleshooting and his time
- **[iDrinkCoffee](https://github.com/iDrinkCoffee-TG)** and **[RisenID](https://github.com/RisenID)** for documentation revisioning
- **[LineageOS Team](https://www.lineageos.org/)** for their original [OTA updater implementation](https://github.com/LineageOS/android_packages_apps_Updater)
- *All the UN1CA project contributors and testers ❤️*

# Kernel sources and device trees

## 🔧 **Exynos Platforms**
- **9820 Kernel Source Code** (Maintainer: @ExtremeXT): https://github.com/ExtremeXT/M62-backport
- **9820 Device Tree Code** (Maintainer: @ExtremeXT): https://github.com/ExtremeXT/android_device_samsung_exynos9820
- **990 Kernel Source Code** (Maintainer: @ExtremeXT): https://github.com/ExtremeXT/990_upstream_v2
- **990 Device Tree Code** (Maintainer: @ExtremeXT): https://github.com/ExtremeXT/android_device_samsung_exynos9820
- **2100 Kernel Source Code** (Maintainer: @xfwdrev/@maximusXZ): https://github.com/xfwdrev/android_kernel_samsung_ex2100
- **2100 Device Tree Code** (Maintainer: @xfwdrev/@maximusXZ): https://github.com/xfwdrev/android_device_samsung_exynos2100
- **2200 Kernel Source Code** (Maintainer: @dupazlasu): https://github.com/ExtremeXT/android_kernel_samsung_s5e9925
- **2200 Device Tree Code** (Maintainer: @dupazlasu): https://github.com/dupazlasu/android_device_samsung_s5e9925

## 📱 **Snapdragon Platforms**
- **8550 Kernel Source Code** (B5Q - Galaxy Z Flip5): Coming soon
- **8550 Device Tree Code** (B5Q - Galaxy Z Flip5): Coming soon
- **8650 Support** (Snapdragon 8 Gen 3): Planned
- **7550 Support** (Snapdragon 7+ Gen 3): Planned

## 🚀 **Future Platform Support**
- **MediaTek Dimensity**: Under development
- **Additional Snapdragon platforms**: Based on community demand

# Stargazers over time
[![Stargazers over time](https://starchart.cc/devcore94/MonsterROM.svg)](https://starchart.cc/devcore94/MonsterROM)
