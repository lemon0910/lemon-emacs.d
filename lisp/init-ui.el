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
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(setq inhibit-startup-message t)
(setq-default initial-scratch-message nil)

(show-paren-mode 1)

(defun doom-theme-tabbar ()
  (custom-set-variables
   '(tabbar-background-color "black")
   )
  (custom-set-faces
   '(tabbar-button ((t (:inherit tabbar-default :background "black" :foreground "red" :box (:line-width 1 :color "black" :style released-button)))))
   '(tabbar-button-highlight ((t (:inherit tabbar-default :background "black" :foreground "green" :box (:color "red")))))
   '(tabbar-default ((t (:height 1))))
   '(tabbar-selected ((t (:inherit tabbar-default :background "black" :foreground "#00ccff" :overline "#00ccff" :weight ultra-bold :width semi-expanded))))
   '(tabbar-selected-face ((t (:inherit tabbar-default-face :background "black" :foreground "grey" :box (:line-width -1 :color "grey" :style released-button)))))
   '(tabbar-separator ((t (:background "black" :distant-foreground "red" :foreground "brown" :height 0.1 :width condensed))))
   '(tabbar-unselected ((t (:background "black" :foreground "dark grey" :overline "dark grey" :height 1.3))))
   '(tabbar-unselected-face ((t (:inherit tabbar-default-face :background "black" :foreground "white" :box (:line-width -1 :color "black" :style pressed-button)))))))

(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")
(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

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
 ((eq my-theme 'daylight)
  (use-package leuven-theme
    :init (load-theme 'leuven t)))
 ((eq my-theme 'organic-green)
  (use-package organic-green-theme
    :init (load-theme 'organic-green t)))
 ((eq my-theme 'tangotango)
  (use-package tangotango-theme
    :init (load-theme 'tangotango t)))
 ((eq my-theme 'gruvbox)
  (use-package gruvbox-theme
    :init (load-theme 'gruvbox t)))
 ((eq my-theme 'lazycat)
  (use-package lazycat-theme
    :load-path "site-lisp/lazycat-theme"
    :init
    (require 'lazycat-theme)))
 ((eq my-theme 'doom)
  (use-package doom-themes
    :preface (defvar region-fg nil)
    :init
    (load-theme 'doom-vibrant t)
    :config
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)
    (doom-theme-tabbar)
    (use-package doom-modeline
      :hook (after-init . doom-modeline-init))
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

(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
