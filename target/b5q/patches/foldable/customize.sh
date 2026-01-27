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

# Galaxy Z Flip5 (B5Q) foldable-specific customizations

# Enhanced cover display features
if [ -f "$WORK_DIR/system/build.prop" ]; then
    echo "# Galaxy Z Flip5 foldable optimizations" >> "$WORK_DIR/system/build.prop"
    
    # Cover display enhancements
    echo "ro.samsung.foldable.cover_display=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.cover_display.enhanced=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.cover_display.widgets=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.cover_display.apps=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.cover_display.camera=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.cover_display.notifications=true" >> "$WORK_DIR/system/build.prop"
    
    # Flex mode optimizations
    echo "ro.samsung.foldable.flex_mode=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.flex_mode.enhanced=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.flex_mode.camera=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.flex_mode.video=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.flex_mode.apps=true" >> "$WORK_DIR/system/build.prop"
    
    # Multi-window enhancements for foldables
    echo "ro.samsung.foldable.multiwindow=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.multiwindow.enhanced=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.split_screen=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.popup_view=true" >> "$WORK_DIR/system/build.prop"
    
    # Foldable-specific gestures
    echo "ro.samsung.foldable.gestures=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.palm_swipe=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.edge_panels=true" >> "$WORK_DIR/system/build.prop"
    
    # Enhanced productivity features
    echo "ro.samsung.foldable.productivity=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.taskbar=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.app_continuity=true" >> "$WORK_DIR/system/build.prop"
    
    # Foldable-specific camera features
    echo "ro.samsung.foldable.camera.flex_mode=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.camera.cover_display=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.camera.hands_free=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.camera.auto_framing=true" >> "$WORK_DIR/system/build.prop"
    
    # Battery optimizations for dual displays
    echo "ro.samsung.foldable.battery.dual_display=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.battery.adaptive=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.power_saving.cover=true" >> "$WORK_DIR/system/build.prop"
    
    # Display transition optimizations
    echo "ro.samsung.foldable.display.transition=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.display.seamless=true" >> "$WORK_DIR/system/build.prop"
    echo "ro.samsung.foldable.display.adaptive_refresh=true" >> "$WORK_DIR/system/build.prop"
fi

# Vendor build.prop foldable optimizations
if [ -f "$WORK_DIR/vendor/build.prop" ]; then
    echo "# Galaxy Z Flip5 vendor foldable optimizations" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.samsung.foldable=true" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.samsung.foldable.type=flip" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.samsung.foldable.cover_display=true" >> "$WORK_DIR/vendor/build.prop"
    echo "ro.vendor.samsung.foldable.flex_mode=true" >> "$WORK_DIR/vendor/build.prop"
fi

# Enhanced cover display configuration
if [ -f "$WORK_DIR/system/etc/permissions/platform.xml" ]; then
    # Add foldable-specific permissions
    sed -i '/<\/permissions>/i\    <permission name="com.samsung.android.permission.COVER_DISPLAY" >\n        <group gid="system" />\n    </permission>' "$WORK_DIR/system/etc/permissions/platform.xml"
    sed -i '/<\/permissions>/i\    <permission name="com.samsung.android.permission.FLEX_MODE" >\n        <group gid="system" />\n    </permission>' "$WORK_DIR/system/etc/permissions/platform.xml"
fi

# Foldable-specific display configuration
if [ -f "$WORK_DIR/system/etc/display_config.xml" ]; then
    # Enable dual display support
    sed -i 's/dual_display="false"/dual_display="true"/g' "$WORK_DIR/system/etc/display_config.xml"
    sed -i 's/cover_display="false"/cover_display="true"/g' "$WORK_DIR/system/etc/display_config.xml"
fi

# Enhanced multitasking for foldables
if [ -f "$WORK_DIR/system/etc/sysconfig/preinstalled-packages-platform.xml" ]; then
    # Add foldable-specific system packages
    sed -i '/<\/config>/i\    <install-in-user-type package="com.samsung.android.app.foldable">\n        <install-in user-type="FULL" />\n    </install-in-user-type>' "$WORK_DIR/system/etc/sysconfig/preinstalled-packages-platform.xml"
