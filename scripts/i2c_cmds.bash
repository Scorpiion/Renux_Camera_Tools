#!/bin/bash

# Test command for i2c bus

echo ""
echo "Scan buses..."

for i in {1..3} ; do
  i2cdetect -y -r $i
done

echo ""
echo "Read register example"
echo "i2cget -f -y 2 0x48 0x000 w"


