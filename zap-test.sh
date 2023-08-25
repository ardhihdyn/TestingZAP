#!/bin/bash

# Configuration
ZAP_PATH="/usr/bin/zap.sh"  # Replace with the actual path to zap.sh
TARGET_URL="http://brainportstg.wpengine.com/"  # Replace with your target URL
REPORT_PATH="report.html"  # Specify the path for the report

# Start ZAP in daemon mode
$ZAP_PATH -daemon -port 8080 -host 0.0.0.0

# Spider the target URL
$ZAP_PATH -cmd -quickurl $TARGET_URL

# Wait for the spider to finish (adjust sleep duration as needed)
sleep 30

# Passive scan (optional, uncomment if needed)
# $ZAP_PATH -cmd -quickscan $TARGET_URL

# Active scan
$ZAP_PATH -cmd -quickspider $TARGET_URL
$ZAP_PATH -cmd -quickscan $TARGET_URL

# Generate an HTML report
$ZAP_PATH -cmd -report $REPORT_PATH -source $TARGET_URL

# Shutdown ZAP
$ZAP_PATH -cmd -shutdown