fi

# Cover display widget configuration
if [ -d "$WORK_DIR/system/etc/permissions" ]; then
    cat > "$WORK_DIR/system/etc/permissions/com.samsung.foldable.cover.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<permissions>
    <feature name="com.samsung.feature.foldable" />
    <feature name="com.samsung.feature.cover_display" />
    <feature name="com.samsung.feature.flex_mode" />
    <feature name="com.samsung.feature.dual_display" />
    
    <permission name="com.samsung.android.permission.COVER_DISPLAY">
        <group gid="system" />
    </permission>
    
    <permission name="com.samsung.android.permission.FLEX_MODE">
        <group gid="system" />
    </permission>
    
    <permission name="com.samsung.android.permission.FOLDABLE_GESTURES">
        <group gid="system" />
    </permission>
</permissions>
EOF
fi

# Foldable-specific audio configuration
if [ -f "$WORK_DIR/vendor/etc/audio/audio_policy_configuration.xml" ]; then
    # Enable spatial audio for foldables
    sed -i 's/spatial_audio="false"/spatial_audio="true"/g' "$WORK_DIR/vendor/etc/audio/audio_policy_configuration.xml"
    
    # Enable dual speaker optimization
    sed -i 's/dual_speaker="false"/dual_speaker="true"/g' "$WORK_DIR/vendor/etc/audio/audio_policy_configuration.xml"
fi

# Enhanced camera configuration for foldables
if [ -f "$WORK_DIR/vendor/etc/camera/camera_config.xml" ]; then
    # Enable flex mode camera features
    sed -i 's/flex_mode_camera="false"/flex_mode_camera="true"/g' "$WORK_DIR/vendor/etc/camera/camera_config.xml"
    
    # Enable cover display camera preview
    sed -i 's/cover_display_preview="false"/cover_display_preview="true"/g' "$WORK_DIR/vendor/etc/camera/camera_config.xml"
    
    # Enable hands-free camera mode
    sed -i 's/hands_free_mode="false"/hands_free_mode="true"/g' "$WORK_DIR/vendor/etc/camera/camera_config.xml"
fi

# Foldable-specific power management
if [ -f "$WORK_DIR/vendor/etc/power_profile.xml" ]; then
    # Optimize power consumption for dual displays
    sed -i 's/dual_display_power="0"/dual_display_power="1"/g' "$WORK_DIR/vendor/etc/power_profile.xml"
    
    # Enable adaptive power management
    sed -i 's/adaptive_power="false"/adaptive_power="true"/g' "$WORK_DIR/vendor/etc/power_profile.xml"
fi

# Enhanced vibration patterns for foldables
if [ -f "$WORK_DIR/system/etc/vibration_patterns.xml" ]; then
    # Add foldable-specific vibration patterns
    sed -i '/<\/patterns>/i\    <pattern name="fold_open" duration="100" amplitude="128" />' "$WORK_DIR/system/etc/vibration_patterns.xml"
    sed -i '/<\/patterns>/i\    <pattern name="fold_close" duration="80" amplitude="96" />' "$WORK_DIR/system/etc/vibration_patterns.xml"
    sed -i '/<\/patterns>/i\    <pattern name="flex_mode" duration="60" amplitude="64" />' "$WORK_DIR/system/etc/vibration_patterns.xml"
fi

# Foldable-specific thermal management
if [ -f "$WORK_DIR/vendor/etc/thermal-engine.conf" ]; then
    # Add thermal zones for dual displays
    echo "" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "# Foldable-specific thermal management" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "[COVER_DISPLAY_THERMAL]" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "algo_type monitor" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "sensor cover_display_temp" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "sampling 2000" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "thresholds 45000 50000 55000" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "thresholds_clr 42000 47000 52000" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "actions cpu cpu cpu" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
    echo "action_info 1804800 1612800 1420800" >> "$WORK_DIR/vendor/etc/thermal-engine.conf"
fi

echo "Galaxy Z Flip5 foldable customizations applied"
