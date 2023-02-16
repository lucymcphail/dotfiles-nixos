;; -*- lexical-binding: t -*-

(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(setq enable-recursive-minibuffers t)

(use-package vertico
  :config
  (vertico-mode t))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :config
  (marginalia-mode t))

(use-package consult
  :bind
  (("C-x r b" . consult-bookmark)
   ("C-x M-:" . consult-complex-command)
   ("C-x M-m" . consult-minor-mode-menu)
   ("C-x M-k" . consult-kmacro)
   ([remap goto-line] . consult-goto-line)
   ("M-K" . consult-keep-lines)
   ("M-F" . consult-focus-lines)
   ("M-s M-b" . consult-buffer)
   ("M-s M-e" . consult-flymake)
   ("M-s M-f" . consult-find)
   ("M-s M-g" . consult-ripgrep)
   ("M-s M-i" . consult-imenu)
   ("M-s M-l" . consult-line)
   ("C-x r r" . consult-register))
  :init
  (setq xref-show-xrefs-function #'consult-xref
	xref-show-definitions-function #'consult-xref)
  (setq consult-project-function (lambda (_) (projectile-project-root))))

(use-package consult-dir
  :bind
  (("C-x C-d" . consult-dir)
   :map minibuffer-local-completion-map
   ("C-x C-d" . consult-dir)
   ("C-x C-j" . consult-dir-jump-file))
  :config
  (setq consult-dir-project-list-function #'consult-dir-projectile-dirs))

(use-package company
  :custom
  (company-dabbrev-other-buffers t)
  (company-dabbrev-code-other-buffers t)
  (company-show-numbers t)
  (company-minimum-prefix-length 3)
  (company-dabbrev-downcase nil)
  (company-dabbrev-ignore-case t)
  (company-idle-delay 0.2)
  (company-global-modes '(not eshell-mode shell-mode))
  :hook ((text-mode . company-mode)
	 (prog-mode . company-mode)))

(provide 'lucy-completion)
