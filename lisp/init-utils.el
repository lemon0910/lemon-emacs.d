;;; Code:

(eval-when-compile
  (require 'init-const)
  (require 'init-custom))

(use-package elpa-mirror
  :config
  (setq elpamr-default-output-directory "~/.emacs.d/myelpa/"))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package magit
  :init
  (add-hook 'magit-blame-mode-hook
            (lambda ()
              (setq magit-blame--style '(headings (heading-format . "%H %-20a %C %s\n")))))
  :config
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (defun magit-quit-session ()
    "Restores the previous window configuration and kills the magit buffer"
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen))

  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session))

(use-package find-file-in-project
  :config
  (setq ffip-project-root current-directory))

(provide 'init-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-utils.el ends here
