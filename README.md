# Backup and Restore Shell Scripts

This project involves writing Bash shell scripts and a Makefile to automatically back up and restore a directory, while implementing key concepts of shell scripting, Linux utilities, and automation. Additionally, the project explores scheduling backups using cron jobs for real-world automation scenarios.

# Project Objectives

Learn to write and execute Bash scripts (.sh files).
Automate the backup process of a directory and limit the number of backups.
Implement a restore script to navigate through previous versions of backups.
Create and execute a Makefile for automation.
Set up periodic automated backups using cron jobs.

# Folder Structure

.
├── backupd.sh # Backup script to automatically backup a directory
├── restore.sh # Restore script to navigate through backups
├── backup-cron.sh # Backup script to be run via cron jobs
├── Makefile # Automates execution of backup scripts
├── README.md # Documentation and instructions
└── sample_output/ # Sample terminal logs and outputs

# Features

1.  Backup Script (backupd.sh)
    Automates directory backup with time-stamped copies.
    Monitors modifications in the source directory.
    Limits the number of stored backups to a user-defined value (max-backups).
2.  Restore Script (restore.sh)
    Allows the user to navigate through previous and future versions of backups interactively.
    Provides terminal logging for actions performed (e.g., restored to next/previous version).
3.  Makefile
    Automates the execution of backup scripts.
    Creates the destination backup directory as a pre-build step.
4.  Cron Job for Automated Backups
    Uses cron to schedule background backups at regular intervals.
    Configurable to run every minute or on specific days/times.
    Prerequisites
    Operating System: Ubuntu (or any Linux distribution).
    Tools Required:
    Bash Shell
    Make Utility (sudo apt install make)
    Cron Job Service
