;; C/C++ Mode
(use-package cc-mode
  :ensure nil
  :init
  (add-hook 'c-mode-common-hook
            (lambda ()
              (c-set-style "bsd")
              (setq tab-width 2)
              (setq c-basic-offset 2))))

  :config
  ;; Company mode backend for C/C++ header files
  (with-eval-after-load 'company
    (use-package company-c-headers))

(provide 'init-c)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-c.el ends here
