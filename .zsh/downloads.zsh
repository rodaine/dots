# cleanup download history
(sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* \
  'delete from LSQuarantineEvent' &) > /dev/null 2>&1
