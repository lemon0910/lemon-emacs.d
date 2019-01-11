;;; Code:

;; Highlight the current line

;; Highlight symbols
(use-package symbol-overlay)
(global-hl-line-mode t)

(when (eq my-theme 'doom)
  (set-face-background 'hl-line "#434343"))

(provide 'init-highlight)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-highlight.el ends here
