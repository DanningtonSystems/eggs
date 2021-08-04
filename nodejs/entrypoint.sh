#!/bin/bash
cd /home/container

echo "[EGG]: loading Node.js $(node -v)"

if [[ ! "${STARTUP}" == "/usr/bin/false" ]]; then
    echo "[EGG]: Startup will be automatically disregarded as this egg is hard-set to use entrypoint as a startup script. Please use the configuration variables to run other commands and set the startup command to default."
fi

if [[ ! "$GIT_REPOSITORY" == "" ]];
then
    echo "[EGG]: Pulling from Git repository.."
    git pull "$GIT_REPOSITORY"
    echo "[EGG]: Ran git pull from the repository"
fi

echo "[EGG]: Running prerequisite startup commands.."
echo "$STARTUP_PREREQ" | bash -E -

echo "[EGG]: Running yarn install.."
/usr/local/bin/yarn install

echo "[EGG]: Starting app.."
/usr/local/bin/node "$ENTRYFILE"