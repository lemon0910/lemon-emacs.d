(when (version< emacs-version "24.4")
  (error "This requires Emacs 24.4 and above!"))

;; Optimize loading performance
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 30000000)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after init"
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold 800000)))

;; Prefers the newest version of a file
(setq load-prefer-newer t)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; Load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(setq my-saved-launch-directory default-directory)
(setq my-company-backend-with-yas t)
(setq more-feature t)
(setq my-completion 'ivy)

;; Constants
(require 'init-const)

;; Customization
(require 'init-custom)

;; Packages
;; Without this comment Emacs25 adds (package-initialize) here
;; (package-initialize)
(require 'init-package)

;; Preferences
(require 'init-basic)
(require 'init-ui)

(require 'init-evil)
(require 'init-edit)

(cond
 ((eq my-completion 'ivy)
  (require 'init-ivy))
 ((eq my-completion 'helm)
  (require 'init-helm)))

(require 'init-company)

(require 'init-dired)
(require 'init-highlight)
(require 'init-window)

(require 'init-funcs)
(require 'init-utils)

;; Programming
(require 'init-yasnippet)
(require 'init-prog)
(require 'init-lisp)
(require 'init-c)
(require 'init-go)
(require 'init-markdown)
(require 'init-python)

(require 'init-eshell)
(require 'init-gdb)
(require 'init-restore)
