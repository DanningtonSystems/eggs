#!/bin/bash
cd /home/container

echo "[EGG]: loading Node.js $(node -v)"

if [[ ! "${STARTUP}" == "/usr/bin/false" ]]; then
    echo "[EGG]: Custom startup command found, running that instead.."
    # run the custom startup command
    eval "${STARTUP}"
    exit 0
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

if [[ "$ENTRYFILE" == "" ]]; then
    # check if fallback.sh exists
    if [[ -f "/home/container/fallback.sh" ]]; then
        echo "[EGG]: No entrypoint file selected, but a fallback.sh was found. Running that instead.."
        # copy to /tmp with custom date
        cp /home/container/fallback.sh /tmp/fallback-$(date +%s).sh
        # chmod +x the file
        chmod +x /tmp/fallback-$(date +%s).sh
        # run the fallback script
        /tmp/fallback-$(date +%s).sh
        exit 0
    else 
        echo "[EGG]: No entrypoint file selected, no fallback.sh found, and no override startup command. Please configure an entrypoint, then restart the server."
        exit 1
    fi
fi

echo "[EGG]: Running prerequisite startup commands.."
echo "$STARTUP_PREREQ" | bash -E -

echo "[EGG]: Running yarn install.."
/usr/local/bin/yarn install --non-interactive --silent --frozen-lockfile --no-lockfile > /dev/null
YARN_STATUS=$?
if [[ "$YARN_STATUS" == "0" ]]; then
    echo "[EGG]: Installed Yarn packages successfully."
else
    echo "[EGG]: The process installing dependencies with Yarn returned with a non-zero exit code. Please debug for more information."
fi

echo "CSTART"
clear 

echo "[EGG]: Starting app (running Node $(/usr/local/bin/node -v)).."
/usr/local/bin/node "$ENTRYFILE"