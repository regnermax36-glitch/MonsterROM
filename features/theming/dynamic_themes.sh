#!/usr/bin/env bash
#
# Copyright (C) 2025 MonsterROM Team
#
# Dynamic theming system for MonsterROM
# Provides multiple theme options and customization
#

# Apply dynamic theming system
apply_dynamic_theming() {
    local work_dir="$WORK_DIR"
    
    echo "Applying dynamic theming system..."
    
    # Enable advanced theming in system properties
    if [ -f "$work_dir/system/build.prop" ]; then
        echo "# MonsterROM Dynamic Theming System" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.enabled=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.dynamic=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.material_you=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.custom_accents=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.icon_packs=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.fonts=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.wallpaper_colors=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.adaptive_icons=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.dark_mode_schedule=true" >> "$work_dir/system/build.prop"
        echo "ro.monster.theming.per_app_themes=true" >> "$work_dir/system/build.prop"
    fi
    
    # Create theming configuration directory
    mkdir -p "$work_dir/system/etc/monster/theming"
    
    # Create theme configuration file
    cat > "$work_dir/system/etc/monster/theming/theme_config.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<theming_config>
    <!-- MonsterROM Dynamic Theming Configuration -->
    
    <!-- Available Themes -->
    <themes>
        <theme name="monster_dark" display_name="Monster Dark" type="dark" default="true">
            <primary_color>#FF6B35</primary_color>
            <secondary_color>#FF8E53</secondary_color>
            <accent_color>#FF6B35</accent_color>
            <background_color>#121212</background_color>
            <surface_color>#1E1E1E</surface_color>
            <on_primary>#FFFFFF</on_primary>
            <on_secondary>#000000</on_secondary>
            <on_background>#FFFFFF</on_background>
            <on_surface>#FFFFFF</on_surface>
        </theme>
        
        <theme name="monster_light" display_name="Monster Light" type="light">
            <primary_color>#FF6B35</primary_color>
            <secondary_color>#FF8E53</secondary_color>
            <accent_color>#FF6B35</accent_color>
            <background_color>#FFFFFF</background_color>
            <surface_color>#F5F5F5</surface_color>
            <on_primary>#FFFFFF</on_primary>
            <on_secondary>#000000</on_secondary>
            <on_background>#000000</on_background>
            <on_surface>#000000</on_surface>
        </theme>
        
        <theme name="amoled_black" display_name="AMOLED Black" type="dark">
            <primary_color>#FF6B35</primary_color>
            <secondary_color>#FF8E53</secondary_color>
            <accent_color>#FF6B35</accent_color>
            <background_color>#000000</background_color>
            <surface_color>#000000</surface_color>
            <on_primary>#FFFFFF</on_primary>
            <on_secondary>#FFFFFF</on_secondary>
            <on_background>#FFFFFF</on_background>
            <on_surface>#FFFFFF</on_surface>
        </theme>
        
        <theme name="material_you" display_name="Material You" type="dynamic">
            <dynamic_colors>true</dynamic_colors>
            <wallpaper_based>true</wallpaper_based>
            <adaptive_brightness>true</adaptive_brightness>
        </theme>
        
        <theme name="gaming_mode" display_name="Gaming Mode" type="dark">
            <primary_color>#00FF41</primary_color>
            <secondary_color>#39FF14</secondary_color>
            <accent_color>#00FF41</accent_color>
            <background_color>#0D0D0D</background_color>
            <surface_color>#1A1A1A</surface_color>
            <gaming_optimized>true</gaming_optimized>
            <reduced_animations>true</reduced_animations>
        </theme>
        
        <theme name="productivity" display_name="Productivity" type="light">
            <primary_color>#2196F3</primary_color>
            <secondary_color>#64B5F6</secondary_color>
            <accent_color>#2196F3</accent_color>
            <background_color>#FAFAFA</background_color>
            <surface_color>#FFFFFF</surface_color>
            <high_contrast>true</high_contrast>
            <reduced_blue_light>true</reduced_blue_light>
        </theme>
    </themes>
    
    <!-- Accent Colors -->
    <accent_colors>
        <color name="monster_orange" value="#FF6B35" default="true" />
        <color name="electric_blue" value="#007BFF" />
        <color name="neon_green" value="#39FF14" />
        <color name="hot_pink" value="#FF1493" />
        <color name="purple_haze" value="#8A2BE2" />
        <color name="sunset_red" value="#FF4500" />
        <color name="ocean_teal" value="#008B8B" />
        <color name="golden_yellow" value="#FFD700" />
        <color name="forest_green" value="#228B22" />
        <color name="royal_purple" value="#6A0DAD" />
    </accent_colors>
    
    <!-- Icon Packs -->
    <icon_packs>
        <pack name="monster_icons" display_name="Monster Icons" default="true" />
        <pack name="material_icons" display_name="Material Icons" />
        <pack name="rounded_icons" display_name="Rounded Icons" />
        <pack name="sharp_icons" display_name="Sharp Icons" />
        <pack name="minimal_icons" display_name="Minimal Icons" />
    </icon_packs>
    
    <!-- Font Options -->
    <fonts>
        <font name="roboto" display_name="Roboto" default="true" />
        <font name="product_sans" display_name="Product Sans" />
        <font name="open_sans" display_name="Open Sans" />
        <font name="lato" display_name="Lato" />
        <font name="montserrat" display_name="Montserrat" />
        <font name="poppins" display_name="Poppins" />
    </fonts>
    
    <!-- Advanced Options -->
    <advanced_options>
        <option name="adaptive_brightness" default="true" />
        <option name="wallpaper_based_colors" default="true" />
        <option name="per_app_themes" default="false" />
        <option name="dark_mode_schedule" default="true" />
        <option name="gaming_mode_auto" default="false" />
        <option name="productivity_mode_auto" default="false" />
        <option name="battery_saver_theme" default="true" />
    </advanced_options>
</theming_config>
EOF
    
    # Create theme overlays directory
    mkdir -p "$work_dir/system/product/overlay/theming"
    
    # Create Monster Dark theme overlay
    create_theme_overlay "monster_dark" "$work_dir/system/product/overlay/theming"
    
    # Create Monster Light theme overlay
    create_theme_overlay "monster_light" "$work_dir/system/product/overlay/theming"
    
    # Create AMOLED Black theme overlay
    create_theme_overlay "amoled_black" "$work_dir/system/product/overlay/theming"
    
    # Enable theming permissions
    if [ -f "$work_dir/system/etc/permissions/platform.xml" ]; then
        sed -i '/<\/permissions>/i\    <permission name="com.monster.theming.APPLY_THEMES" >\n        <group gid="system" />\n    </permission>' "$work_dir/system/etc/permissions/platform.xml"
        sed -i '/<\/permissions>/i\    <permission name="com.monster.theming.CREATE_THEMES" >\n        <group gid="system" />\n    </permission>' "$work_dir/system/etc/permissions/platform.xml"
    fi
    
    # Create theming service configuration
    cat > "$work_dir/system/etc/monster/theming/service_config.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<service_config>
    <!-- MonsterROM Theming Service Configuration -->
    
    <service name="MonsterThemingService" enabled="true">
        <auto_apply_wallpaper_colors>true</auto_apply_wallpaper_colors>
        <schedule_dark_mode>true</schedule_dark_mode>
        <gaming_mode_detection>true</gaming_mode_detection>
        <productivity_mode_detection>true</productivity_mode_detection>
        <battery_saver_theme>true</battery_saver_theme>
        <per_app_theme_support>true</per_app_theme_support>
    </service>
    
    <schedules>
        <dark_mode>
            <start_time>20:00</start_time>
            <end_time>07:00</end_time>
            <auto_detect_sunset>true</auto_detect_sunset>
        </dark_mode>
        
        <gaming_mode>
            <auto_detect_games>true</auto_detect_games>
            <performance_optimized>true</performance_optimized>
            <reduced_animations>true</reduced_animations>
        </gaming_mode>
        
        <productivity_mode>
            <work_hours_start>09:00</work_hours_start>
            <work_hours_end>17:00</work_hours_end>
            <high_contrast>true</high_contrast>
            <reduced_blue_light>true</reduced_blue_light>
        </productivity_mode>
    </schedules>
</service_config>
EOF
    
    echo "Dynamic theming system applied successfully!"
}

