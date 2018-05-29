(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

;; Personal information
(setq user-full-name 'lemon)
(setq user-mail-address 'lemon9010@gmail.com)

;; Environment
(when (or sys/mac-x-p sys/linux-x-p)
  (use-package exec-path-from-shell
    :init
    (setq exec-path-from-shell-check-startup-files nil)
    (setq exec-path-from-shell-variables '("PATH" "MANPATH" "PYTHONPATH" "GOPATH"))
    (setq exec-path-from-shell-arguments '("-l"))
    (exec-path-from-shell-initialize)))

(use-package saveplace
  :ensure nil
  :init
  ;; Emacs 25 has a proper mode for `save-place'
  (if (fboundp 'save-place-mode)
      (add-hook 'after-init-hook #'save-place-mode)
    (setq save-place t))
  :config
  (setq save-place-forget-unreadable-files nil))

(use-package recentf
  :ensure nil
  :init
  (setq recentf-max-saved-items 200)
  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "bookmarks")
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'"))

(provide 'init-basic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-basic.el ends here
