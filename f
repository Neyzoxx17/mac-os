# Créer le nouveau config.plist avec les bonnes valeurs
cat > /tmp/config_new.plist << 'ENDOFPLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>AdviseFeatures</key>
	<false/>
	<key>CustomMemory</key>
	<false/>
	<key>Generic</key>
	<dict>
		<key>AdviseFeatures</key>
		<false/>
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
	<key>SMBIOS</key>
	<dict>
		<key>BIOSReleaseDate</key>
		<string>03/03/2025</string>
		<key>BIOSVendor</key>
		<string>Apple Inc.</string>
		<key>BIOSVersion</key>
		<string>2069.0.0.0.0</string>
		<key>PlatformFeature</key>
		<integer>32</integer>
		<key>ProcessorType</key>
		<integer>0</integer>
		<key>SmcVersion</key>
		<data></data>
		<key>SystemFamily</key>
		<string>iMac</string>
		<key>SystemManufacturer</key>
		<string>Apple Inc.</string>
		<key>SystemProductName</key>
		<string>iMac20,1</string>
		<key>SystemSerialNumber</key>
		<string>C02X0YHZJHD3</string>
		<key>SystemUUID</key>
		<string>564D3E57-1234-5678-9ABC-DEF012345678</string>
		<key>SystemVersion</key>
		<string>1.0</string>
	</dict>
	<key>UpdateDataHub</key>
	<true/>
	<key>UpdateNVRAM</key>
	<true/>
	<key>UpdateSMBIOS</key>
	<true/>
	<key>UpdateSMBIOSMode</key>
	<string>Create</string>
</dict>
</plist>
ENDOFPLIST

# Vérifier que le fichier a été créé
echo "Fichier créé : $(wc -c < /tmp/config_new.plist) bytes"

# Remplacer le fichier sur le volume OPENCORE
sudo cp /tmp/config_new.plist /Volumes/OPENCORE/EFI/OC/config.plist

# Vérifier le remplacement
echo "Nouveau fichier : $(wc -c < /Volumes/OPENCORE/EFI/OC/config.plist) bytes"

echo ""
echo "=== CONFIG MISE A JOUR ==="
echo "Redémarre la VM pour appliquer les changements."
