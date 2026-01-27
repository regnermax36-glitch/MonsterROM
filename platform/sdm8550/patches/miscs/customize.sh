#!/usr/bin/env bash
#
# Copyright (C) 2025 MonsterROM Team
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Snapdragon 8550 platform-specific customizations

# Disable encryption for Snapdragon devices (similar to Exynos)
if [ -f "$WORK_DIR/vendor/etc/fstab.qcom" ]; then
    LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.qcom")
    if [ -n "$LINE" ]; then
        sed -i "${LINE}s/,fileencryption=aes-256-xts:aes-256-cts:v2//g" "$WORK_DIR/vendor/etc/fstab.qcom"
        
        # Remove ODE, keydata, and keyrefuge entries
        sed -i -e "/ODE/d" -e "/keydata/d" -e "/keyrefuge/d" "$WORK_DIR/vendor/etc/fstab.qcom"
    fi
fi

# Alternative fstab locations for different Snapdragon variants
for fstab_file in "fstab.sdm8550" "fstab.kalama" "fstab.pineapple"; do
    if [ -f "$WORK_DIR/vendor/etc/$fstab_file" ]; then
        LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/$fstab_file")
        if [ -n "$LINE" ]; then
            sed -i "${LINE}s/,fileencryption=aes-256-xts:aes-256-cts:v2//g" "$WORK_DIR/vendor/etc/$fstab_file"
            sed -i -e "/ODE/d" -e "/keydata/d" -e "/keyrefuge/d" "$WORK_DIR/vendor/etc/$fstab_file"
        fi
    fi
done

# Snapdragon-specific performance optimizations
if [ -f "$WORK_DIR/vendor/etc/perf/perfboostsconfig.xml" ]; then
    # Enable aggressive performance boosting for Snapdragon
    sed -i 's/Enable="false"/Enable="true"/g' "$WORK_DIR/vendor/etc/perf/perfboostsconfig.xml"
fi

# Adreno GPU optimizations
if [ -f "$WORK_DIR/vendor/etc/gpu/gpu_config.xml" ]; then
    # Enable GPU performance mode
    sed -i 's/gpu_perf_mode="0"/gpu_perf_mode="1"/g' "$WORK_DIR/vendor/etc/gpu/gpu_config.xml"
fi

# Qualcomm-specific thermal optimizations
if [ -f "$WORK_DIR/vendor/etc/thermal-engine.conf" ]; then
    # Adjust thermal throttling for better performance
    sed -i 's/temp_threshold=.*$/temp_threshold=85000/g' "$WORK_DIR/vendor/etc/thermal-engine.conf"
fi

# Enable Snapdragon-specific features
if [ -f "$WORK_DIR/system/build.prop" ]; then
    # Snapdragon performance optimizations
    echo "# Snapdragon 8550 optimizations" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.qti.sys.fw.bg_apps_limit=60" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.qti.sys.fw.bservice_enable=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.qti.sys.fw.bservice_limit=8" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.qti.sys.fw.bservice_age=5000" >> "$WORK_DIR/system/build.prop"
    
    # Adreno GPU optimizations
    echo "ro.vendor.adreno.boostperfmode=1" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.gpu.available_frequencies=*" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.perf.scroll_opt=true" >> "$WORK_DIR/system/build.prop"
    
    # Qualcomm audio enhancements
    echo "ro.vendor.audio.sdk.fluencetype=fluence" >> "$WORK_DIR/system/build.prop"
    echo "persist.vendor.audio.fluence.voicecall=true" >> "$WORK_DIR/system/build.prop"
    echo "persist.vendor.audio.fluence.voicerec=false" >> "$WORK_DIR/system/build.prop"
    echo "persist.vendor.audio.fluence.speaker=true" >> "$WORK_DIR/system/build.prop"
    
    # Snapdragon connectivity optimizations
    echo "ro.vendor.qti.va_aosp.support=1" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.qti.va_odm.support=1" >> "$WORK_DIR/system/build.prop"
    echo "persist.vendor.qti.inputopts.enable=true" >> "$WORK_DIR/system/build.prop"
    echo "persist.vendor.qti.inputopts.movetouchslop=0.6" >> "$WORK_DIR/system/build.prop"
    
    # Enable Snapdragon Elite Gaming features
    echo "ro.vendor.qti.config.zram=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.config.fha_enable=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.sys.fw.bg_apps_limit=32" >> "$WORK_DIR/system/build.prop"
    
    # Snapdragon camera optimizations
    echo "persist.vendor.camera.privapp.list=org.codeaurora.snapcam" >> "$WORK_DIR/system/build.prop"
    echo "persist.vendor.camera.display.umax=1920x1080" >> "$WORK_DIR/system/build.prop"
    echo "persist.vendor.camera.display.lmax=1280x720" >> "$WORK_DIR/system/build.prop"
    
    # Memory and storage optimizations
    echo "ro.vendor.qti.config.swap=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.qti.am.reschedule_service=true" >> "$WORK_DIR/system/build.prop"
    
    # Enable advanced Snapdragon features
    echo "ro.vendor.extension_library=libqti-perfd-client.so" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.perf.scroll_opt=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.vendor.qti.config.zram=true" >> "$WORK_DIR/system/build.prop"
