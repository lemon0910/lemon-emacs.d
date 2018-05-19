(use-package evil-leader
  :config
   (evil-leader/set-leader ","))

(use-package evil)
(use-package evil-search-highlight-persist)

(global-evil-leader-mode)
(evil-mode 1)
(global-evil-search-highlight-persist t)
(setq evil-leader/in-all-states 1)

; (add-hook 'evil-normal-state-entry-hook 'linum-relative-on)
; (add-hook 'evil-insert-state-entry-hook 'linum-relative-off)

(evil-leader/set-key
  "ff"  'helm-find-files
  "fg"  'helm-ls-git-ls
  "ft"  'helm-imenu
  "ag"  'helm-do-ag
  "ww"  'save-buffer
  "q"  'save-buffers-kill-terminal
  "Q"  'lemon/kill-emacs
  "bb"  'helm-mini
  "bd"  'lemon/kill-this-buffer
  "bm"  'lemon/kill-other-buffers
  "ba"  'lemon/kill-all-buffers
  ","   'helm-M-x
  "k"   'symbol-overlay-put
  "K"   'symbol-overlay-remove-all
  "dr"  'dired
  "ss"  'helm-swoop
  "sc"  'evil-search-highlight-persist-remove-all
  "aa"  'c-open-relational-file
  "cc"  'comment-dwim-2
  "wd"  'delete-window
  "gs"  'magit-status
  "gm"  'magit-dispatch-popup
  "`"   'switch-to-previous-buffer
  "o"   'ace-window
)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "H") 'mwim-beginning-of-code-or-line)
(define-key evil-normal-state-map (kbd "L") 'mwim-end-of-code-or-line)
(define-key evil-normal-state-map (kbd "<SPC>s") 'evil-avy-goto-char)
(define-key evil-normal-state-map (kbd "gb") 'evil-jump-backward)
(define-key evil-normal-state-map (kbd "C-b") (lambda ()
                                                (interactive)
                                                (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-f") (lambda ()
                                                (interactive)
                                                (evil-scroll-down nil)))
;; esc quits
(provide 'init-evil)
