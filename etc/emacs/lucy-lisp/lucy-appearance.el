;; -*- lexical-binding: t -*-

(setq frame-title-format "%b")

(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)

(use-package modus-themes
  :bind ("C-c t" . modus-themes-toggle)
  :defer nil
  :init
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs t
	modus-themes-mixed-fonts t
	modus-themes-syntax '(green-strings)
	modus-themes-mode-line '(accented))
  (modus-themes-load-themes)
  :config
  (modus-themes-load-operandi))

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
	   :default-family "Iosevka Comfy Fixed"
	   :default-height 160
	   :default-weight regular
	   :variable-pitch-family "Inter")
	  (presentation
	   :default-family "Iosevka Comfy Fixed"
	   :default-height 240
	   :default-weight regular
	   :variable-pitch-family "Inter")))
  (fontaine-set-preset 'regular))

(provide 'lucy-appearance)
