;; -*- lexical-binding: t -*-

(use-package auctex
  :hook
  ((LaTeX-mode . LaTeX-math-mode)
   (LaTeX-mode . reftex-mode))
  :config
  (require 'tex)
  (setq TeX-parse-self t
	TeX-save-query nil
	TeX-view-program-selection '((output-pdf "PDF Tools"))
	TeX-master t
	TeX-source-correlate-mode t
	TeX-source-correlate-start-server t)
  (setq font-latex-fontify-script nil)
  (add-hook 'TeX-after-compilation-finished-functions
	    #'TeX-revert-document-buffer))

(use-package pdf-tools
  :config
  (pdf-tools-install))

(use-package laas
  :hook (LaTeX-mode . laas-mode))

(provide 'lucy-tex)
