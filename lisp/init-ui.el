;;; Code:

(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

;; Title
(setq frame-title-format
      '("GNU Emacs " emacs-version "@" user-login-name " : "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
(setq icon-title-format frame-title-format)

;; Menu/Tool/Scroll bars
(unless sys/mac-x-p
  (when (and (fboundp 'menu-bar-mode) menu-bar-mode)
    (menu-bar-mode -1)))
(when (and (fboundp 'tool-bar-mode) tool-bar-mode)
  (tool-bar-mode -1))
(when (and (fboundp 'scroll-bar-mode) scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode 1)

;; Theme
(defun is-doom-theme-p (theme)
  "Check whether the THEME is a doom theme. THEME is a symbol."
  (string-prefix-p "doom" (symbol-name theme)))
(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")
(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))
;; Modeline
(when more-feature
  (if (is-doom-theme-p my-theme)
    (use-package doom-modeline
      :hook (after-load-theme . doom-modeline-init))
  (use-package spaceline-config
               :ensure spaceline
               :commands spaceline-spacemacs-theme1
               :init
               (setq powerline-default-separator (if window-system 'arrow 'utf-8))
               (setq powerline-image-apple-rgb sys/mac-x-p)
               (add-hook 'after-init-hook #'spaceline-spacemacs-theme)
               :config
               (setq spaceline-pre-hook #'powerline-reset) ; For changing themes
               (setq spaceline-highlight-face-func 'spaceline-highlight-face-modified))))
(use-package hide-mode-line
  :init
  (dolist (hook '(completion-list-mode-hook
                  completion-in-region-mode-hook
                  neotree-mode-hook
                  treemacs-mode-hook))
    (add-hook hook #'hide-mode-line-mode)))

;;Color Theme
(cond
 ((eq my-theme 'default)
  (use-package monokai-theme
    :init (load-theme 'monokai t)))
 ((eq my-theme 'dark)
  (use-package spacemacs-theme
    :init (load-theme 'spacemacs-dark t)))
 ((eq my-theme 'light)
  (use-package spacemacs-theme
    :init (load-theme 'spacemacs-light t)))
 ((eq my-theme 'zenburn)
  (use-package zenburn-theme
    :init (load-theme 'zenburn t)))
 ((eq my-theme 'seoul256)
  (use-package seoul256-theme
    :init (load-theme 'seoul256 t)))
 ((eq my-theme 'daylight)
  (use-package leuven-theme
    :init (load-theme 'leuven t)))
 ((eq my-theme 'cyberpunk)
  (use-package cyberpunk-theme
    :init (load-theme 'cyberpunk t)))
 ((is-doom-theme-p my-theme)
  (use-package doom-themes
    :preface (defvar region-fg nil)
    :init
    (if (eq my-theme 'doom)
        (load-theme 'doom-one t)
      (load-theme my-theme t))
    :config
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)
    (use-package solaire-mode
      :hook (((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
             (minibuffer-setup . solaire-mode-in-minibuffer))
      :init (solaire-mode-swap-bg))))
 (t
  (ignore-errors (load-theme my-theme t))))

;; Fonts
(when more-feature
  (use-package cnfonts
    :init
    (add-hook 'after-init-hook #'cnfonts-enable)
    :config
    (setq cnfonts-keep-frame-size nil)
    (setq cnfonts-use-cache t)
    (setq cnfonts-profiles
          '("program1" "program2" "program3" "org-mode" "read-book"))
    (setq cnfonts--profiles-steps '(("program1" . 4)
                                    ("program2" . 5)
                                    ("program3" . 3)
                                    ("org-mode" . 6)
                                    ("read-book" . 8)))))

;; Line and Column
(setq-default fill-column 80)
(setq column-number-mode t)
(setq line-number-mode t)

(when more-feature
  (add-hook 'prog-mode-hook
            (lambda ()
              ;; turn off `linum-mode' when there are more than 5000 lines
              (if (buffer-too-big-p)
                  nil
                (progn
                  (display-line-numbers-mode +1)
                  (lemon-relative-line-number)))))
  (add-hook 'text-mode-hook
            (lambda ()
              ;; turn off `linum-mode' when there are more than 5000 lines
              (if (buffer-too-big-p)
                  nil
                (progn
                  (display-line-numbers-mode +1)
                  (lemon-relative-line-number))))))

(use-package smooth-scrolling
  :init (add-hook 'after-init-hook #'smooth-scrolling-mode)
  :config (setq smooth-scroll-margin 0
                scroll-conservatively 100000
                scroll-preserve-screen-position 1))

;; Misc
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(size-indication-mode 1)
(setq track-eol t)                      ; Keep cursor at end of lines. Require line-move-visual is nil.
(setq line-move-visual nil)

;; Don't open a file in a new frame
(when (boundp 'ns-pop-up-frames)
  (setq ns-pop-up-frames nil))

;; Don't use GTK+ tooltip
(when (boundp 'x-gtk-use-system-tooltips)
  (setq x-gtk-use-system-tooltips nil))

;; Toggle fullscreen
(bind-keys ([(control f11)] . toggle-frame-fullscreen)
           ([(control super f)] . toggle-frame-fullscreen) ; Compatible with macOS
           ([(super return)] . toggle-frame-fullscreen)
           ([(meta shift return)] . toggle-frame-fullscreen))


(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
