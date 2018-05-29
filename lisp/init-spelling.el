(require 'ispell)

(setenv "DICTIONARY" "en_GB")

(when (executable-find ispell-program-name)
  (require 'init-flyspell))

(provide 'init-spelling)
