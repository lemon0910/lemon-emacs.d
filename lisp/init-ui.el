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

;; Theme
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
 ((eq my-theme 'daylight)
  (use-package leuven-theme
    :init (load-theme 'leuven t)))
 ((eq my-theme 'doom-one-light)
  (load-theme 'doom-one-light t))
 ((eq my-theme 'moe)
  (progn
    (add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/moe-theme.el/")
    (add-to-list 'load-path "~/.emacs.d/site-lisp/moe-theme.el/")
    (require 'moe-theme)
    (load-theme 'moe-dark t)
    )))

;; (use-package spaceline-config
;;   :ensure spaceline
;;   :commands spaceline-spacemacs-theme
;;   :init (add-hook 'after-init-hook #'spaceline-spacemacs-theme)
;;   :config
;;   (setq spaceline-pre-hook #'powerline-reset) ; Fix for changing themes
;;   (setq powerline-default-separator (if window-system 'slant 'utf-8))
;;   (setq powerline-image-apple-rgb sys/mac-x-p))

;; Fonts
; (use-package cnfonts
  ; :init
  ; (add-hook 'after-init-hook #'cnfonts-enable)
  ; :config
  ; (setq cnfonts-keep-frame-size nil)
  ; (setq cnfonts-use-cache t)
  ; (setq cnfonts-profiles
        ; '("program1" "program2" "program3" "org-mode" "read-book"))
  ; (setq cnfonts--profiles-steps '(("program1" . 4)
                                  ; ("program2" . 5)
                                  ; ("program3" . 3)
                                  ; ("org-mode" . 6)
                                  ; ("read-book" . 8))))

;; (use-package telephone-line
;;   :init
;;   (setq telephone-line-lhs
;;         '((evil   . (telephone-line-evil-tag-segment))
;;           (accent . (telephone-line-vc-segment
;;                      telephone-line-erc-modified-channels-segment
;;                      telephone-line-process-segment))
;;           (nil    . (telephone-line-minor-mode-segment
;;                      telephone-line-buffer-segment))))
;;   (setq telephone-line-rhs
;;         '((nil    . (telephone-line-misc-info-segment))
;;           (accent . (telephone-line-major-mode-segment))
;;           (evil   . (telephone-line-airline-position-segment))))
;;   (add-hook 'after-init-hook #'(lambda()
;;                                  (telephone-line-mode 1))))
;; Line and Column
(setq-default fill-column 80)
(setq column-number-mode t)
(setq line-number-mode t)

; Show native line numbers if possible, otherwise use linum
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

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
