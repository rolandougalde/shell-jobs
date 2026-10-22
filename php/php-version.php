<?php
// Ensure clean plain-text output in browsers or terminal
header('Content-Type: text/plain; charset=utf-8');

$version = PHP_VERSION;

// Define the minimum patched version required for each minor branch
$min_versions = [
    '8.2' => '8.2.35',
    '8.3' => '8.3.36',
    '8.4' => '8.4.27',
    '8.5' => '8.5.12',
];

// Extract current major.minor branch (e.g., "8.3")
$branch = PHP_MAJOR_VERSION . '.' . PHP_MINOR_VERSION;

echo "Current PHP Version : $version\n";
echo "Active Branch       : PHP $branch\n";
echo str_repeat("-", 40) . "\n";

if (isset($min_versions[$branch])) {
    $required = $min_versions[$branch];
    
    if (version_compare($version, $required, '>=')) {
        echo "✔ PASS: $version meets or exceeds the required patch ($required).\n";
    } else {
        echo "✘ VULNERABLE: $version is below the security minimum ($required).\n";
    }
} else {
    // Handle newer or older branches not explicitly mapped
    if (version_compare($version, '8.6.0', '>=')) {
        echo "✔ PASS: $version is on a newer post-vulnerability branch.\n";
    } else {
        echo "✘ WARNING: $version is on an unlisted or EOL branch.\n";
    }
}
?>
