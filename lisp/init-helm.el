;;; Code:

(use-package helm
  :bind (
      :map helm-map
         ([escape] . helm-keyboard-quit)
)  
  :config
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-locate-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-semantic-fuzzy-match t)
  (setq helm-imenu-fuzzy-match t)
  (setq helm-apropos-fuzzy-match t)
  (setq helm-lisp-fuzzy-completion t)
  (setq helm-session-fuzzy-match t)
  (setq helm-etags-fuzzy-match t)
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(use-package helm-ag)
(use-package helm-swoop)
(use-package helm-ls-git)
(use-package helm-etags-plus)
(helm-mode 1)

(provide 'init-helm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
