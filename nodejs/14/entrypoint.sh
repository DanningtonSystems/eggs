#!/bin/bash
cd /home/container

# List Node version just 
echo "DanningtonSystems Egg: loading Node.js $(node -v)"

# Replace {{}} with actual variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
