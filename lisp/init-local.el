(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives )
(push '("melpa" . "http://melpa.org/packages/")
      package-archives)
(push '("melpa-stable" . "http://stable.melpa.org/packages/")
      package-archives)
(push '("org" . "http://orgmode.org/elpa/")
      package-archives)
(push '("gnu" . "http://elpa.gnu.org/packages/")
      package-archives)

(package-initialize)
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
    (package-install 'use-package))
(use-package validate   ; Validate options
   :ensure t)
(defalias 'after 'with-eval-after-load)
(normal-erase-is-backspace-mode 1)
(require 'init-functions)
;; for imenu auto completion
(require 'helm-config)
(require 'init-evil)
(require 'init-auctex)

(provide 'init-local)
