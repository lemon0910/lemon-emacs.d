;;; Code:

(use-package counsel
  :diminish ivy-mode counsel-mode
  :bind (
         :map ivy-minibuffer-map
         ([escape] . minibuffer-keyboard-quit)
         :map swiper-map
         ([escape] . minibuffer-keyboard-quit)
         )
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

  (setq ivy-display-style 'fancy)

  (setq magit-completing-read-function 'ivy-completing-read)
  ;; Use faster search tools: ripgrep or the silver search
  (let ((command
         (cond
          ((executable-find "ag")
           "ag -i --noheading --nocolor --nofilename --numbers '%s' %s"))))
    (setq counsel-grep-base-command command))

  ;; Additional key bindings for Ivy
  (use-package ivy-hydra)

  ;; Ivy for GNU global
  (use-package counsel-etags)

  )

(provide 'init-ivy)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ivy.el ends here
