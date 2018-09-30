;;; Code:

;; Highlight the current line
;; (use-package hl-line
;;   :ensure nil
;;   :init (add-hook 'after-init-hook #'global-hl-line-mode))

;; Highlight symbols
(use-package symbol-overlay)
(global-hl-line-mode t)
;; 设置高亮当前行，在终端默写情况下高亮不明显，需要自己设置
;; (set-face-background 'hl-line "#434343")

(provide 'init-highlight)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-highlight.el ends here
