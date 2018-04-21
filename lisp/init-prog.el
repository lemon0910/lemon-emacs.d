(add-hook 'prog-mode-hook #'(lambda() (modify-syntax-entry ?_ "w")))
(use-package vimrc-mode)
(unless (fboundp 'conf-toml-mode)
  (use-package toml-mode))

;; (use-package editorconfig
;;   :diminish editorconfig-mode
;;   :init (add-hook 'after-init-hook #'editorconfig-mode))

(provide 'init-prog)
