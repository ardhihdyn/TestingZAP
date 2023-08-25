#!/bin/bash

# Set your target URL
TARGET_URL="http://brainportstg.wpengine.com/"

# Start ZAP in daemon mode
/usr/local/bin/zap.sh -daemon -port 8080

# Perform a spider scan
/usr/local/bin/zap-cli --zap-url http://localhost:8080 -p 8080 spider $TARGET_URL

# Wait for the spider to finish (you may need to adjust this duration)
sleep 30

# Perform an active scan
/usr/local/bin/zap-cli --zap-url http://localhost:8080 -p 8080 active-scan $TARGET_URL

# Generate a report (HTML or other formats)
/usr/local/bin/zap-cli --zap-url http://localhost:8080 -p 8080 report -o /path/to/report.html -f html

# Shut down ZAP
/usr/local/bin/zap-cli --zap-url http://localhost:8080 -p 8080 shutdown