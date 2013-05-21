# Defaults for rkhunter cron jobs
# sourced by /etc/cron.*/rkhunter
default[:rkhunter][:cron_options] = {
  # Set this to the email address where reports and run output should be sent
  :REPORT_EMAIL => "root",

  # Set this to yes to enable rkhunter weekly database updates
  :CRON_DB_UPDATE => "yes",

  # Set this to yes to enable reports of weekly database updates
  :DB_UPDATE_EMAIL => "yes",

  # Set this to yes to enable rkhunter daily runs
  :CRON_DAILY_RUN => "yes",

  # Nicenesses range from -20 (more priority) to 19 (less priority)
  :NICE => "10",

  # Extra options to pass to rkhunter daily cron job
  # see `man rkhunter' for available options
  :RK_OPT => "",

  # apt/dpk should invoke rkhunter to update things
  :APT_AUTOGEN => "yes",
}

# rkhunter.conf settings. See the example file for docs.
# nils are omitted, so will take the rkhunter defaults
default[:rkhunter][:conf] = {
  :ROTATE_MIRRORS => 0,
  :UPDATE_MIRRORS => 1,
  :MIRRORS_MODE => 0,
  "MAIL-ON-WARNING" => "",  # (yes, this is hyphens, not underscores)
  :MAIL_CMD => 'mail -s "[rkhunter] Warnings found for ${HOST_NAME}"',
  
  :TMPDIR => "/var/lib/rkhunter/tmp",
  :DBDIR => "/var/lib/rkhunter/db",
  :SCRIPTDIR => "/usr/share/rkhunter/scripts",
  :ROOTDIR => nil,
  :BINDIR => "/bin /usr/bin /sbin /usr/sbin /usr/local/bin /usr/local/sbin /usr/libexec /usr/local/libexec",
  :LANGUAGE => nil,
  :LOGFILE => "/var/log/rkhunter.log",
  :APPEND_LOG => 0,
  :USE_SYSLOG => "authpriv.notice",
  :COLOR_SET2 => 0,
  :AUTO_X_DETECT => 0,

  :ALLOW_SSH_ROOT_USER => "no",
  :ALLOW_SSH_PROT_V1 => 0,
  :SSH_CONFIG_DIR => nil,

  # default to excluding error prone tests.
  :ENABLE_TESTS => "all",
  :DISABLE_TESTS => "promisc suspscan deleted_files packet_cap_apps hidden_procs",

  :HASH_FUNC => nil,
  :HASH_FLD_IDX => nil,
  :PKGMGR => "DPKG",
  :ATTRWHITELIST => [],
  :WRITEWHITELIST => [],
  :SCRIPTWHITELIST => [],
  :IMMUTWHITELIST => [],
  :ALLOWHIDDENDIR => [
                      "/dev/.static",
                      "/dev/.udev",
                      "/dev/.udev/.lock-70-persistent-net.rules",
                      "/dev/.initramfs",
                      "/etc/.java",
                     ],
  :ALLOWHIDDENFILE => [
                       "/dev/.initramfs-tools",
                       "/dev/.blkid.tab",
                       "/dev/.blkid.tab.old",
                      ],
  :ALLOWPROCDELFILE => [],
  :ALLOWPROCLISTEN => [],
  :ALLOWDEVFILE => [],
  :SCAN_MODE_DEV => 'THOROUGH',
  :INETD_CONF_PATH => nil,
  :INETD_ALLOWED_SVC => [],
  :XINETD_CONF_PATH => nil,
  :XINETD_ALLOWED_SVC => [],
  :LOCAL_RC_PATH => nil,
  :SYSTEM_RC_DIR => nil,
  :PASSWORD_FILE => nil,
  :UID0_ACCOUNTS => nil,
  :PWDLESS_ACCOUNTS => nil,
  :SYSLOG_CONFIG_FILE => nil,
  :ALLOW_SYSLOG_REMOTE_LOGGING => 1,
  :APP_WHITELIST => "openssl:0.9.8g openssl:0.9.8k sshd:4.7p1 gpg:1.4.10",
  :SUSPSCAN_DIRS => "/tmp /var/tmp",
  :SUSPSCAN_TEMP => "/dev/shm",
  :SUSPSCAN_MAXSIZE => 10240000,
  :SUSPSCAN_THRESH => 200,
  :PORT_WHITELIST => nil,
  :OS_VERSION_FILE => nil,
  :RTKT_DIR_WHITELIST => nil,
  :RTKT_FILE_WHITELIST => nil,
  :INSTALLDIR => "/usr",
}
