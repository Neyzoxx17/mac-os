python3 << 'EOF'
import plistlib, shutil

src = '/Volumes/OPENCORE/EFI/OC/config.plist'

with open(src, 'rb') as f:
    plist = plistlib.load(f)

g = plist['PlatformInfo']['Generic']
g['MLB'] = 'C022371044NPHC1JC'
g['SystemSerialNumber'] = 'C02JDCYSPN5T'

s = plist['PlatformInfo']['SMBIOS']
s['SystemSerialNumber'] = 'C02JDCYSPN5T'

with open(src, 'wb') as f:
    plistlib.dump(plist, f)

print('OK - Serial + MLB mis à jour !')
print(f'Serial: {g["SystemSerialNumber"]}')
print(f'MLB: {g["MLB"]}')
EOF
