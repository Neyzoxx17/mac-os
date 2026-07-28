python3 << 'EOF'
import plistlib

p = plistlib.loads(open('/Volumes/OPENCORE/EFI/OC/config.plist', 'rb').read())
g = p['PlatformInfo']['Generic']
s = p.get('PlatformInfo', {}).get('SMBIOS', {})

print(f"Model:          {g.get('SystemProductName', 'N/A')}")
print(f"Serial:         {g.get('SystemSerialNumber', 'N/A')}")
print(f"MLB:            {g.get('MLB', 'N/A')}")
print(f"UUID:           {g.get('SystemUUID', 'N/A')}")
print(f"ROM:            {g.get('ROM', b'').hex()}")
print(f"ProcessorType:  {s.get('ProcessorType', 'N/A')}")
print(f"BIOSVersion:    {s.get('BIOSVersion', 'N/A')}")
print(f"SystemFamily:   {s.get('SystemFamily', 'N/A')}")
print(f"BoardProduct:   {s.get('BoardProduct', 'N/A')}")

for section in ['Kernel', 'ACPI', 'Booter', 'UEFI']:
    if section in p:
        print(f"\n[{section}] present ({len(p[section])} cles)")
    else:
        print(f"\n[{section}] MANQUANT")
EOF
