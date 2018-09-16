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
              (setq magit-blame--style
                    '(margin
                      (margin-format " %s%f" " %C %a" " %H")
                      (margin-width . 42)
                      (margin-face . magit-blame-margin)
                      (margin-body-face magit-blame-dimmed)))))
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

  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  (evil-define-key 'normal 'magit-blame-read-only-mode-map (kbd "RET") 'magit-show-commit)
  (evil-define-key 'normal 'magit-blame-read-only-mode-map (kbd "<return>") 'magit-show-commit))

(use-package find-file-in-project
  :config
  (setq ffip-project-root current-directory))

(provide 'init-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-utils.el ends here
