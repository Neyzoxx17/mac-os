# Vérifier que le volume OPENCORE est monté
ls /Volumes/OPENCORE/

# Copier le config.plist original pour backup
cp /Volumes/OPENCORE/EFI/OC/config.plist ~/config.plist.backup

# Créer le nouveau config.plist avec les bonnes valeurs
cat > /tmp/config_smbios.plist << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>PlatformInfo</key>
    <dict>
        <key>Generic</key>
        <dict>
            <key>MLB</key>
            <string>C02935400GUGJ9FA5</string>
            <key>MaxBIOSVersion</key>
            <true/>
            <key>ProcessorType</key>
            <integer>1537</integer>
            <key>ROM</key>
            <string>AA223344</string>
            <key>SpoofVendor</key>
            <true/>
            <key>SystemMemoryStatus</key>
            <string>Auto</string>
            <key>SystemProductName</key>
            <string>iMac20,1</string>
            <key>SystemSerialNumber</key>
            <string>C02X0YHZJHD3</string>
            <key>SystemUUID</key>
            <string>564D3E57-1234-5678-9ABC-DEF012345678</string>
        </dict>
    </dict>
</dict>
</plist>
PLIST

# Remplacer le config.plist (nécessite sudo)
sudo cp /tmp/config_smbios.plist /Volumes/OPENCORE/EFI/OC/config.plist
