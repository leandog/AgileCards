Before do
  launch_app './Frank/frankified_build/Frankified.app'
end

After do
  simulator_reset
end

def simulator_reset
    %x{osascript<<APPLESCRIPT
        tell application "System Events"
          click menu item 5 of menu "iOS Simulator" of menu bar of process "iPhone Simulator"
            tell window 1 of process "iPhone Simulator"
              click button "Reset"
            end tell
        end tell
    APPLESCRIPT}
end
