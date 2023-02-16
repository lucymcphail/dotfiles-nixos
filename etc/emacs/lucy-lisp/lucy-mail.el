;; -*- lexical-binding: t -*-

(use-package mu4e
  :straight nil
  :if (executable-find "mu")
  :bind ("C-c m" . mu4e)
  :config
  (setq mail-user-agent 'mu4e-user-agent)

  (setq mu4e-completing-read-function #'completing-read)

  (setq mu4e-sent-folder "/personal/[Gmail]/Sent Mail"
	mu4e-trash-folder "/personal/[Gmail]/Trash"
	mu4e-drafts-folder "/personal/[Gmail]/Drafts")

  (setq mu4e-maildir-shortcuts
	'((:maildir "/personal/Inbox" :key ?i)
	  (:maildir "/personal/[Gmail]/Sent Mail" :key ?s)
	  (:maildir "/personal/[Gmail]/Trash" :key ?t)
	  (:maildir "/personal/[Gmail]/All Mail" :key ?a)
	  (:maildir "/university/Inbox" :key ?I)
	  (:maildir "/university/Sent Items" :key ?S)
	  (:maildir "/university/Deleted Items" :key ?T)
	  (:maildir "/university/Archive" :key ?A)))

  (setq mu4e-contexts
	(list (make-mu4e-context
	       :name "personal"
	       :match-func
	       (lambda (msg)
		 (when msg
		   (string-prefix-p "/personal/[Gmail]"
				    (mu4e-message-field msg :maildir))))
	       :vars '((user-mail-address . "lucy.mcphail.p@gmail.com")
		       (mu4e-sent-folder . "/personal/[Gmail]/Sent Mail")
		       (mu4e-trash-folder . "/personal/[Gmail]/Trash")
		       (mu4e-drafts-folder . "/personal/[Gmail]/Drafts")
		       (mu4e-refile-folder . "/personal/[Gmail]/All Mail")
		       (mu4e-sent-messages-behavior . delete)))
	      (make-mu4e-context
	       :name "university"
	       :match-func
	       (lambda (msg)
		 (when msg
		   (string-prefix-p "/university"
				    (mu4e-message-field msg :maildir))))
	       :vars '((user-mail-address . "L.R.McPhail@sms.ed.ac.uk")
		       (mu4e-sent-folder . "/university/Sent Items")
		       (mu4e-trash-folder . "/university/Deleted Items")
		       (mu4e-drafts-folder . "/university/Drafts")
		       (mu4e-refile-folder . "/university/Archive")
		       (mu4e-sent-messages-behavior . delete)))))

  (setq mu4e-bookmarks
	'((:name "Unified inbox"
		 :query "maildir:/personal/Inbox OR maildir:/university/Inbox"
		 :key ?i)
	  (:name "Today's messages" :query "date:today..now" :key ?t)
	  (:name "Last 7 days" :query "date:7d..now" :hide-unread t :key ?w)))

  (setq mu4e-context-policy 'pick-first
	mu4e-compose-context-policy 'always-ask)

  (setq mu4e-get-mail-command "true")

  (require 'smtpmail)
  (setq sendmail-program "msmtp"
	message-sendmail-f-is-evil t
	message-sendmail-extra-arguments '("--read-envelope-from")
	send-mail-function 'smtpmail-send-it
	message-send-mail-function 'message-send-mail-with-sendmail)

  (setq mu4e-update-interval (* 60 15))

  (setq mu4e-get-mail-command "mbsync -a")

  (setq mu4e-change-filenames-when-moving t)

  (setq mu4e-headers-include-related nil
	mu4e-hide-index-messages t
	mu4e-compose-dont-reply-to-self t
	mu4e-attachment-dir  "~/Downloads")

  (setq mu4e-confirm-quit nil)

  (mu4e t))

;;; use w3m to render HTML mail
(use-package w3m)
(setq mm-text-html-renderer 'w3m)

;;; check for attachments
(defun message-attachment-present-p ()
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (when (search-forward "<#part type" nil t) t))))

(defun message-warn-if-no-attachments ()
  (when (and
	 (save-excursion
	   (save-restriction
	     (widen)
	     (goto-char (point-min))
	     (re-search-forward "attach" nil t)))
	 (not (message-attachment-present-p)))
    (unless (y-or-n-p "No attachment. Send the message?")
      (keyboard-quit))))

(add-hook 'message-send-hook #'message-warn-if-no-attachments)

(provide 'lucy-mail)
