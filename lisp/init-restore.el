;; Save and restore status
(use-package desktop
  :ensure nil
  :init (desktop-save-mode 1)
  :config
  ;; Restore frames into their original displays (if possible)
  (setq desktop-restore-in-current-display nil)

  ;; Load custom theme
  (add-hook 'desktop-after-read-hook
            (lambda ()
              (dolist (theme custom-enabled-themes)
                (load-theme theme t))))

  ;; Don't save/restore frames in tty
  (unless (display-graphic-p)
    (setq desktop-restore-frames nil)))

(provide 'init-restore)
