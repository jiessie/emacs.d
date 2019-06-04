;; Time-stamp: <2019-03-22 17:00:00 kmodi>

;; header2
;; http://www.emacswiki.org/emacs/header2.el

(use-package header2
  :load-path "elpa/header2-21.0/"
  :defer 10
  :config
  (progn

    (defconst header-sep-line-char ?-
      "Character to be used for creating separator lines in header.")

    (defconst auto-headers-hooks '(verilog-mode-hook
                                        python-mode-hook
                                        sh-mode-hook
                                        cperl-mode-hook)
      "List of hooks of major modes in which headers should be auto-inserted.")

    (defvar header-timestamp-cond (lambda () t)
      "This variable should be set to a function that returns a non-nil
value only when the time stamp is supposed to be inserted. By default, it's
a `lambda' return `t', so the time stamp is always inserted.")

    (defvar header-version-cond (lambda () t)
      "This variable should be set to a function that returns a non-nil
value only when the version fields are supposed to be inserted. By default, it's
a `lambda' return `t', so the version fields are always inserted.")

    (defun turn-on-auto-headers ()
      "Turn on auto headers only for specific modes."
      (interactive)
      (dolist (hook auto-headers-hooks)
        (add-hook hook #'auto-make-header)))

    (defun turn-off-auto-headers ()
      "Turn off auto headers only for specific modes."
      (interactive)
      (dolist (hook auto-headers-hooks)
        (remove-hook hook #'auto-make-header)))

    (defun header-multiline ()
      "Insert multiline comment. The comment text is in `header-multiline' var."
      (let ((lineno  1)
            beg end nb-lines)
        (beginning-of-line)
        (if (nonempty-comment-end)
            (insert "\n" comment-start)
          ;; (header-blank)
          (insert header-prefix-string))
        (setq beg  (point))
        (insert header-multiline)
        (setq end       (point-marker)
              nb-lines  (count-lines beg end))
        (goto-char beg)
        (forward-line 1)
        (while (< lineno nb-lines)
          (insert header-prefix-string)
          (forward-line 1)
          (setq lineno  (1+ lineno)))
        (goto-char end)
        (when (nonempty-comment-end) (insert "\n"))
        (insert comment-end)
        (insert "\n")))

    (defsubst header-sep-line ()
      "Insert separator line"
      (insert header-prefix-string)
      (insert-char header-sep-line-char (- fill-column (current-column)))
      (insert "\n"))

    (defsubst header-timestamp ()
      "Insert field for time stamp."
      (when (funcall header-timestamp-cond)
        (insert header-prefix-string "Time-stamp: <>\n")))

    (defsubst header-projectname ()
      "Insert \"Project\" line."
      (insert header-prefix-string "Project            : "
              (when (and (featurep 'projectile)
                         (projectile-project-root))
                (replace-regexp-in-string "/proj/\\(.*?\\)/.*"
                                          "\\1"
                                          (projectile-project-root)))
              "\n"))

    (defsubst header-file-name ()
      "Insert \"File Name\" line, using buffer's file name."
      (insert header-prefix-string "File Name          : "
              (if (buffer-file-name)
                  (file-name-nondirectory (buffer-file-name))
                (buffer-name))
              "\n"))

    (defsubst header-author ()
      "Insert current user's name (`user-full-name') as this file's author."
      (insert header-prefix-string
              "Original Author    : jiessie.cao@gmail.com"
;;              (user-full-name) "@"
;;              (replace-regexp-in-string ".*?\\(\\w+\\.\\w+\\)$" "\\1"
;;                                        (getenv "HOST"))
              "\n"))

    (defsubst header-description ()
      "Insert \"Description\" line."
      (insert header-prefix-string "Description        : \n"))

    (defsubst header-copyright ()
      "Insert the copyright block using `header-multiline'.
The copyright block will inserted only if the value of `header-copyright-notice'
is non-nil."
      (let ((header-multiline header-copyright-notice))
        (header-multiline)))

    (defsubst header-version ()
      "Insert version info fields that will be auto-updated by SVN."
      (when (funcall header-version-cond)
        (insert header-prefix-string "SVN Revision       : $Rev$\n")
        (insert header-prefix-string "Last Commit Date   : $Date$\n")
        (insert header-prefix-string "Last Commit Author : $Author$\n")
        (header-sep-line)))

    (defsubst header-position-point ()
      "Position the point at a particular point in the file.
Bring the point 2 lines below the current point."
      (forward-line 0)
      (newline 2))

    (setq make-header-hook '(header-timestamp        ; // Time-stamp: <>
                             header-sep-line         ; // ---------------
;;                             header-projectname      ; // Project
                             header-file-name        ; // File Name
                             header-author           ; // Original Author
                             header-description      ; // Description
;;                             header-sep-line         ; // ---------------
;;                             header-version          ; // Revision
;;                             header-copyright        ; // Copyright (c)
                             header-sep-line         ; // ---------------
                             header-position-point))

    (turn-on-auto-headers)))


(provide 'init-header2)
