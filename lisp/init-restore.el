;; Save and restore status
(when more-feature
  (use-package desktop
    :ensure nil
    :init (desktop-save-mode 1)
    :config
    ;; Restore frames into their original displays (if possible)
    (setq desktop-restore-in-current-display nil)

    ;; Don't save/restore frames in tty
    (unless (display-graphic-p)
      (setq desktop-restore-frames nil))))

(provide 'init-restore)
