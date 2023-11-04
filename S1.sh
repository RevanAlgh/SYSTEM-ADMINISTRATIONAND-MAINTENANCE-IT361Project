#!/bin/bash

# Set the paths to the backup directory and email address
BACKUP_DIR="/home/revan/backups"
EMAIL="revan@revan"
SOURCE_DIR="/home/revan" # Specify the directory you want to back up 

PASSPHRASE="aa11aa" # Define the passphrase (less secure)

# Create a function to encrypt and send the backup file via email
function encrypt_and_send_backup() {
    local source_dir="$1"
    local backup_file="$BACKUP_DIR/backup-$(date +\%Y\%m\%d).tar.gz"
    local encrypted_backup_file="$backup_file.gpg"

    # Create a tarball of the source directory and save it in the backup directory
    tar czf "$backup_file" "$source_dir"

    # Encrypt the backup file using gpg
    gpg --symmetric --passphrase "$PASSPHRASE"  --output "$encrypted_backup_file" "$backup_file"

    # Send the encrypted backup file via email using mutt
    mutt -s "Encrypted Backup of $source_dir" "$EMAIL" -a "$encrypted_backup_file" < /dev/null

    # Clean up temporary files
    rm "$backup_file"
}
# Perform the backup
encrypt_and_send_backup "$SOURCE_DIR"
