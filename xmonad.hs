import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Util.Paste
import XMonad.Util.Run

import qualified Data.Map as M

main = xmonad =<< xmobar myConfig
myConfig = defaultConfig
    { terminal    = "urxvt"
    , modMask     = mod4Mask
    , borderWidth = 1
    , keys = myKeys
    , layoutHook=myLayoutHook
    , manageHook=manageDocks <+> manageHook defaultConfig
    , startupHook = spawn "setxkbmap -option 'ctrl:nocaps' &" >>
                    spawn "ps -C redshift || gtk-redshift -l 47.6494438:-122.3503228 &" >>
                    spawn "ps -C stalonetray || stalonetray &" >>
                    spawn "xscreensaver -no-splash &"
    }

-- Union default and new key bindings
myKeys x  = M.union (M.fromList (newKeys x)) (keys defaultConfig x)

myLayoutHook = (avoidStruts tall ||| avoidStruts (Mirror tall) ||| noBorders Full)
                   where tall = Tall 1 0.03 0.5

-- Add new and/or redefine key bindings
newKeys conf@(XConfig {XMonad.modMask = modm}) = [
    ((mod1Mask.|.controlMask  , xK_l      ), spawn "xscreensaver-command -lock")
  , ((controlMask.|.shiftMask , xK_equal  ), spawn "volctl plus")
  , ((controlMask.|.shiftMask , xK_minus  ), spawn "volctl minus")
  , ((mod4Mask                , xK_b      ), sendMessage ToggleStruts)
  , ((mod4Mask                , xK_c      ), spawn "xdg-open about:newtab")
  , ((shiftMask               , xK_Insert ), pasteSelection)
   ]
