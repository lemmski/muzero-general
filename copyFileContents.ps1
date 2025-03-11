# Initialize an empty string to hold combined content
$combinedContent = ""

# Get all .py files in the current directory, sorted by name
$pyFiles = Get-ChildItem -Path . -Filter "*.py" | Sort-Object Name

# Explicitly add games/breakout.py if it exists
if (Test-Path "games/breakout.py") {
    $pyFiles += Get-Item "games/breakout.py"
}

# Process each file
foreach ($file in $pyFiles) {
    # Append a header line with the file name as a comment
    $combinedContent += "# $($file.Name)`n"
    
    # Append the file's content (using -Raw to get it as a single string)
    $combinedContent += (Get-Content $file.FullName -Raw) + "`n"
    
    # Optionally add an extra empty line for separation between files
    $combinedContent += "`n"
}

# Copy the combined content to the clipboard
$combinedContent | Set-Clipboard
