#!/bin/bash

# Set your target URL
TARGET_URL="http://brainportstg.wpengine.com/"

# Start ZAP in daemon mode
/snap/bin/zaproxy -daemon -port 9090

# Perform a spider scan
zap-cli --zap-url http://localhost:9090 -p 9090 spider $TARGET_URL

# Wait for the spider to finish (you may need to adjust this duration)
sleep 30

# Perform an active scan
zap-cli --zap-url http://localhost:9090 -p 9090 active-scan $TARGET_URL

# Generate a report (HTML or other formats)
zap-cli --zap-url http://localhost:9090 -p 9090 report -o /path/to/report.html -f html

# Shut down ZAP
zap-cli --zap-url http://localhost:9090 -p 9090 shutdown
