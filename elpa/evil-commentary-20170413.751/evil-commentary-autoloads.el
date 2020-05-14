;;; evil-commentary-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "evil-commentary" "evil-commentary.el" (23308
;;;;;;  32665 91226 558000))
;;; Generated autoloads from evil-commentary.el

(defvar evil-commentary-mode nil "\
Non-nil if Evil-Commentary mode is enabled.
See the `evil-commentary-mode' command
for a description of this minor mode.")

(custom-autoload 'evil-commentary-mode "evil-commentary" nil)

(autoload 'evil-commentary-mode "evil-commentary" "\
Commentary mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "evil-commentary-integration" "evil-commentary-integration.el"
;;;;;;  (23308 32665 95693 553000))
;;; Generated autoloads from evil-commentary-integration.el

(autoload 'evil-commentary/org-comment-or-uncomment-region "evil-commentary-integration" "\
Comment function for `org-mode'.

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads nil nil ("evil-commentary-pkg.el") (23308 32665
;;;;;;  94361 770000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evil-commentary-autoloads.el ends here
