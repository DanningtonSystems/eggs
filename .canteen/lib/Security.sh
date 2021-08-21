#!/usr/bin/env bash
function Publisher-Warning() {
    if [ "$ProductMaster" = "true" ]; then
        echo "WARNING: Running in publisher mode, CTRL+C if you don't want to continue. Waiting for 5 seconds.."
        sleep 5
    fi
}