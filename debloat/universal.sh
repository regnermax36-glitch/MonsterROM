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

# Universal debloating system for MonsterROM
# Works across all platforms (Exynos, Snapdragon, MediaTek)

# Set default debloat profile if not specified
DEBLOAT_PROFILE="${DEBLOAT_PROFILE:-moderate}"

# Initialize debloat arrays
DEBLOAT_LIST=()
SYSTEM_DEBLOAT_LIST=()
VENDOR_DEBLOAT_LIST=()
PRODUCT_DEBLOAT_LIST=()

# Load profile-specific debloat lists
load_debloat_profile() {
    local profile="$1"
    
    case "$profile" in
        "minimal")
            echo "Loading minimal debloat profile..."
            source "$SRC_DIR/debloat/profiles/minimal.sh"
            ;;
        "moderate")
            echo "Loading moderate debloat profile..."
            source "$SRC_DIR/debloat/profiles/moderate.sh"
            ;;
        "aggressive")
            echo "Loading aggressive debloat profile..."
            source "$SRC_DIR/debloat/profiles/aggressive.sh"
            ;;
        "custom")
            echo "Loading custom debloat profile..."
            if [ -f "$SRC_DIR/debloat/profiles/custom.sh" ]; then
                source "$SRC_DIR/debloat/profiles/custom.sh"
            else
                echo "Custom profile not found, falling back to moderate"
                source "$SRC_DIR/debloat/profiles/moderate.sh"
            fi
            ;;
        *)
            echo "Unknown debloat profile: $profile, using moderate"
            source "$SRC_DIR/debloat/profiles/moderate.sh"
            ;;
    esac
}

# Load category-specific debloat lists
load_debloat_categories() {
    local categories_dir="$SRC_DIR/debloat/categories"
    
    # Core categories (always loaded)
    [ -f "$categories_dir/samsung_bloat.sh" ] && source "$categories_dir/samsung_bloat.sh"
    [ -f "$categories_dir/google_apps.sh" ] && source "$categories_dir/google_apps.sh"
    [ -f "$categories_dir/carrier_apps.sh" ] && source "$categories_dir/carrier_apps.sh"
    
    # Optional categories based on profile
    case "$DEBLOAT_PROFILE" in
        "moderate"|"aggressive")
            [ -f "$categories_dir/social_media.sh" ] && source "$categories_dir/social_media.sh"
            [ -f "$categories_dir/gaming_apps.sh" ] && source "$categories_dir/gaming_apps.sh"
            ;;
    esac
    
    case "$DEBLOAT_PROFILE" in
        "aggressive")
            [ -f "$categories_dir/system_apps.sh" ] && source "$categories_dir/system_apps.sh"
            [ -f "$categories_dir/accessibility.sh" ] && source "$categories_dir/accessibility.sh"
            ;;
    esac
}

# Platform-specific debloat loading
load_platform_debloat() {
    local platform="$TARGET_PLATFORM"
    
    if [ -f "$SRC_DIR/platform/$platform/debloat.sh" ]; then
        echo "Loading platform-specific debloat for $platform..."
        source "$SRC_DIR/platform/$platform/debloat.sh"
    else
        echo "No platform-specific debloat found for $platform"
    fi
}

# Device-specific debloat loading
load_device_debloat() {
    local device="$TARGET_CODENAME"
    
    if [ -f "$SRC_DIR/target/$device/debloat.sh" ]; then
        echo "Loading device-specific debloat for $device..."
        source "$SRC_DIR/target/$device/debloat.sh"
    else
        echo "No device-specific debloat found for $device"
    fi
}