# Create theme overlay function
create_theme_overlay() {
    local theme_name="$1"
    local overlay_dir="$2"
    local theme_dir="$overlay_dir/$theme_name"
    
    mkdir -p "$theme_dir/res/values"
    
    # Create theme-specific colors based on theme name
    case "$theme_name" in
        "monster_dark")
            create_monster_dark_overlay "$theme_dir"
            ;;
        "monster_light")
            create_monster_light_overlay "$theme_dir"
            ;;
        "amoled_black")
            create_amoled_black_overlay "$theme_dir"
            ;;
    esac
}

# Create Monster Dark theme overlay
create_monster_dark_overlay() {
    local theme_dir="$1"
    
    cat > "$theme_dir/res/values/colors.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Monster Dark Theme Colors -->
    <color name="primary_color">#FF6B35</color>
    <color name="primary_variant">#E55A2B</color>
    <color name="secondary_color">#FF8E53</color>
    <color name="secondary_variant">#E57A47</color>
    <color name="background">#121212</color>
    <color name="surface">#1E1E1E</color>
    <color name="error">#CF6679</color>
    <color name="on_primary">#FFFFFF</color>
    <color name="on_secondary">#000000</color>
    <color name="on_background">#FFFFFF</color>
    <color name="on_surface">#FFFFFF</color>
    <color name="on_error">#000000</color>
    
    <!-- System UI Colors -->
    <color name="system_accent1_0">#000000</color>
    <color name="system_accent1_10">#FF6B35</color>
    <color name="system_accent1_50">#FF8E53</color>
    <color name="system_accent1_100">#FFB085</color>
    <color name="system_accent1_200">#FFD1B7</color>
    <color name="system_accent1_300">#FFE8DB</color>
    <color name="system_accent1_400">#FFF4ED</color>
    <color name="system_accent1_500">#FFFAF7</color>
    <color name="system_accent1_600">#FFFFFF</color>
    <color name="system_accent1_700">#FFFFFF</color>
    <color name="system_accent1_800">#FFFFFF</color>
    <color name="system_accent1_900">#FFFFFF</color>
    <color name="system_accent1_1000">#FFFFFF</color>
</resources>
EOF
    
    cat > "$theme_dir/AndroidManifest.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.monster.theming.dark"
    android:versionCode="1"
    android:versionName="1.0">
    
    <overlay
        android:targetPackage="android"
        android:category="android.theme.customization.system_palette"
        android:priority="1" />
    
    <application android:label="Monster Dark Theme" />
</manifest>
EOF
}

