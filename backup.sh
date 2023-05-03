BACKUP_DIR="/backup"
BACKUP_NAME="umami-data"

# Create backup directory if it doesn't exist

BACKUP_FILE="$BACKUP_DIR/$BACKUP_NAME-$(date +'%Y-%m-%d_%H-%M-%S').tar.gz"
tar --create --gzip  --file="$BACKUP_FILE" /var/lib/docker/volumes/umami-data/_data

# Keep the last 6 incremental backups
ls -tp "$BACKUP_DIR/$BACKUP_NAME"* | grep -v '/$' | tail -n +7 | xargs -d '\n' rm -f --
