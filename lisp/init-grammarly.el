;;
;;https://github.com/mmagnus/emacs-grammarly
;;
;;load el file in your .emacs, e.g. 
(load-file "~/.emacs.d/plugins/emacs-grammarly/emacs-grammarly.el")

;; Bind the grammarly-save-region-and-run to a key, for instance:
(global-set-key (kbd "C-c C-g") 'grammarly-save-region-and-run)

(provide 'init-grammarly)
