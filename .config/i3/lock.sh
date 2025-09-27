rm -r /tmp/screenshot.png

scrot /tmp/screenshot.png
magick /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
i3lock -i /tmp/screenshotblur.png --show-failed-attempts