fi

# Vendor build.prop optimizations
if [ -f "$WORK_DIR/vendor/build.prop" ]; then
    echo "# Snapdragon 8550 vendor optimizations" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.qti.config.zram=true" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.qti.sys.fw.bg_apps_limit=60" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.perf.scroll_opt=true" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.adreno.boostperfmode=1" >> "$WORK_DIR/vendor/build.prop"
fi

# Enable F2FS for userdata partition on Snapdragon (similar to Exynos)
if [ -f "$WORK_DIR/vendor/etc/fstab.qcom" ]; then
    FROM="ext4"
    TO="f2fs"
    LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.qcom")
    if [ -n "$LINE" ]; then
        sed -i -e "${LINE}s/ext4/f2fs/g" -e "${LINE}s/$FROM/$TO/g" "$WORK_DIR/vendor/etc/fstab.qcom"
    fi
fi

# Alternative fstab F2FS conversion
for fstab_file in "fstab.sdm8550" "fstab.kalama" "fstab.pineapple"; do
    if [ -f "$WORK_DIR/vendor/etc/$fstab_file" ]; then
        LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/$fstab_file")
        if [ -n "$LINE" ]; then
            sed -i -e "${LINE}s/ext4/f2fs/g" "$WORK_DIR/vendor/etc/$fstab_file"
        fi
    fi
done

# Snapdragon-specific Netflix BSP revision (for better Netflix support)
if [ -f "$WORK_DIR/system/build.prop" ]; then
    # Set Netflix BSP revision for Snapdragon 8550
    echo "ro.netflix.bsp_rev=Q8550-44771-1" >> "$WORK_DIR/system/build.prop"
fi

# Enable Snapdragon-specific Wi-Fi optimizations
if [ -f "$WORK_DIR/vendor/etc/wifi/WCNSS_qcom_cfg.ini" ]; then
    # Enable Wi-Fi 7 features if supported
    sed -i 's/gEnable11ac=0/gEnable11ac=1/g' "$WORK_DIR/vendor/etc/wifi/WCNSS_qcom_cfg.ini"
    sed -i 's/gEnable11ax=0/gEnable11ax=1/g' "$WORK_DIR/vendor/etc/wifi/WCNSS_qcom_cfg.ini"
    
    # Enable advanced Wi-Fi features
    echo "gEnable11be=1" >> "$WORK_DIR/vendor/etc/wifi/WCNSS_qcom_cfg.ini"
    echo "gEnableWifiOffload=1" >> "$WORK_DIR/vendor/etc/wifi/WCNSS_qcom_cfg.ini"
fi

# Snapdragon-specific audio configuration
if [ -d "$WORK_DIR/vendor/etc/audio" ]; then
    # Enable advanced audio features
    for audio_policy in "$WORK_DIR/vendor/etc/audio"/*audio_policy*.xml; do
        if [ -f "$audio_policy" ]; then
            # Enable high-res audio
            sed -i 's/samplingRates="8000,16000"/samplingRates="8000,16000,22050,24000,32000,44100,48000,88200,96000,176400,192000"/g' "$audio_policy"
        fi
    done
fi

# Enable Snapdragon Elite Gaming optimizations
if [ -f "$WORK_DIR/system/etc/permissions/platform.xml" ]; then
    # Add gaming-specific permissions
    sed -i '/<\/permissions>/i\    <permission name="android.permission.ACCESS_GAMING_MANAGER" >\n        <group gid="system" />\n    </permission>' "$WORK_DIR/system/etc/permissions/platform.xml"
fi

echo "Snapdragon 8550 platform customizations applied"
