;;; ui/tabbar/config.el -*- lexical-binding: t; -*-

;; This is here for reference. I don't use tabbar because it's unstable and not
;; very useful (all it does is show a buffer list on top of *every* window). I
;; find ivy (or helm) or even `buffer-menu' is better suited for this purpose.

(use-package tabbar
  :load-path "site-lisp/tabbar"
  :commands tabbar-mode
  :init
  (add-hook 'after-init-hook #'tabbar-mode)
  :config
  (setq uniquify-separator "/")                                  ;分隔符
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets) ;反方向的显示重复的Buffer名字
  (setq uniquify-after-kill-buffer-p t)                          ;删除重复名字的Buffer后重命名

  (defcustom tabbar-hide-header-button t
    "Hide header button at left-up corner.
Default is t."
    :type 'boolean
    :set (lambda (symbol value)
           (set symbol value)
           (if value
               (setq
                tabbar-scroll-left-help-function nil ;don't show help information
                tabbar-scroll-right-help-function nil
                tabbar-help-on-tab-function nil
                tabbar-home-help-function nil
                tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
                tabbar-scroll-left-button (quote (("") ""))
                tabbar-scroll-right-button (quote (("") "")))))
    :group 'tabbar)

  (defun tabbar-filter (condp lst)
    (delq nil
          (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
  (defun tabbar-filter-buffer-list ()
    (tabbar-filter
     (lambda (x)
       (let ((name (format "%s" x)))
         (and
          (not (string-prefix-p "*" name))
          (not (string-match "^magit.*:\\s-" name))
          )))
     (delq nil
           (mapcar #'(lambda (b)
                       (cond
                        ;; Always include the current buffer.
                        ((eq (current-buffer) b) b)
                        ((buffer-file-name b) b)
                        ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                        ((buffer-live-p b) b)))
                   (buffer-list)))))

  (setq tabbar-buffer-list-function 'tabbar-filter-buffer-list)
  (defun tabbar-buffer-groups-by-mixin-rules ()
    "Mixin multiple rules.
Group tabbar with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `projectile-project-p' with project name."
    (list
     (cond
      ((derived-mode-p 'eshell-mode)
       "EShell")
      ((derived-mode-p 'emacs-lisp-mode)
       "Elisp")
      ((derived-mode-p 'dired-mode)
       "Dired")
      ((memq major-mode '(org-mode org-agenda-mode diary-mode))
       "OrgMode")
      ((memq major-mode '(magit-process-mode
                          magit-status-mode
                          magit-diff-mode
                          magit-log-mode
                          magit-file-mode
                          magit-blob-mode
                          magit-blame-mode
                          ))
       "Magit")
      ((string-equal "*" (substring (buffer-name) 0 1))
       "Emacs")
      (t
       (if (projectile-project-p)
           (projectile-project-name)
         "Common"))
      )))

  (setq tabbar-buffer-groups-function 'tabbar-buffer-groups-by-mixin-rules))

(provide 'init-tabbar)
