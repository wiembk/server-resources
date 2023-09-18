#!/bin/bash

# Check if sysstat is installed, and if not, install it
if ! command -v sar &>/dev/null; then
    echo "sysstat package not found. Installing..."
    sudo apt-get update
    sudo apt-get install sysstat
fi

# Define the duration in seconds (1 hour = 3600 seconds)
duration=3600

# Define the interval in seconds (e.g., every 10 seconds)
interval=10

# Define the CSV file name
csv_file="system_usage_data.csv"

# Start time
start_time=$(date +%s)

# End time
end_time=$((start_time + duration))

# Write the CSV header
echo "Time,CPU(%),RAM(%)" > "$csv_file"

while [ "$(date +%s)" -lt "$end_time" ]; do
    # Get the current time (formatted as HH:MM:SS)
    current_time=$(date +%T)

    # Use sar to capture CPU usage data and extract the CPU idle percentage
    cpu_idle=$(sar -u $interval 1 | tail -n 1 | awk '{print $NF}')

    # Calculate CPU usage percentage (100 - CPU idle percentage)
    cpu_usage=$(awk -v idle="$cpu_idle" 'BEGIN {print 100 - idle}')

    # Use sar to capture memory (RAM) usage data and extract the RAM usage percentage
    ram_usage=$(sar -r $interval 1 | tail -n 1 | awk '{print $NF}')

    # Append the values to the CSV file
    echo "$current_time,$cpu_usage,$ram_usage" >> "$csv_file"

    # Sleep for the specified interval
    sleep $interval
done

echo "System usage data saved to $csv_file"

