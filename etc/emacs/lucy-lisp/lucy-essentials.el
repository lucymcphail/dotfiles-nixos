;; -*- lexical-binding: t -*-

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

(setq ring-bell-function (lambda () nil))
(setq confirm-kill-emacs #'y-or-n-p)
(setq disabled-command-function nil)
(setq compilation-ask-about-save nil)
(setq save-interprogram-paste-before-kill t)
(setq sentence-end-double-space nil)

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(let ((map global-map))
  (define-key map [remap dabbrev-expand] #'hippie-expand)
  (define-key map [remap zap-to-char] #'zap-up-to-char)
  (define-key map (kbd "C-x K") #'kill-this-buffer)
  (define-key map (kbd "C-M-r") #'raise-sexp))

(repeat-mode t)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

(use-package whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode t))

(use-package elec-pair
  :ensure nil
  :config
  (setq electric-pair-preserve-balance t)
  (add-function :before-until electric-pair-inhibit-predicate
		(lambda (c) (eq c ?<)))
  (electric-pair-mode t))

(use-package envrc
  :defer nil
  :bind ("C-c e" . envrc-command-map)
  :config
  (envrc-global-mode t))

(provide 'lucy-essentials)
