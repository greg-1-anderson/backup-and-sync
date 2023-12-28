# Backup and Sync

To persistently install these scripts in your `$PATH`, run:

```bash
source install
```

To install the email backup script to run daily **AS ROOT**, run:

```bash
sudo ./install-root-crontab.sh --server mail.example.com --archive-dir /data/archive/email user1 user2
```

### Index of Maintained Scripts

- `email-backup`
Uses rsync to back up mail folders from a remote system. For use by those who run their own email servers. O_o

*IMPORTANT NOTE:* The scripts below have not gotten much use in quite a while, and might need some maintenance before being servicable again.

## Index of Poorly-Maintained Scripts

- `drupal-backup-all`
Uses Drush aliases to keep "backup" and "update" versions of a site in sync. The aliases and backup sites must be installed manually.

- `git-backup-all`
Uses `git clone --bare` and/or `git fetch` to mirror remote git repositories.

- `syncwith`
Run a two-way sync with another machine. Very convenient, but has some shortcomings, and can be dangerous if not used carefuly. Only use in conjunction with a robust backup strategy.

- `snapshot2` / `pullsnapshot` / `migratehistories
A robust backup strategy based on the behaivor of rsync with hard links to produce a historical record of backups with minimal disk usage requirements.