# Create Monster Light theme overlay
create_monster_light_overlay() {
    local theme_dir="$1"
    
    cat > "$theme_dir/res/values/colors.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Monster Light Theme Colors -->
    <color name="primary_color">#FF6B35</color>
    <color name="primary_variant">#E55A2B</color>
    <color name="secondary_color">#FF8E53</color>
    <color name="secondary_variant">#E57A47</color>
    <color name="background">#FFFFFF</color>
    <color name="surface">#F5F5F5</color>
    <color name="error">#B00020</color>
    <color name="on_primary">#FFFFFF</color>
    <color name="on_secondary">#000000</color>
    <color name="on_background">#000000</color>
    <color name="on_surface">#000000</color>
    <color name="on_error">#FFFFFF</color>
    
    <!-- System UI Colors -->
    <color name="system_accent1_0">#FFFFFF</color>
    <color name="system_accent1_10">#FFF4ED</color>
    <color name="system_accent1_50">#FFE8DB</color>
    <color name="system_accent1_100">#FFD1B7</color>
    <color name="system_accent1_200">#FFB085</color>
    <color name="system_accent1_300">#FF8E53</color>
    <color name="system_accent1_400">#FF6B35</color>
    <color name="system_accent1_500">#E55A2B</color>
    <color name="system_accent1_600">#CC4A21</color>
    <color name="system_accent1_700">#B33A17</color>
    <color name="system_accent1_800">#992A0D</color>
    <color name="system_accent1_900">#801A03</color>
    <color name="system_accent1_1000">#000000</color>
</resources>
EOF
    
    cat > "$theme_dir/AndroidManifest.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.monster.theming.light"
    android:versionCode="1"
    android:versionName="1.0">
    
    <overlay
        android:targetPackage="android"
        android:category="android.theme.customization.system_palette"
        android:priority="1" />
    
    <application android:label="Monster Light Theme" />
</manifest>
EOF
}

