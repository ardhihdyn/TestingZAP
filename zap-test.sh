#!/bin/bash

# Configuration
ZAP_PATH="/snap/bin/zaproxy"  # Replace with the actual path to zap.sh
TARGET_URL="http://brainportstg.wpengine.com/"  # Replace with your target URL
REPORT_PATH="report.html"  # Specify the path for the report
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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" # Slack Channel URL
timestamp=$(date '+%s');

# Start ZAP in daemon mode
# $ZAP_PATH -daemon -newsession session -port 8080 -host 127.0.0.1

# Spider the target URL
# $ZAP_PATH -cmd -quickurl $TARGET_URL
$ZAP_PATH -quickurl "$TARGET_URL" -newsession "$timestamp" -cmd;

# Wait for the spider to finish (adjust sleep duration as needed)
# sleep 30

# Passive scan (optional, uncomment if needed)
# $ZAP_PATH -cmd -quickscan $TARGET_URL

# Active scan
# $ZAP_PATH -cmd -quickspider $TARGET_URL
# $ZAP_PATH -cmd -quickscan $TARGET_URL

# Defining variables that contain metadata for the report
report_name="Vulnerability Report - $TARGET_URL"
prepared_by="h4x0r"
prepared_for="X Corp"
scan_date=$(date -d @$timestamp)
report_date=$(date -d @$timestamp)
scan_version="N/A"
report_version="N/A"
report_description="Home page vulnerability report of the Example project."
file_name="$timestamp"

# Generate an HTML report
# $ZAP_PATH -cmd -report $REPORT_PATH -source $TARGET_URL

# Getting the report generated in XHTML format
$ZAP_PATH -export_report "$HOME"/"$file_name".xhtml -source_info "$report_title;$prepared_by;$prepared_for;$scan_date;$report_date;$scan_version;$report_version;$report_description" -alert_severity "t;t;f;t" -alert_details "t;t;t;t;t;t;f;f;f;f" -session "$timestamp.session" -cm

# Send Report into Slack
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"ZAP Scan Report for $TARGET_URL\",\"attachments\":[{\"title\":\"Report\",\"text\":\"<!here>\",\"color\":\"good\"} ]}" $SLACK_WEBHOOK_URL

# Shutdown ZAP
# $ZAP_PATH -cmd -shutdown
