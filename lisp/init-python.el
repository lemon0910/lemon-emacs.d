;; Code:

;; Python Mode

(defun lemon-python-mode-hook()
  (with-eval-after-load 'company
    (add-to-list 'company-backends (company-backend-with-yas 'company-jedi))))

(use-package python
  :ensure nil
  :defines gud-pdb-command-name pdb-path
  :config
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)

  (add-hook 'inferior-python-mode-hook
            (lambda ()
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
    :init (add-hook 'python-mode-hook #'py-autopep8-enable-on-save))

  ;; Anaconda mode
  ;; (use-package anaconda-mode
  ;;   :diminish anaconda-mode
  ;;   :init
  ;;   (add-hook 'python-mode-hook #'anaconda-mode)
  ;;   (add-hook 'python-mode-hook #'anaconda-eldoc-mode)
  ;;   :config
  ;;   (with-eval-after-load 'company
  ;;     (use-package company-anaconda
  ;;       :defines company-backends
  ;;       :init (add-to-list 'company-backends (company-backend-with-yas 'company-anaconda))))))
  (use-package company-jedi
    :init
    (add-hook 'python-mode-hook #'lemon-python-mode-hook)
    :config
    (setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.python-environments/")))
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:complete-on-dot t)
    (setq jedi:use-shortcuts t)))

(provide 'init-python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here
