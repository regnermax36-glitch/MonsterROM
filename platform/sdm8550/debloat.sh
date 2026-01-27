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

# Debloat list for the Snapdragon 8550 platform

# Snapdragon-specific bloatware
DEBLOAT_LIST+=(
    # Qualcomm-specific services that can be safely removed
    "com.qualcomm.qti.services.systemhelper"
    "com.qualcomm.qti.services.secureui"
    "com.qualcomm.qti.workloadclassifier"
    "com.qualcomm.qti.poweroffalarm"
    "com.qualcomm.qti.telephonyservice"
    "com.qualcomm.qti.uceShimService"
    "com.qualcomm.qti.uim"
    "com.qualcomm.qti.qms.service.connectionsecurity"
    "com.qualcomm.qti.qms.service.telemetry"
    "com.qualcomm.qti.qms.service.trustzoneaccess"
    
    # Snapdragon-specific camera services (keep essential ones)
    "com.qualcomm.qti.camerapostproc"
    "com.qualcomm.qti.camerax.extensions"
    
    # Adreno GPU services (keep essential ones, remove telemetry)
    "com.qualcomm.qti.gpudrivers.kona.api30"
    "com.qualcomm.qti.gpudrivers.lahaina.api30"
    
    # Qualcomm connectivity services (optional)
    "com.qualcomm.qti.dpm"
    "com.qualcomm.qti.dynamicddsservice"
    "com.qualcomm.qti.ims"
    "com.qualcomm.qti.imscmservice"
    "com.qualcomm.qti.lpa"
    "com.qualcomm.qti.ltebc"
    "com.qualcomm.qti.ltedirect"
    
    # Qualcomm audio services (keep essential ones)
    "com.qualcomm.qti.audioeffects"
    "com.qualcomm.qti.bluetooth.a2dp"
    "com.qualcomm.qti.bluetooth.aptx"
    "com.qualcomm.qti.bluetooth.aptxhd"
    
    # Qualcomm performance services (optional, may affect performance)
    "com.qualcomm.qti.performancemode"
    "com.qualcomm.qti.qcolor"
    "com.qualcomm.qti.qfp"
    
    # Qualcomm security services (be careful with these)
    "com.qualcomm.qti.auth.fidocryptosample"
    "com.qualcomm.qti.biometrics.fingerprint.service"
    "com.qualcomm.qti.biometrics.voiceprint.service"
    
    # Qualcomm system services (optional)
    "com.qualcomm.qti.remoteSimlockAuth"
    "com.qualcomm.qti.simsettings"
    "com.qualcomm.qti.smcinvokepkgmgr"
    "com.qualcomm.qti.sva"
    "com.qualcomm.qti.vzw_msdc_api"
    "com.qualcomm.qti.workloadclassifier"
    
    # Qualcomm location services (optional)
    "com.qualcomm.location"
    "com.qualcomm.location.XT"
    "com.qualcomm.location.fused"
    "com.qualcomm.location.geocoder"
    "com.qualcomm.location.izat.provider"
    
    # Qualcomm Wi-Fi services (keep essential ones)
    "com.qualcomm.qti.networksetting"
    "com.qualcomm.qti.server.wifilearner"
    "com.qualcomm.qti.wifilearner"
    
    # Additional Snapdragon bloatware
    "com.qti.dpmserviceapp"
    "com.qti.qualcomm.datastatusnotification"
    "com.qti.service.colorservice"
    "com.qti.snapdragon.qdcm"
    "com.qti.xdivert"
    
    # Carrier-specific Qualcomm services
    "com.android.carrierdefaultapp"
    "com.android.stk"
    "com.android.stk2"
    
    # Qualcomm diagnostic and testing apps
    "com.qualcomm.qti.callenhancement"
    "com.qualcomm.qti.callfeaturessetting"
    "com.qualcomm.qti.devicestatisticsservice"
    "com.qualcomm.qti.modemtestmode"
    "com.qualcomm.qti.radioconfiginterface"
    "com.qualcomm.qti.radioconfig"
    "com.qualcomm.qti.radioconfigtest"
    "com.qualcomm.qti.rcsbootstraputil"
    "com.qualcomm.qti.rcsimsbootstraputil"
    "com.qualcomm.qti.rcsimssettings"
    "com.qualcomm.qti.rcsservice"
    "com.qualcomm.qti.roamingsettings"
    "com.qualcomm.qti.telephonyservice"
    "com.qualcomm.qti.uimremoteclient"
    "com.qualcomm.qti.uimremoteserver"
    "com.qualcomm.qti.vzw_msdc_api"
)

# Platform-specific system apps to debloat
SYSTEM_DEBLOAT_LIST+=(
    # Snapdragon-specific system services
    "/system/app/QtiTelephonyService"
    "/system/app/uceShimService"
    "/system/app/uimremoteclient"
    "/system/app/uimremoteserver"
    "/system/app/QComQMIPermissions"
    "/system/app/CNEService"
    "/system/app/datastatusnotification"
    "/system/app/embms"
    "/system/app/ims"
    "/system/app/imssettings"
    "/system/app/QtiTelephonyService"
    "/system/app/radioconfig"
    "/system/app/rcsservice"
    "/system/app/uceShimService"
    "/system/app/uimremoteclient"
    "/system/app/uimremoteserver"
    "/system/app/vzw_msdc_api"
    
    # Snapdragon performance and GPU related
    "/system/app/QcomQMIPermissions"
    "/system/app/TimeService"
    "/system/app/QtiSystemService"
    
    # Snapdragon connectivity
    "/system/app/CNEService"
    "/system/app/datastatusnotification"
    "/system/app/QtiTelephonyService"
    
    # Optional: Remove if not needed
    "/system/priv-app/qcrilmsgtunnel"
    "/system/priv-app/CNEService"
    "/system/priv-app/dpmserviceapp"
)

# Vendor debloat for Snapdragon
VENDOR_DEBLOAT_LIST+=(
    # Qualcomm vendor services
    "/vendor/app/QtiTelephonyService"
    "/vendor/app/uceShimService"
    "/vendor/app/ims"
    "/vendor/app/imssettings"
    "/vendor/app/radioconfig"
    "/vendor/app/rcsservice"
    "/vendor/app/TimeService"
    "/vendor/app/CNEService"
    "/vendor/app/datastatusnotification"
    "/vendor/app/embms"
    "/vendor/app/QComQMIPermissions"
    "/vendor/app/qcrilmsgtunnel"
    "/vendor/app/uimremoteclient"
    "/vendor/app/uimremoteserver"
    "/vendor/app/vzw_msdc_api"
    
    # Qualcomm diagnostic tools
    "/vendor/app/QdcmFF"
    "/vendor/app/colorservice"
    "/vendor/app/dpmserviceapp"
    "/vendor/app/qdcm"
    "/vendor/app/xdivert"
    
    # Qualcomm location services (optional)
    "/vendor/app/com.qualcomm.location"
    "/vendor/app/com.qualcomm.location.XT"
    "/vendor/app/izat.xt.srv"
    "/vendor/app/LocationAPI"
    "/vendor/app/lowi"
    "/vendor/app/slim_daemon"
    "/vendor/app/xtra_t_app"
    
    # Qualcomm audio (keep essential ones)
    "/vendor/app/AudioEffectService"
    "/vendor/app/QtiAudioEffects"
    
    # Qualcomm camera (keep essential ones)
    "/vendor/app/CameraPostProc"
    "/vendor/app/QtiCameraExtensions"
)

echo "Snapdragon 8550 platform debloat list loaded"
