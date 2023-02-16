;; -*- lexical-binding: t -*-

(setq user-full-name "Lucy McPhail"
      user-mail-address "lucy.mcphail.p@gmail.com")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (with-temp-buffer (write-file custom-file)))
(load custom-file)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-version 'straight
      straight-use-package-by-default t)

(add-to-list 'load-path (locate-user-emacs-file "lucy-lisp"))

(when (equal system-type 'darwin) (require 'lucy-mac))

(require 'lucy-essentials)
(require 'lucy-appearance)
(require 'lucy-completion)
(require 'lucy-window)
(require 'lucy-git)
(require 'lucy-mail)
(require 'lucy-org)
(require 'lucy-tex)
(require 'lucy-langs)
(require 'lucy-writing)
