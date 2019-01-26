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

(use-package awesome-tab
  :load-path "site-lisp/tab"
  :init
  (require 'awesome-tab)
  (awesome-tab-mode t)
  :config
  (defun awesome-tab-hide-tab-function (x)
  (let ((name (format "%s" x)))
    (and
     (not (string-prefix-p "*" name))
     (not (and (string-prefix-p "magit" name)
               (not (file-name-extension name))))
     )))
  :custom-face
  (awesome-tab-selected ((t (:foreground "#ff6188"))))
  (awesome-tab-unselected ((t (:foreground "#727072"))))
  (awesome-tab-default ((t (:height 1 :background "#000000")))))

;;Color Theme
(cond
 ((eq my-theme 'doom)
  (use-package doom-themes
    :preface (defvar region-fg nil)
    :init
    (load-theme 'doom-vibrant t)
    :config
    (doom-themes-visual-bell-config)
    (doom-themes-org-config)
    (use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-init)
      :config
      (size-indication-mode -1))))
 ((eq my-theme 'spacemacs)
  (use-package spacemacs-theme
    :init
    (load-theme 'spacemacs-dark t))
  (use-package spaceline
    :init
    (spaceline-spacemacs-theme)))
 (t
  (ignore-errors (load-theme my-theme t))))

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

;; highlight
(use-package symbol-overlay)
(global-hl-line-mode t)

(when (eq my-theme 'doom)
  (set-face-background 'hl-line "#434343"))

(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
