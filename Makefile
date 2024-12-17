BACKUPDIR = ./backup
SOURCEDIR = ./origin
BACKUP_SCRIPT = ./backupd.sh
RESTORE_SCRIPT = ./restore.sh
INTERVAL = 10
MAXBACKUPS = 5

.PHONY: all
all :create_backup_dir run_backup

.PHONY: create_backup_dir
create_backup_dir:
	@mkdir -p $(BACKUPDIR)

.PHONY: run_backup
run_backup:
	@echo "Starting Backup.."
	@bash $(BACKUP_SCRIPT) $(SOURCEDIR) $(BACKUPDIR) $(INTERVAL) $(MAXBACKUPS)

.PHONY: run_restore
run_restore:
	@echo "Starting Restore..."
	@bash $(RESTORE_SCRIPT) $(SOURCEDIR) $(BACKUPDIR)

.PHONY:clean
clean:
	@rm -rf $(BACKUPDIR)/*
	@echo "Cleaned the Backup Directory"

