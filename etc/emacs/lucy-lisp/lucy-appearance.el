;; -*- lexical-binding: t -*-

(setq frame-title-format "%b")

(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)

(setq display-time-24hr-format t
      display-time-default-load-average nil)

(display-time-mode t)

(setq shr-color-visible-luminance-min 80)

(use-package ef-themes
  :bind ("C-c t" . ef-themes-toggle)
  :defer nil
  :init
  (setq ef-themes-to-toggle '(ef-spring ef-autumn))
  (setq ef-themes-mixed-fonts t)
  :config
  (ef-themes-select 'ef-spring))

(use-package minions
  :config
  (setq minions-mode-line-lighter ";")
  (setq minions-prominent-modes
	(list 'defining-kbd-macro
	      'narrow-mode
	      'flymake-mode
	      'flycheck-mode
	      'projectile-mode))
  (minions-mode t))

(use-package fontaine
  :bind
  (("C-c f" . #'fontaine-set-preset)
   ("C-c F" . #'fontaine-set-face-font))
  :defer nil
  :config
  (setq x-underline-at-descent-line t)
  (setq fontaine-presets
	'((regular
	   :default-family "Iosevka"
	   :default-weight regular
	   :default-height 140
	   :variable-pitch-family "Inter")
	  (presentation
	   :default-family "Iosevka"
	   :default-weight regular
	   :default-height 240
	   :variable-pitch-family "Inter")))
  (fontaine-set-preset 'regular))

(provide 'lucy-appearance)
