(add-hook 'prog-mode-hook #'(lambda() (modify-syntax-entry ?_ "w")))

(use-package vimrc-mode)

(unless (fboundp 'conf-toml-mode)
  (use-package toml-mode))

(provide 'init-prog)
