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

  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  (evil-define-key 'normal magit-blame-read-only-mode-map (kbd "c") 'magit-blame-cycle-style))

(use-package find-file-in-project
  :config
  (setq ffip-project-root current-directory))

(use-package projectile
  :commands projectile-project-p)

(use-package awesome-tab
  :load-path "site-lisp/awesome-tab"
  :init
  (require 'awesome-tab)
  (awesome-tab-mode t)
  (defun awesome-tab-theme ()
    (custom-set-variables
     '(tabbar-background-color "black")
     )
    (custom-set-faces
     '(awesome-tab-selected ((t (:inherit awesome-tab-default :foreground "#00ccff" :overline "green3" :weight ultra-bold :width semi-expanded))))
     '(awesome-tab-unselected ((t (:inherit awesome-tab-default :foreground "dark grey" :overline "dark green"))))
     '(awesome-tab-default ((t (:height 1))))))
  (awesome-tab-theme))

(provide 'init-utils)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-utils.el ends here
