# Copier macserial depuis le volume OPENCORE
cp /Volumes/OPENCORE/OC4VM/tools/macserial ~/Desktop/
chmod +x ~/Desktop/macserial

# Générer 3 paires serial+MLB pour iMac20,1
~/Desktop/macserial -m iMac20,1 -g 3
