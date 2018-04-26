(add-hook 'prog-mode-hook #'(lambda() (modify-syntax-entry ?_ "w")))
(use-package vimrc-mode)
(unless (fboundp 'conf-toml-mode)
  (use-package toml-mode))

;; (use-package editorconfig
;;   :diminish editorconfig-mode
;;   :init (add-hook 'after-init-hook #'editorconfig-mode))

(defun buffer-too-big-p ()
  (or (> (buffer-size) (* 5000 80))
      (> (line-number-at-pos (point-max)) 5000)))
(add-hook 'prog-mode-hook
          (lambda ()
            ;; turn off `linum-mode' when there are more than 5000 lines
            (if (buffer-too-big-p) (linum-mode -1))))

(provide 'init-prog)
