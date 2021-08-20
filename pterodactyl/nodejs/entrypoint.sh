#!/bin/bash
cd /home/container

echo "[EGG]: loading Node.js $(node -v)"

if [[ ! "${STARTUP}" == "/usr/bin/false" ]]; then
    echo "[EGG]: Startup will be automatically disregarded as this egg is hard-set to use entrypoint as a startup script. Please use the configuration variables to run other commands and set the startup command to default."
fi

if [[ "$ENTRYFILE" == "" ]]; then
    echo "[EGG]: No entrypoint file selected. Please configure an entrypoint, then restart the server."
    exit 1
fi

if [[ ! "$GIT_REPOSITORY" == "" ]];
then
    echo "[EGG]: Pulling from Git repository.."
    git config --global pull.rebase false
    git pull "$GIT_REPOSITORY" > /dev/null 
    GIT_STATUS=$?
    if [[ "$GIT_STATUS" == "0" ]]; then
        echo "[EGG]: Pulled from the Git repository successfully."
    else
        echo "[EGG]: The process pulling from the Git repository returned with a non-zero exit code. Please debug for more information."
    fi
else
    echo "[EGG]: No Git repository specified, not pulling from Git.."
fi

echo "[EGG]: Running prerequisite startup commands.."
echo "$STARTUP_PREREQ" | bash -E -

echo "[EGG]: Running yarn install.."
/usr/local/bin/yarn install > /dev/null
YARN_STATUS=$?
if [[ "$YARN_STATUS" == "0" ]]; then
    echo "[EGG]: Installed Yarn packages successfully."
else
    echo "[EGG]: The process installing dependencies with Yarn returned with a non-zero exit code. Please debug for more information."
fi

echo "CSTART"
clear 

echo "[EGG]: Starting app.."
/usr/local/bin/node "$ENTRYFILE"