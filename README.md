
## Description
---

This project is a Bash script that automates the process of sorting files in the Downloads directory based on their file types (extensions). Instead of manually organizing files, this script continuously monitors the Downloads directory for any new files and moves them to respective subdirectories based on their extensions.

The script utilizes the `inotifywait` command to watch for file creation or movement events within the Downloads directory. When a new file is detected, it's immediately sorted into an appropriate subdirectory based on its extension.

## Features

- Automatically sorts files into subdirectories based on their file types.
- Continuously monitors the Downloads directory in the background.
- Easily customizable and extendable to support additional file types.

## Prerequisites

Before running the script, ensure you have the following installed on your system:

- `inotify-tools`: This package is required to utilize the `inotifywait` command. On Ubuntu or Debian-based systems, you can install it using the following command:

```bash
sudo apt-get install inotify-tools

