(when (version< emacs-version "26.1")
  (error "This requires Emacs 26.1 and above!"))

;; Optimize loading performance
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 80000000)

(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after init"
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold 800000)
            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function
                              (lambda()
                                (unless (frame-focus-state)
                                  (garbage-collect))))
              (add-hook 'focus-out-hokk 'garbage-collect))))

;; Load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; set my own configuration
(with-temp-message ""                   ;抹掉插件启动的输出
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
  (require 'init-funcs)
  (require 'init-utils)
  (require 'init-ui)
  (require 'init-eshell)

  (require 'init-evil)
  (require 'init-edit)

  (require 'init-helm)
  (require 'init-company)
  (require 'init-dired)
  (require 'init-window)

  ;; Programming
  (require 'init-prog)
  (require 'init-lisp)
  (require 'init-c)
  (require 'init-go)
  (require 'init-python))
