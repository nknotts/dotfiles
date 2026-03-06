tell application "Safari"
	activate
	
	set youtubeURL to "https://www.youtube.com"
	set youtubeFound to false
	
	-- Search open tabs for YouTube
	repeat with w in windows
		repeat with t in tabs of w
			if URL of t contains "youtube.com" then
				set current tab of w to t
				set index of w to 1
				set youtubeFound to true
				exit repeat
			end if
		end repeat
		if youtubeFound then exit repeat
	end repeat
	
	-- No YouTube tab found, open one
	if not youtubeFound then
		if (count of windows) is 0 then
			make new document with properties {URL:youtubeURL}
		else
			tell front window
				make new tab with properties {URL:youtubeURL}
				set current tab to last tab
			end tell
		end if
	end if
end tell

