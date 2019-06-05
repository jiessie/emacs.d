;;; wgrep-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (wgrep-setup) "wgrep" "wgrep.el" (23697 48098 48499
;;;;;;  673000))
;;; Generated autoloads from wgrep.el

(autoload 'wgrep-setup "wgrep" "\
Setup wgrep preparation.

\(fn)" nil nil)

(add-hook 'grep-setup-hook 'wgrep-setup)

;;;***

;;;### (autoloads nil nil ("wgrep-pkg.el") (23697 48098 54574 912000))

;;;***

(provide 'wgrep-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; wgrep-autoloads.el ends here
