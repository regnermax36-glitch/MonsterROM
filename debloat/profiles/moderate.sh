#!/usr/bin/env bash
#
# Copyright (C) 2025 MonsterROM Team
#
# Moderate debloat profile - Balanced approach
# Removes common bloatware while preserving essential functionality
#

# Samsung bloatware (moderate removal)
DEBLOAT_LIST+=(
    # Samsung apps that most users don't need
    "com.samsung.android.bixby.agent"
    "com.samsung.android.bixby.service"
    "com.samsung.android.bixby.wakeup"
    "com.samsung.android.visionintelligence"
    "com.samsung.android.bixbyvision.framework"
    "com.samsung.systemui.bixby2"
    
    # Samsung duplicate apps
    "com.samsung.android.email.provider"
    "com.samsung.android.messaging"
    "com.samsung.android.dialer"
    "com.samsung.android.contacts"
    
    # Samsung services (non-essential)
    "com.samsung.android.smartmirroring"
    "com.samsung.android.beaconmanager"
    "com.samsung.android.service.peoplestripe"
    "com.samsung.android.smartswitchassistant"
    "com.samsung.android.oneconnect"
    "com.samsung.android.mdx"
    "com.samsung.android.mdx.kit"
    "com.samsung.android.mdx.quickboard"
    
    # Samsung entertainment apps
    "com.samsung.android.game.gamehome"
    "com.samsung.android.game.gametools"
    "com.samsung.android.gametuner"
    "com.samsung.android.themestore"
    "com.samsung.android.themecenter"
    "com.samsung.android.wallpaper.res"
    
    # Samsung productivity apps (optional)
    "com.samsung.android.app.notes"
    "com.samsung.android.app.reminder"
    "com.samsung.voicerecorder"
    "com.samsung.android.app.memo"
    
    # Samsung health and fitness
    "com.sec.android.app.shealth"
    "com.samsung.health"
    "com.samsung.android.service.health"
    
    # Samsung AR and VR
    "com.samsung.android.ardrawing"
    "com.samsung.android.aremoji"
    "com.samsung.android.arzone"
    "com.samsung.android.livestickers"
    
    # Samsung Kids mode
    "com.samsung.android.kidsinstaller"
    "com.samsung.android.app.camera.sticker.facear"
    
    # Samsung DeX (keep if using DeX)
    # "com.sec.android.desktopmode.uiservice"
    # "com.samsung.desktopsystemui"
)

# Google apps (moderate removal)
DEBLOAT_LIST+=(
    # Google apps that can be replaced
    "com.google.android.music"
    "com.google.android.videos"
    "com.google.android.apps.books"
    "com.google.android.apps.magazines"
    "com.google.android.apps.podcasts"
    
    # Google productivity (optional)
    "com.google.android.apps.docs"
    "com.google.android.apps.docs.editors.docs"
    "com.google.android.apps.docs.editors.sheets"
    "com.google.android.apps.docs.editors.slides"
    "com.google.android.keep"
    
    # Google social and communication
    "com.google.android.apps.plus"
    "com.google.android.talk"
    "com.google.android.apps.messaging"
    
    # Google entertainment
    "com.google.android.apps.youtube.music"
    "com.google.android.apps.youtube.creator"
    "com.google.android.apps.youtube.kids"
    
    # Google utilities (optional)
    "com.google.android.apps.wellbeing"
    "com.google.android.apps.restore"
    "com.google.android.apps.turbo"
    "com.google.android.partnersetup"
    "com.google.android.setupwizard"
)

# Microsoft apps
DEBLOAT_LIST+=(
    "com.microsoft.office.excel"
    "com.microsoft.office.powerpoint"
    "com.microsoft.office.word"
    "com.microsoft.office.outlook"
    "com.microsoft.skydrive"
    "com.microsoft.teams"
    "com.microsoft.launcher"
)

# Facebook/Meta apps
DEBLOAT_LIST+=(
    "com.facebook.katana"
    "com.facebook.orca"
    "com.instagram.android"
    "com.whatsapp"
    "com.facebook.services"
    "com.facebook.system"
    "com.facebook.appmanager"
)

# Other social media
DEBLOAT_LIST+=(
    "com.twitter.android"
    "com.snapchat.android"
    "com.zhiliaoapp.musically"  # TikTok
    "com.ss.android.ugc.trill"  # TikTok Lite
    "com.linkedin.android"
    "com.pinterest"
    "com.reddit.frontpage"
)

# Carrier bloatware (common)
DEBLOAT_LIST+=(
    # Verizon
    "com.verizon.mips.services"
    "com.verizon.services"
    "com.vzw.hss.myverizon"
    "com.verizon.llkagent"
    "com.verizon.obdm_permissions"
    
    # AT&T
    "com.att.myWireless"
    "com.att.tv"
    "com.att.iqi"
    "com.att.dh"
    
    # T-Mobile
    "com.tmobile.pr.adapt"
    "com.tmobile.services.nameid"
    "com.tmobile.echolocate"
    
    # Sprint
    "com.sprint.ms.cdm"
    "com.sprint.ms.smf.services"
    "com.sprint.w.installer"
    
    # Generic carrier apps
    "com.carrieriq.iqagent"
    "com.iqvia.onekey.android"
    "com.motricity.verizon.ssoengine"
)

