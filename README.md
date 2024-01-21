This is the little script that I have created to modify the nameserver settings in WSL Ubuntu:

#!/bin/bash

# Check if the user has superuser privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as a superuser." >&2
    exit 1
fi

# New values for nameserver and domain (adjust as needed)
new_nameserver="8.8.8.8"
#new_domain="example.com"

# Create new content for resolv.conf
new_content="nameserver $new_nameserver"

# Overwrite the resolv.conf file
printf "%s\n" "$new_content" > /etc/resolv.conf

echo "Successfully modified /etc/resolv.conf file automatically."
