(add-hook 'gdb-mode-hook #'(lambda()
                            (setq gdb-many-windows t)
                            (global-display-line-numbers-mode +1)))

(provide 'init-gdb)
