FDEVICE="earth"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export PLATFORM_VERSION="16.1.0"
	export PLATFORM_SECURITY_PATCH="2099-12-31"
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export FOX_AB_DEVICE=1
	export OF_USE_GREEN_LED=0
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export OF_USE_MAGISKBOOT=1
	export OF_USE_NEW_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;"
	export OF_PATCH_AVB20=1
	export FOX_DELETE_AROMAFM=1
	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1510672800"; # Tue Nov 14 15:20:00 GMT 2017
	export FOX_ENABLE_APP_MANAGER=0
	export FOX_DISABLE_APP_MANAGER=1
    export FOX_DELETE_MAGISK_ADDON=1

    # use system (ROM) fingerprint where available
    export OF_USE_SYSTEM_FINGERPRINT=1

	# OTA for custom ROMs
	export OF_KEEP_DM_VERITY=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1

    # -- add settings for build version --
    export FOX_VERSION="OFOX-12.1"
    export OF_MAINTAINER="ARUN V"
    export FOX_BUILD_TYPE="Unofficial"

    # screen settings
	export OF_SCREEN_H=1650
	export OF_STATUS_H=80
	# We don't have physical buttons
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_CLOCK_POS=1
	export OF_HIDE_NOTCH=0

	# run a process after formatting data to work-around MTP issues
	export OF_RUN_POST_FORMAT_PROCESS=1
	export OF_SKIP_ORANGEFOX_PROCESS=1

	export OF_FL_PATH1="/sys/class/leds/flashlight/brightness"
    export OF_FLASHLIGHT_ENABLE=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi