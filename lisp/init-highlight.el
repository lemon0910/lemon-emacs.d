;;; Code:

;; Highlight the current line
;; (use-package hl-line
;;   :ensure nil
;;   :init (add-hook 'after-init-hook #'global-hl-line-mode))

;; Highlight symbols
(use-package symbol-overlay)
(global-hl-line-mode t)
;; (set-face-background 'hl-line "#434343")

(provide 'init-highlight)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-highlight.el ends here