# Remove duplicate entries from debloat lists
deduplicate_lists() {
    # Remove duplicates from DEBLOAT_LIST
    if [ ${#DEBLOAT_LIST[@]} -gt 0 ]; then
        readarray -t DEBLOAT_LIST < <(printf '%s\n' "${DEBLOAT_LIST[@]}" | sort -u)
    fi
    
    # Remove duplicates from SYSTEM_DEBLOAT_LIST
    if [ ${#SYSTEM_DEBLOAT_LIST[@]} -gt 0 ]; then
        readarray -t SYSTEM_DEBLOAT_LIST < <(printf '%s\n' "${SYSTEM_DEBLOAT_LIST[@]}" | sort -u)
    fi
    
    # Remove duplicates from VENDOR_DEBLOAT_LIST
    if [ ${#VENDOR_DEBLOAT_LIST[@]} -gt 0 ]; then
        readarray -t VENDOR_DEBLOAT_LIST < <(printf '%s\n' "${VENDOR_DEBLOAT_LIST[@]}" | sort -u)
    fi
    
    # Remove duplicates from PRODUCT_DEBLOAT_LIST
    if [ ${#PRODUCT_DEBLOAT_LIST[@]} -gt 0 ]; then
        readarray -t PRODUCT_DEBLOAT_LIST < <(printf '%s\n' "${PRODUCT_DEBLOAT_LIST[@]}" | sort -u)
    fi
}

# Apply debloat lists
apply_debloat() {
    local work_dir="$WORK_DIR"
    
    echo "Applying universal debloat with profile: $DEBLOAT_PROFILE"
    echo "Target platform: $TARGET_PLATFORM"
    echo "Target device: $TARGET_CODENAME"
    
    # Remove APK packages
    if [ ${#DEBLOAT_LIST[@]} -gt 0 ]; then
        echo "Removing ${#DEBLOAT_LIST[@]} APK packages..."
        for package in "${DEBLOAT_LIST[@]}"; do
            if [ -n "$package" ]; then
                # Find and remove APK files
                find "$work_dir" -name "*${package}*" -type f \( -name "*.apk" -o -name "*.apex" \) -delete 2>/dev/null
                echo "  Removed package: $package"
            fi
        done
    fi
    
    # Remove system apps/directories
    if [ ${#SYSTEM_DEBLOAT_LIST[@]} -gt 0 ]; then
        echo "Removing ${#SYSTEM_DEBLOAT_LIST[@]} system apps/directories..."
        for path in "${SYSTEM_DEBLOAT_LIST[@]}"; do
            if [ -n "$path" ]; then
                full_path="$work_dir$path"
                if [ -e "$full_path" ]; then
                    rm -rf "$full_path"
                    echo "  Removed: $path"
                fi
            fi
        done
    fi
    
    # Remove vendor apps/directories
    if [ ${#VENDOR_DEBLOAT_LIST[@]} -gt 0 ]; then
        echo "Removing ${#VENDOR_DEBLOAT_LIST[@]} vendor apps/directories..."
        for path in "${VENDOR_DEBLOAT_LIST[@]}"; do
            if [ -n "$path" ]; then
                full_path="$work_dir$path"
                if [ -e "$full_path" ]; then
                    rm -rf "$full_path"
                    echo "  Removed: $path"
                fi
            fi
        done
    fi
    
    # Remove product apps/directories
    if [ ${#PRODUCT_DEBLOAT_LIST[@]} -gt 0 ]; then
        echo "Removing ${#PRODUCT_DEBLOAT_LIST[@]} product apps/directories..."
        for path in "${PRODUCT_DEBLOAT_LIST[@]}"; do
            if [ -n "$path" ]; then
                full_path="$work_dir$path"
                if [ -e "$full_path" ]; then
                    rm -rf "$full_path"
                    echo "  Removed: $path"
                fi
            fi
        done
    fi
}

# Generate debloat report
generate_debloat_report() {
    local report_file="$OUT_DIR/debloat_report.txt"
    
    {
        echo "MonsterROM Debloat Report"
        echo "========================="
        echo "Generated: $(date)"
        echo "Profile: $DEBLOAT_PROFILE"
        echo "Platform: $TARGET_PLATFORM"
        echo "Device: $TARGET_CODENAME"
        echo ""
        
        echo "APK Packages Removed (${#DEBLOAT_LIST[@]}):"
        printf '%s\n' "${DEBLOAT_LIST[@]}" | sort
        echo ""
        
        echo "System Apps/Directories Removed (${#SYSTEM_DEBLOAT_LIST[@]}):"
        printf '%s\n' "${SYSTEM_DEBLOAT_LIST[@]}" | sort
        echo ""
        
        echo "Vendor Apps/Directories Removed (${#VENDOR_DEBLOAT_LIST[@]}):"
        printf '%s\n' "${VENDOR_DEBLOAT_LIST[@]}" | sort
        echo ""
        
        echo "Product Apps/Directories Removed (${#PRODUCT_DEBLOAT_LIST[@]}):"
        printf '%s\n' "${PRODUCT_DEBLOAT_LIST[@]}" | sort
        echo ""
        
        echo "Total Items Removed: $((${#DEBLOAT_LIST[@]} + ${#SYSTEM_DEBLOAT_LIST[@]} + ${#VENDOR_DEBLOAT_LIST[@]} + ${#PRODUCT_DEBLOAT_LIST[@]}))"
    } > "$report_file"
    
    echo "Debloat report generated: $report_file"
}

# Main execution
main() {
    echo "Starting universal debloat system..."
    
    # Load debloat configuration
    load_debloat_profile "$DEBLOAT_PROFILE"
    load_debloat_categories
    load_platform_debloat
    load_device_debloat
    
    # Clean up duplicate entries
    deduplicate_lists
    
    # Apply debloat
    apply_debloat
    
    # Generate report
    generate_debloat_report
    
    echo "Universal debloat completed successfully!"
}

# Execute main function if script is run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
