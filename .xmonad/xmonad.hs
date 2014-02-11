import qualified Data.Map as M
import qualified XMonad.StackSet as W
import System.IO
import XMonad
import System.Exit
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Actions.Promote
import XMonad.Util.EZConfig
import XMonad.Layout.Magnifier
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Actions.GridSelect

-- MyKeyBind
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
 
    -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenu_run")
 
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    , ((modm,               xK_g     ), goToSelected defaultGSConfig{gs_font="xft:Ricty:pixelsize=14"})
    , ((modm,               xK_s     ), 
      spawnSelected defaultGSConfig{gs_font="xft:Ricty:pixelsize=14:bold"}
      ["urxvt","emacs","gvim","midori","pcmanfm","keepass","firefox","qgit",
       "","","","",""])
 
    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
 
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
 
    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
 
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


myLayout = magnifiercz 1.5 $ withBorder 1 (tiled ||| Mirror tiled ||| Grid) ||| Full
    where
      tiled = Tall nmaster delta ratio
      nmaster = 1
      ratio = 1/2
      delta = 3/100

main = do
  spawn "xcompmgr"
  spawn "dropbox start"
  spawn "feh --bg-fill .bg"
  spawn "fcitx"
  spawn "xscreensaver -nosplash"
  xmproc <- spawnPipe "xmobar"

  xmonad $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts $ myLayout
      , logHook = dynamicLogWithPP $ xmobarPP
                      { ppOutput = hPutStrLn xmproc
                      , ppTitle = xmobarColor "orange" "" . shorten 50
                      }
      , terminal           = "urxvt"
      , borderWidth        = 4
      , normalBorderColor  = "#00000"
      , focusedBorderColor = "#6666cc"
      , modMask            = mod4Mask
      , keys               = myKeys
      }