# Gaming apps (moderate removal)
DEBLOAT_LIST+=(
    "com.king.candycrushsaga"
    "com.king.candycrushsodasaga"
    "com.supercell.clashofclans"
    "com.supercell.clashroyale"
    "com.rovio.angrybirds"
    "com.ea.games.r3_row"
    "com.gameloft.android"
    "com.miniclip.eightballpool"
)

# System apps (careful removal)
SYSTEM_DEBLOAT_LIST+=(
    # Samsung system apps
    "/system/app/SamsungBilling"
    "/system/app/SamsungPay"
    "/system/app/SamsungPayStub"
    "/system/app/SamsungMembers"
    "/system/app/SamsungGlobalGoals"
    "/system/app/SamsungDaily"
    "/system/app/SamsungFreeform"
    "/system/app/SamsungCloudSync"
    "/system/app/SamsungAccount"
    "/system/app/SamsungApps"
    "/system/app/SamsungTTS"
    "/system/app/SamsungPositioning"
    "/system/app/SamsungConnect"
    "/system/app/SamsungSmartThings"
    
    # Bixby related
    "/system/app/Bixby"
    "/system/app/BixbyService"
    "/system/app/BixbyWakeup"
    "/system/app/BixbyVision"
    "/system/priv-app/Bixby"
    "/system/priv-app/BixbyService"
    
    # Samsung entertainment
    "/system/app/GameHome"
    "/system/app/GameTools"
    "/system/app/GameOptimizingService"
    "/system/app/SamsungMusic"
    "/system/app/SamsungVideo"
    "/system/app/SamsungGallery"
    "/system/app/SamsungNotes"
    "/system/app/SamsungReminder"
    "/system/app/SamsungVoiceRecorder"
    
    # Samsung AR/VR
    "/system/app/ARDrawing"
    "/system/app/AREmoji"
    "/system/app/ARZone"
    "/system/app/LiveStickers"
    
    # Samsung Kids
    "/system/app/KidsInstaller"
    "/system/app/KidsHome"
    "/system/app/KidsMode"
    
    # Google system apps
    "/system/app/GoogleMusic"
    "/system/app/GoogleVideos"
    "/system/app/GoogleBooks"
    "/system/app/GoogleMagazines"
    "/system/app/GooglePodcasts"
    "/system/app/GoogleDocs"
    "/system/app/GoogleSheets"
    "/system/app/GoogleSlides"
    "/system/app/GoogleKeep"
    "/system/app/GoogleDuo"
    "/system/app/GoogleTalk"
    "/system/app/YouTubeMusic"
    "/system/app/YouTubeCreator"
    "/system/app/YouTubeKids"
    
    # Microsoft system apps
    "/system/app/Excel"
    "/system/app/PowerPoint"
    "/system/app/Word"
    "/system/app/Outlook"
    "/system/app/OneDrive"
    "/system/app/Teams"
    "/system/app/MSLauncher"
    
    # Social media system apps
    "/system/app/Facebook"
    "/system/app/FacebookMessenger"
    "/system/app/Instagram"
    "/system/app/WhatsApp"
    "/system/app/Twitter"
    "/system/app/Snapchat"
    "/system/app/TikTok"
    "/system/app/LinkedIn"
    "/system/app/Pinterest"
    "/system/app/Reddit"
)

# Vendor apps (moderate removal)
VENDOR_DEBLOAT_LIST+=(
    # Samsung vendor apps
    "/vendor/app/SamsungBilling"
    "/vendor/app/SamsungPay"
    "/vendor/app/SamsungMembers"
    "/vendor/app/SamsungAccount"
    "/vendor/app/SamsungApps"
    "/vendor/app/SamsungConnect"
    "/vendor/app/SamsungSmartThings"
    
    # Bixby vendor
    "/vendor/app/Bixby"
    "/vendor/app/BixbyService"
    "/vendor/app/BixbyWakeup"
    "/vendor/app/BixbyVision"
    
    # Samsung entertainment vendor
    "/vendor/app/GameHome"
    "/vendor/app/GameTools"
    "/vendor/app/SamsungMusic"
    "/vendor/app/SamsungVideo"
    "/vendor/app/SamsungGallery"
    
    # Google vendor apps
    "/vendor/app/GoogleMusic"
    "/vendor/app/GoogleVideos"
    "/vendor/app/GoogleBooks"
    "/vendor/app/GoogleDocs"
    "/vendor/app/YouTubeMusic"
    
    # Social media vendor
    "/vendor/app/Facebook"
    "/vendor/app/Instagram"
    "/vendor/app/WhatsApp"
    "/vendor/app/Twitter"
)

# Product apps (moderate removal)
PRODUCT_DEBLOAT_LIST+=(
    # Samsung product apps
    "/product/app/SamsungBilling"
    "/product/app/SamsungPay"
    "/product/app/SamsungMembers"
    "/product/app/SamsungAccount"
    "/product/app/SamsungApps"
    
    # Google product apps
    "/product/app/GoogleMusic"
    "/product/app/GoogleVideos"
    "/product/app/GoogleBooks"
    "/product/app/GoogleDocs"
    "/product/app/YouTubeMusic"
    
    # Microsoft product apps
    "/product/app/Excel"
    "/product/app/PowerPoint"
    "/product/app/Word"
    "/product/app/Outlook"
    "/product/app/OneDrive"
    
    # Social media product apps
    "/product/app/Facebook"
    "/product/app/Instagram"
    "/product/app/WhatsApp"
    "/product/app/Twitter"
    "/product/app/Snapchat"
    "/product/app/TikTok"
)

echo "Moderate debloat profile loaded - balanced removal of bloatware"
