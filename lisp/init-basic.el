(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

;; Prefers the newest version of a file
(setq load-prefer-newer t)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; Key Modifiers
(when sys/win32p
  ;; make PC keyboard's Win key or other to type Super or Hyper
  ;; (setq w32-pass-lwindow-to-system nil)
  (setq w32-lwindow-modifier 'super)    ; Left Windows key
  (setq w32-apps-modifier 'hyper)       ; Menu/App key

  ;; (w32-register-hot-key [s-])
  (w32-register-hot-key [s-t]))

(unless sys/win32p
  (setq ns-command-modifier 'meta)
  (setq ns-option-modifier 'super)
  (setq ns-function-modifier 'hyper))

;; Environment
(when (or sys/mac-x-p sys/linux-x-p)
  (use-package exec-path-from-shell
    :init
    (setq exec-path-from-shell-check-startup-files nil)
    (setq exec-path-from-shell-variables '("PATH" "MANPATH" "PYTHONPATH" "GOPATH"))
    (setq exec-path-from-shell-arguments '("-l"))
    (exec-path-from-shell-initialize)))

;; History
(use-package saveplace
  :ensure nil
  :init
  ;; Emacs 25 has a proper mode for `save-place'
  (if (fboundp 'save-place-mode)
      (add-hook 'after-init-hook #'save-place-mode)
    (setq save-place t)
    (setq save-place-file (expand-file-name ".places" user-emacs-directory))))

(use-package recentf
  :ensure nil
  :init
  (setq recentf-max-saved-items 200)
  ;; lazy load recentf
  ;; (add-hook 'after-init-hook #'recentf-mode)
  (add-hook 'find-file-hook (lambda () (unless recentf-mode
                                         (recentf-mode)
                                         (recentf-track-opened-file))))
  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "bookmarks")
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'"))

(use-package savehist
  :ensure nil
  :init
  (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
        history-length 1000
        savehist-additional-variables '(mark-ring
                                        global-mark-ring
                                        search-ring
                                        regexp-search-ring
                                        extended-command-history)
        savehist-autosave-interval 60)
  (add-hook 'after-init-hook #'savehist-mode))

(setq mouse-drag-copy-region t)

(provide 'init-basic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-basic.el ends here
