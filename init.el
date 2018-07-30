(when (version< emacs-version "25.2")
  (error "This requires Emacs 25.2 and above!"))

;; Optimize loading performance
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 30000000)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after init"
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold 800000)))

;; Load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(dolist (dir_names (directory-files (expand-file-name "site-lisp" user-emacs-directory)))
  (if
    (not (or (string= dir_names ".") (string= dir_names "..")))
    (add-to-list 'load-path (expand-file-name dir_names))))

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))

;; set my own configuration
(setq my-saved-launch-directory default-directory)
(setq my-yas nil)
(setq more-feature t)
(setq my-completion 'ivy)
(setq my-lsp nil)

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

(require 'init-ivy)
(require 'init-company)
(require 'init-dired)
(require 'init-highlight)
(require 'init-window)

(require 'init-funcs)
(require 'init-utils)

;; Programming
(require 'init-prog)
(require 'init-lisp)
(require 'init-c)
(require 'init-go)
(require 'init-python)

(require 'init-eshell)
