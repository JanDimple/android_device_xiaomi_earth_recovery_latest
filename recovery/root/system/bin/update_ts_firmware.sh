#!/system/bin/sh

# chipone touchscreen firmware
chipone_fw_path=/vendor/firmware/ICNL9916.bin
chipone_cts_firmware=/sys/chipone-tddi/cts_firmware

sleep 2

# update touchscreen firmware from file
echo $chipone_fw_path > $chipone_cts_firmware/update_from_file