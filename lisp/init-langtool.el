;;load el file in your .emacs, e.g. 
(load-file "~/.emacs.d/plugins/langtool/langtool.el")

(setq langtool-language-tool-jar "/usr/local/Cellar/languagetool/4.3/libexec/languagetool-commandline.jar"
      langtool-mother-tongue "nl"
      langtool-disabled-rules '("WHITESPACE_RULE"
                                "EN_UNPAIRED_BRACKETS"
                                "COMMA_PARENTHESIS_WHITESPACE"
                                "EN_QUOTES"))

(global-set-key "\C-x4w" 'langtool-check-buffer)
(global-set-key "\C-x4W" 'langtool-check-done)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
(global-set-key "\C-x44" 'langtool-show-message-at-point)
(global-set-key "\C-x4c" 'langtool-correct-buffer)

(setq langtool-default-language "en-US")

(provide 'init-langtool)
