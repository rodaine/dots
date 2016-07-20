# AFK locks the screen, prompting for a password

function afk {
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}
