python3 << 'EOF'
import plistlib, shutil

src = '/Volumes/OPENCORE/EFI/OC/config.plist'
shutil.copy(src, src + '.bak3')

with open(src, 'rb') as f:
    plist = plistlib.load(f)

# Generic
g = plist.get('PlatformInfo', {}).get('Generic', {})
g['MLB'] = 'C02935400GUGJ9FA5'
g['ProcessorType'] = 1537
g['SystemProductName'] = 'iMac20,1'
g['SystemSerialNumber'] = 'C02X0YHZJHD3'
g['SystemUUID'] = '564D3E57-1234-5678-9ABC-DEF012345678'

# SMBIOS
s = plist.get('PlatformInfo', {}).get('SMBIOS', {})
s['SystemProductName'] = 'iMac20,1'
s['SystemSerialNumber'] = 'C02X0YHZJHD3'
s['SystemUUID'] = '564D3E57-1234-5678-9ABC-DEF012345678'
s['ProcessorType'] = 0
s['SystemFamily'] = 'iMac'
s['SystemManufacturer'] = 'Apple Inc.'

with open(src, 'wb') as f:
    plistlib.dump(plist, f)

print('OK - Fichier mis à jour !')
print()
with open(src, 'rb') as f:
    p = plistlib.load(f)
g2 = p['PlatformInfo']['Generic']
s2 = p['PlatformInfo']['SMBIOS']
print(f'Generic MLB: {g2["MLB"]}')
print(f'Generic ProcType: {g2["ProcessorType"]}')
print(f'Generic Model: {g2["SystemProductName"]}')
print(f'Generic Serial: {g2["SystemSerialNumber"]}')
print(f'Generic UUID: {g2["SystemUUID"]}')
print(f'SMBIOS Model: {s2["SystemProductName"]}')
EOF
