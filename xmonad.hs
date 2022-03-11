import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Util.Paste
import XMonad.Util.Run

import qualified Data.Map as M

main = xmonad =<< xmobar myConfig
myConfig = def
    { terminal    = "urxvt"
    , modMask     = mod4Mask
    , borderWidth = 1
    , keys        = myKeys
    , layoutHook  = myLayoutHook
    , manageHook  = myManageHook <+> manageHook defaultConfig
    , handleEventHook = fullscreenEventHook
    , startupHook = spawn "setxkbmap -option 'ctrl:nocaps' &" >>
                    spawn "ps -C redshift || gtk-redshift -l 47.6494438:-122.3503228 &" >>
                    spawn "ps -C stalonetray || stalonetray &" >>
                    spawn "xscreensaver -no-splash &" >>
                    spawn "fcitx &" >>
                    spawn "/home/josh/.fehbg &"
    }

myManageHook = composeAll
    [ className =? "Steam" --> doFloat
    , title =? "EXAPUNKS" --> doFloat
    , manageDocks
    ]

-- Union default and new key bindings
myKeys x  = M.union (M.fromList (newKeys x)) (keys defaultConfig x)

myLayoutHook = (avoidStruts tall ||| avoidStruts (Mirror tall) ||| noBorders Full)
                   where tall = Tall 1 0.03 0.5

-- Add new and/or redefine key bindings
newKeys conf@(XConfig {XMonad.modMask = modm}) = [
    ((mod1Mask.|.controlMask  , xK_l      ), spawn "xscreensaver-command -lock")
  , ((controlMask.|.shiftMask , xK_equal  ), spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%")
  , ((controlMask.|.shiftMask , xK_minus  ), spawn "pactl set-sink-volume @DEFAULT_SINK@ -1.5%")
  , ((controlMask.|.shiftMask , xK_0  ), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  , ((mod4Mask                , xK_b      ), sendMessage ToggleStruts)
  , ((mod4Mask                , xK_p      ), spawn "dmenu_run -fn \"Cascadia Code-9\"")
  , ((mod4Mask                , xK_c      ), spawn "xdg-open about:newtab")
  , ((shiftMask               , xK_Insert ), pasteSelection)
   ]
