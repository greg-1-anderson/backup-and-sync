# Get the path to the directory this script was executed from
SCRIPT_DIR=$( cd -- "$( dirname -- "$0" )" &> /dev/null && pwd )

SERVER=
ARCHIVE_DIR=
USERLIST=

# Parse options
while [ $# -gt 0 ] ; do
  option=$1
  shift

  case "$option" in
    --server )
      SERVER="$1"
      shift
      ;;

    --archive-dir )
      ARCHIVE_DIR="$1"
      shift
      ;;

    * )
      USERLIST="$USERLIST $option"
      ;;

  esac
done

if [ -z "$SERVER" ] ; then
  echo "You must specify a server FQDN with the --server option."
  exit 1
fi

if [ -z "$ARCHIVE_DIR" ] ; then
  echo "You must specify the directory to write backup data to with the --archive-dir option."
  exit 1
fi

if [ -z "$USERLIST" ] ; then
  echo "You must specify which users should have email backed up."
  exit 1
fi

# Copy the script into place. We will fail here if not root
mkdir -p /root/bin
cp "$SCRIPT_DIR/scripts/email-backup" /root/bin
chmod +x /root/bin/email-backup

# Install the crontab
COMMAND="/root/bin/email-backup --key /root/.ssh/$SERVER --server $SERVER --archive-dir $ARCHIVE_DIR $USERLIST"
(crontab -l 2>/dev/null | grep -v /root/bin/email-backup || true; echo "0 3 * * * $COMMAND") | crontab -
