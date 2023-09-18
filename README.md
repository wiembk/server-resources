#server-resources


```markdown
# System Usage Data Collection Script

This Bash script collects CPU and RAM usage data on a Linux system and saves it to a CSV file. It uses the `sysstat` package to capture the data at regular intervals.

## Prerequisites

- **sysstat**: The script requires the `sysstat` package to be installed on your system. If it's not already installed, the script will attempt to install it using `apt-get`.

## Usage

1. Clone or download the script to your local machine or server.

2. Make the script executable (if needed):
   ```bash
   chmod +x system_usage_script.sh
   ```

3. Run the script:
   ```bash
   ./system_usage_script.sh
   ```

   The script will:
   - Check if `sysstat` is installed and install it if necessary.
   - Define the duration and interval for data collection (default: 1 hour at 10-second intervals).
   - Create a CSV file named `system_usage_data.csv` to store the collected data.
   - Capture CPU and RAM usage data at the specified intervals and save it to the CSV file.

4. Once the script finishes, you will find the system usage data saved in the `system_usage_data.csv` file in the same directory.

## Data Format

The CSV file contains the following columns:
- `Time`: Timestamp in HH:MM:SS format.
- `CPU(%)`: CPU usage percentage.
- `RAM(%)`: RAM usage percentage.

## Viewing the Data

To view or analyze the collected data, you can use spreadsheet software (e.g., LibreOffice Calc, Microsoft Excel) or data analysis tools. You can also create charts and diagrams to visualize the data.

## License

This script is provided under the [MIT License](LICENSE).
```

This `README.md` file provides an overview of your script, prerequisites, usage instructions, data format, and suggestions for viewing and analyzing the collected data. You can include this `README.md` file with your script when sharing it with others or publishing it on a code repository.
