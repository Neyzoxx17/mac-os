# Backup du config.plist actuel (le bon, celui d'origine)
cp /Volumes/OPENCORE/EFI/OC/config.plist ~/Desktop/config.plist.original

# Modifier SEULEMENT les valeurs PlatformInfo avec sed
cd /Volumes/OPENCORE/EFI/OC

# Remplacer SystemProductName (dans Generic et SMBIOS)
sudo sed -i '' 's|<string>VMware20,1</string>|<string>iMac20,1</string>|g' config.plist

# Remplacer BIOSVersion
sudo sed -i '' 's|<string>9999.999.999.999.999</string>|<string>2069.0.0.0.0</string>|g' config.plist

# Remplacer MLB (s'il est vide ou VMROjn...)
sudo sed -i '' '/<key>MLB<\/key>/{n;s|<string>[^<]*</string>|<string>C02935400GUGJ9FA5</string>|}' config.plist

# Remplacer SystemSerialNumber
sudo sed -i '' '/<key>SystemSerialNumber<\/key>/{n;s|<string>[^<]*</string>|<string>C02X0YHZJHD3</string>|}' config.plist

# Remplacer SystemUUID
sudo sed -i '' '/<key>SystemUUID<\/key>/{n;s|<string>[^<]*</string>|<string>564D3E57-1234-5678-9ABC-DEF012345678</string>|}' config.plist

# Remplacer ProcessorType dans Generic
sudo sed -i '' '/<key>ProcessorType<\/key>/{n;s|<integer>[^<]*</integer>|<integer>1537</integer>|}' config.plist

echo "=== Config mis à jour ==="
echo "Vérification :"
grep -A1 "SystemProductName" config.plist
grep -A1 "BIOSVersion" config.plist
grep -A1 "MLB" config.plist
grep -A1 "SystemSerialNumber" config.plist
grep -A1 "SystemUUID" config.plist
grep -A1 "ProcessorType" config.plist
