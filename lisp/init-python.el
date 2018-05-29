;;; Code:

;; Python Mode
(use-package python
  :ensure nil
  :defines gud-pdb-command-name pdb-path
  :config
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)

  (add-hook 'inferior-python-mode-hook
            (lambda ()
              (bind-key "C-c C-z"
                        'kill-buffer-and-window inferior-python-mode-map)
              (process-query-on-exit-flag (get-process "Python"))))

  ;; Pdb setup, note the python version
  (setq pdb-path 'pdb
        gud-pdb-command-name (symbol-name pdb-path))
  (defadvice pdb (before gud-query-cmdline activate)
    "Provide a better default command line when called interactively."
    (interactive
     (list (gud-query-cmdline
            pdb-path
            (file-name-nondirectory buffer-file-name)))))

  ;; Autopep8
  (use-package py-autopep8
    :init (add-hook 'python-mode-hook #'py-autopep8-enable-on-save)))

(provide 'init-python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here
