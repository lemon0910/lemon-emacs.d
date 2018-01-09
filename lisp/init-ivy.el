;;; Code:

(use-package counsel
  :diminish ivy-mode counsel-mode
  :init (add-hook 'after-init-hook
                  (lambda ()
                    (ivy-mode 1)
                    (counsel-mode 1)))
  :config
  (setq enable-recursive-minibuffers t) ; Allow commands in minibuffers

  (setq ivy-use-selectable-prompt t)
  (setq ivy-use-virtual-buffers t)    ; Enable bookmarks and recentf
  (setq ivy-height 10)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-on-del-error-function nil)

  (setq ivy-re-builders-alist
        '((read-file-name-internal . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))

  (setq swiper-action-recenter t)
  (setq counsel-find-file-at-point t)
  (setq counsel-yank-pop-separator "\n-------\n")

  ;; Use faster search tools: ripgrep or the silver search
  (let ((command
         (cond
          ((executable-find "ag")
           "ag -i --noheading --nocolor --nofilename --numbers '%s' %s"))))
    (setq counsel-grep-base-command command))

  ;; Integration with `projectile'
  (with-eval-after-load 'projectile
    (setq projectile-completion-system 'ivy))

  ;; Integration with `magit'
  (with-eval-after-load 'magit
    (setq magit-completing-read-function 'ivy-completing-read))

  ;; Additional key bindings for Ivy
  (use-package ivy-hydra)

  ;; More friendly display transformer for Ivy
  (use-package ivy-rich
    :init
    (setq ivy-virtual-abbreviate 'full
          ivy-rich-switch-buffer-align-virtual-buffer t)
    (setq ivy-rich-path-style 'abbrev)

    (ivy-set-display-transformer 'ivy-switch-buffer
                                 'ivy-rich-switch-buffer-transformer)

    (with-eval-after-load 'counsel-projectile
      (ivy-set-display-transformer 'counsel-projectile
                                   'ivy-rich-switch-buffer-transformer)
      (ivy-set-display-transformer 'counsel-projectile-switch-to-buffer
                                   'ivy-rich-switch-buffer-transformer)))

  ;; Ivy integration for Projectile
  (use-package counsel-projectile
    :init (counsel-projectile-mode 1))

  ;; Ivy for GNU global
  (use-package counsel-etags)

  ;; Support pinyin in Ivy
  ;; Input prefix '!' to match pinyin
  ;; Refer to  https://github.com/abo-abo/swiper/issues/919 and
  ;; https://github.com/pengpengxp/swiper/wiki/ivy-support-chinese-pinyin
  (use-package pinyinlib
    :commands pinyinlib-build-regexp-string
    :init
    (defun re-builder-pinyin (str)
      (or (pinyin-to-utf8 str)
          (ivy--regex-plus str)
          (ivy--regex-ignore-order str)))

    (setq ivy-re-builders-alist
          '((t . re-builder-pinyin)))

    (defun my-pinyinlib-build-regexp-string (str)
      (cond ((equal str ".*")
             ".*")
            (t
             (pinyinlib-build-regexp-string str t))))

    (defun my-pinyin-regexp-helper (str)
      (cond ((equal str " ")
             ".*")
            ((equal str "")
             nil)
            (t
             str)))

    (defun pinyin-to-utf8 (str)
      (cond ((equal 0 (length str))
             nil)
            ((equal (substring str 0 1) "!")
             (mapconcat 'my-pinyinlib-build-regexp-string
                        (remove nil (mapcar 'my-pinyin-regexp-helper
                                            (split-string
                                             (replace-regexp-in-string "!" "" str ) "")))
                        ""))
            (t
             nil))))
  )

(provide 'init-ivy)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