# Create AMOLED Black theme overlay
create_amoled_black_overlay() {
    local theme_dir="$1"
    
    cat > "$theme_dir/res/values/colors.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- AMOLED Black Theme Colors -->
    <color name="primary_color">#FF6B35</color>
    <color name="primary_variant">#E55A2B</color>
    <color name="secondary_color">#FF8E53</color>
    <color name="secondary_variant">#E57A47</color>
    <color name="background">#000000</color>
    <color name="surface">#000000</color>
    <color name="error">#CF6679</color>
    <color name="on_primary">#FFFFFF</color>
    <color name="on_secondary">#FFFFFF</color>
    <color name="on_background">#FFFFFF</color>
    <color name="on_surface">#FFFFFF</color>
    <color name="on_error">#000000</color>
    
    <!-- System UI Colors for AMOLED -->
    <color name="system_accent1_0">#000000</color>
    <color name="system_accent1_10">#FF6B35</color>
    <color name="system_accent1_50">#FF8E53</color>
    <color name="system_accent1_100">#FFB085</color>
    <color name="system_accent1_200">#FFD1B7</color>
    <color name="system_accent1_300">#FFE8DB</color>
    <color name="system_accent1_400">#FFF4ED</color>
    <color name="system_accent1_500">#FFFAF7</color>
    <color name="system_accent1_600">#FFFFFF</color>
    <color name="system_accent1_700">#FFFFFF</color>
    <color name="system_accent1_800">#FFFFFF</color>
    <color name="system_accent1_900">#FFFFFF</color>
    <color name="system_accent1_1000">#FFFFFF</color>
    
    <!-- Pure black backgrounds for AMOLED -->
    <color name="system_neutral1_0">#000000</color>
    <color name="system_neutral1_10">#000000</color>
    <color name="system_neutral1_50">#0A0A0A</color>
    <color name="system_neutral1_100">#141414</color>
    <color name="system_neutral1_200">#1E1E1E</color>
    <color name="system_neutral1_300">#282828</color>
    <color name="system_neutral1_400">#323232</color>
    <color name="system_neutral1_500">#3C3C3C</color>
    <color name="system_neutral1_600">#464646</color>
    <color name="system_neutral1_700">#505050</color>
    <color name="system_neutral1_800">#5A5A5A</color>
    <color name="system_neutral1_900">#646464</color>
    <color name="system_neutral1_1000">#FFFFFF</color>
</resources>
EOF
    
    cat > "$theme_dir/AndroidManifest.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.monster.theming.amoled"
    android:versionCode="1"
    android:versionName="1.0">
    
    <overlay
        android:targetPackage="android"
        android:category="android.theme.customization.system_palette"
        android:priority="1" />
    
    <application android:label="AMOLED Black Theme" />
</manifest>
EOF
}

# Main execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    apply_dynamic_theming
fi
