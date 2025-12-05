#!/bin/bash

# List of container names to monitor
CONTAINERS=("latest" "def" "Abc")   # <-- update names here

while true; do
    sleep 10

    for CONTAINER in "${CONTAINERS[@]}"; do

        # Check if container is running
        if ! docker ps --format '{{.Names}}' | grep -wq "$CONTAINER"; then
            echo "$(date): $CONTAINER is NOT running. Restarting..."
            docker start "$CONTAINER" >/dev/null 2>&1

            if [ $? -eq 0 ]; then
                echo "$(date): Successfully restarted $CONTAINER."
            else
                echo "$(date): Failed to restart $CONTAINER!"
            fi
        else
            echo "$(date): $CONTAINER is running."
        fi

    done

done
