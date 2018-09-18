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
  ;;;;;;;;;;;;;;;;;;; Theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
  ;;;;;;;;;;;;;;;;;;;;;;; Utils functions ;;;;;;;;;;;;;;;;;;;;;;;
  (defun tabbar-filter (condp lst)
    (delq nil
          (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

  (defun tabbar-get-groups ()
    ;; Refresh groups.
    (set tabbar-tabsets-tabset (tabbar-map-tabsets 'tabbar-selected-tab))
    (mapcar #'(lambda (group)
                (format "%s" (cdr group)))
            (tabbar-tabs tabbar-tabsets-tabset)))

;;;;;;;;;;;;;;;;;;;;;;; Interactive functions ;;;;;;;;;;;;;;;;;;;;;;;
  (defun tabbar-switch-group (&optional groupname)
    "Switch tab groups using ido."
    (interactive)
    (let* ((tab-buffer-list (mapcar
                             #'(lambda (b)
                                 (with-current-buffer b
                                   (list (current-buffer)
                                         (buffer-name)
                                         (funcall tabbar-buffer-groups-function) )))
                             (funcall tabbar-buffer-list-function)))
           (groups (tabbar-get-groups))
           (group-name (or groupname (ido-completing-read "Groups: " groups))) )
      (catch 'done
        (mapc
         #'(lambda (group)
             (when (equal group-name (car (car (cdr (cdr group)))))
               (throw 'done (switch-to-buffer (car (cdr group))))))
         tab-buffer-list) )))

  (defun tabbar-select-end-tab ()
    "Select end tab of current tabset."
    (interactive)
    (tabbar-select-beg-tab t))

  (defun tabbar-select-beg-tab (&optional backward type)
    "Select beginning tab of current tabs.
If BACKWARD is non-nil, move backward, otherwise move forward.
TYPE is default option."
    (interactive)
    (let* ((tabset (tabbar-current-tabset t))
           (ttabset (tabbar-get-tabsets-tabset))
           (cycle (if (and (eq tabbar-cycle-scope 'groups)
                           (not (cdr (tabbar-tabs ttabset))))
                      'tabs
                    tabbar-cycle-scope))
           selected tab)
      (when tabset
        (setq selected (tabbar-selected-tab tabset))
        (setq tabset (tabbar-tabs tabset)
              tab (car (if backward (last tabset) tabset)))
        (tabbar-click-on-tab tab type))))

  (defun tabbar-backward-tab-other-window (&optional reversed)
    "Move to left tab in other window.
Optional argument REVERSED default is move backward, if reversed is non-nil move forward."
    (interactive)
    (other-window 1)
    (if reversed
        (tabbar-forward-tab)
      (tabbar-backward-tab))
    (other-window -1))

  (defun tabbar-forward-tab-other-window ()
    "Move to right tab in other window."
    (interactive)
    (tabbar-backward-tab-other-window t))

  (defun tabbar-kill-all-buffers-in-current-group ()
    "Kill all buffers in current group."
    (interactive)
    (let* ((groups (tabbar-get-groups))
           (current-group-name (cdr (tabbar-selected-tab (tabbar-current-tabset t)))))
      ;; Kill all buffers in current group.
      (save-excursion
        (mapc #'(lambda (buffer)
                  (with-current-buffer buffer
                    (when (string-equal current-group-name (cdr (tabbar-selected-tab (tabbar-current-tabset t))))
                      (kill-buffer buffer))))
              (buffer-list)))
      ;; Switch to next group.
      (tabbar-forward-group)
      ))
  ;;;;;;;;;;;;;;;;;;;;;;; Default configurations ;;;;;;;;;;;;;;;;;;;;;;;

  ;; Loading tabbar mode.
  (tabbar-mode t)

  ;; Uniquify tab name when open multiple buffers with same filename.
  (setq uniquify-separator "/")
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq uniquify-after-kill-buffer-p t)

  ;; Rules to control buffers show in tabs.
  (defun tabbar-filter-buffer-list ()
    "`tabbar-filter-buffer-list' control buffers show in tabs.
All buffer that start with * or magit-* won't display in tabbar.
Of course, you still can switch buffer by other emacs commands."
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

  ;; Rules to control buffer's group rules.
  (defun tabbar-buffer-groups-by-mixin-rules ()
    "`tabbar-buffer-groups-by-mixin-rules' control buffers' group rules.
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

  (setq tabbar-buffer-groups-function 'tabbar-buffer-groups-by-mixin-rules)

  ;; Helm source for switch group in helm.
  (defvar helm-source-tabbar-group nil)

  (defun tabbar-build-helm-source ()
    (interactive)
    (setq helm-source-tabbar-group
          (when (featurep 'helm)
            (require 'helm)
            (helm-build-sync-source
                "Tabbar Group"
              :candidates #'tabbar-get-groups
              :action '(("Switch to group" . tabbar-switch-group))))))
  )

(provide 'init-tabbar)
