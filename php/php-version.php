<?php
// 1️⃣ Get the current PHP version
$version = phpversion();

// 2️⃣ Define the minimum versions you need
$required = [
    '8.2.35',
    '8.3.36',
    '8.4.27',
    '8.5.12'
];

// 3️⃣ Output the current version
echo "PHP Version: $version\n";

// 4️⃣ Compare against each required version and display the result
foreach ($required as $req) {
    // version_compare returns 1 if $version >= $req
    if (version_compare($version, $req, '>=')) {
        echo "✔ $version meets or exceeds $req\n";
    } else {
        echo "✘ $version is lower than $req\n";
    }
}
?>
