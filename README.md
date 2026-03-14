Simple tool to work with Xiaomi Sideload



Normal uses:
./xiaomi_adb <cmd> <arg>

Termux uses:
termux-usb -E -e "./xiaomi_adb <cmd> <arg>" -r <usb_device_path>

How to flash sideload OTA:

**Option 1: Two-step process (Recommended if phone reboots)**
1. Generate the sign file (`validate.key`):
   `./xiaomi_adb --generate-sign <firmware_path>`
   *(Note: This is mandatory. Without this step, the sideload command will fail with "Sign file not found".)*
2. If the phone reboots, enter Mi-Assistant mode again.
3. Flash the firmware:
   `./xiaomi_adb --sideload <firmware_path>`

**Option 2: Single-step process**
You can also run both commands at once. The tool will automatically generate the sign file first and then proceed to sideload:
`./xiaomi_adb --generate-sign <firmware_path> --sideload <firmware_path>`

While generating the sign, the phone might reboot and you'll need to reboot into Mi-Assistant mode again. This is necessary because in some cases you can't sideload to the device unless you have a fresh connection in sideload mode.

make


