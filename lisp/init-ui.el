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
 ((eq my-theme 'monokai)
  (load-theme 'monokai t))
 ((eq my-theme 'dark)
  (use-package spacemacs-theme
    :init (load-theme 'spacemacs-dark t)))
 ((eq my-theme 'light)
  (use-package spacemacs-theme
    :init (load-theme 'spacemacs-light t)))
 ((eq my-theme 'gruvbox)
  (use-package gruvbox-theme
    :init (load-theme 'gruvbox t)))
 ((eq my-theme 'lemon)
  (use-package lemon-theme
    :load-path "site-lisp/lemon-theme"
    :init
    (require 'lemon-theme)))
 ((eq my-theme 'doom)
  (use-package doom-themes
    :preface (defvar region-fg nil)
    :init
    (load-theme 'doom-vibrant t)
    :config
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)))
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

(use-package awesome-tab
  :load-path "site-lisp/awesome-tab"
  :init
  (require 'awesome-tab)
  (awesome-tab-mode t))

(cond
 ((eq my-theme 'gruvbox)
  (custom-set-variables
   '(tabbar-background-color "black")
   )
  (custom-set-faces
   '(evil-search-highlight-persist-highlight-face ((t (:background "dark cyan"))))
   '(avy-lead-face ((t (:background "#4f57f9" :foreground "white"))))
   '(avy-lead-face-1 ((t (:background "#4f57f9" :foreground "white"))))
   '(avy-lead-face-2 ((t (:background "#4f57f9" :foreground "white"))))
   '(awesome-tab-selected ((t (:inherit awesome-tab-default :foreground "#d65d0e" :overline "green3" :weight ultra-bold :width semi-expanded))))
   '(awesome-tab-unselected ((t (:inherit awesome-tab-default :foreground "#b8bb26" :overline "dark green"))))
   '(awesome-tab-default ((t (:height 1))))))
 ((eq my-theme 'monokai)
  (custom-set-variables
   '(tabbar-background-color "black")
   )
  (custom-set-faces
   '(evil-search-highlight-persist-highlight-face ((t (:background "#98C379"))))
   '(avy-lead-face ((t (:background "#4f57f9" :foreground "white"))))
   '(avy-lead-face-1 ((t (:background "#4f57f9" :foreground "white"))))
   '(avy-lead-face-2 ((t (:background "#4f57f9" :foreground "white"))))
   '(awesome-tab-selected ((t (:inherit awesome-tab-default :foreground "#ff6188" :overline "green3" :weight ultra-bold :width semi-expanded))))
   '(awesome-tab-unselected ((t (:inherit awesome-tab-default :foreground "#727072" :overline "dark green"))))
   '(awesome-tab-default ((t (:height 1))))))
 )

(use-package telephone-line
  :init
  (telephone-line-mode 1))

(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
