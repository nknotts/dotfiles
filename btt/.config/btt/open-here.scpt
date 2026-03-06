tell application "Finder"
    try
        set thePath to POSIX path of (target of front window as alias)
    on error
        set thePath to POSIX path of (home folder as alias)
    end try
end tell

tell application "WezTerm" to activate

delay 0.2

do shell script "/Applications/WezTerm.app/Contents/MacOS/wezterm cli spawn --cwd " & quoted form of thePath
