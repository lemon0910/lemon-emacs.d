;;; Code:

(use-package helm
  :bind (
      :map helm-map
         ([escape] . helm-keyboard-quit)
)  
  :config
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t))

(use-package helm-ag)
(use-package helm-swoop)
(use-package helm-ls-git)
(use-package helm-gtags)
(helm-mode 1)

(provide 'init-helm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
