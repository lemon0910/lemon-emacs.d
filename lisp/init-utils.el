;;; Code:

(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

;; Discover key bindings and their meaning for the current Emacs major mode
(use-package discover-my-major
  :bind (("C-h M-m" . discover-my-major)
         ("C-h M-M" . discover-my-mode)))

;; Log keyboard commands to buffer
(use-package command-log-mode
  :diminish (command-log-mode . "¢")
  :init (setq command-log-mode-auto-show t))

;; A Simmple and cool pomodoro timer
;; Misc
(use-package diffview)                  ; side-by-side diff view
(use-package esup)                      ; Emacs startup profiler
(use-package fontawesome)
(use-package elpa-mirror
  :config
  (setq elpamr-default-output-directory "~/.emacs.d/myelpa/"))
(use-package fzf)

(provide 'init-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-utils.el ends here
