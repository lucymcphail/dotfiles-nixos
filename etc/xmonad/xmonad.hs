import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig

myConfig =
  def
    { modMask = mod4Mask
    , layoutHook = myLayout
    , borderWidth = 2
    , focusedBorderColor = "#6ae4b9"
    , normalBorderColor = "#000000"
    , terminal = "kitty"
    } `additionalKeysP`
  [("M-e", spawn "emacsclient -c"), ("M-f", spawn "firefox")]

myLayout = tiledGaps ||| noBorders Full
  where
    tiledGaps = smartBorders $ smartSpacingWithEdge 10 tiled
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 5 / 100
