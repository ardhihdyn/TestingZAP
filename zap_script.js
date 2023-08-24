// Sample ZAP automation script (zap_script.js)
const ZAP_API_BASE = 'http://localhost:8080/JSON/';

// Start ZAP session
fetch(ZAP_API_BASE + 'core/action/newSession/?name=mySession', { method: 'POST' });

// Spider the target URL
fetch(ZAP_API_BASE + 'spider/action/scan/?url=https://brainportstg.wpengine.com', { method: 'POST' });

// Wait for the spider to finish
// Implement polling mechanism to check spider status

// Start active scanning
fetch(ZAP_API_BASE + 'ascan/action/scan/?url=https://brainportstg.wpengine.com', { method: 'POST' });

// Wait for the active scan to finish
// Implement polling mechanism to check scan status

// Generate a report (HTML)
fetch(ZAP_API_BASE + 'core/action/report/?format=html&baseurl=https://brainportstg.wpengine.com', { method: 'POST' });

// Save the report to a file
// Implement file saving logic
