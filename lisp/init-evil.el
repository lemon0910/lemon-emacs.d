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
  "ff"  'counsel-find-file
  "fg"  'counsel-git
  "fz"  'my-fzf
  "ft"  'counsel-imenu
  "fr"  'counsel-recentf
  "fa"  'counsel-etags-find-tag
  "ag"  'counsel-ag
  "ww"  'save-buffer
  "q"  'save-buffers-kill-terminal
  "Q"  'lemon/kill-emacs
  "bb"  'ivy-switch-buffer
  "bd"  'lemon/kill-this-buffer
  "bm"  'lemon/kill-other-buffers
  "ba"  'lemon/kill-all-buffers
  ","   'counsel-M-x
  "k"   'symbol-overlay-put
  "K"   'symbol-overlay-remove-all
  "dr"  'dired
  "ss"  'swiper
  "sc"  'evil-search-highlight-persist-remove-all
  "aa"  'c-open-relational-file
  "cc"  'comment-dwim-2
  "wd"  'delete-window
  "gs"  'magit-status
  "gm"  'magit-dispatch-popup
  "`"   'switch-to-previous-buffer
  "o"   'ace-window
  "gb"  'magit-blame
)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "H") 'mwim-beginning-of-code-or-line)
(define-key evil-normal-state-map (kbd "L") 'mwim-end-of-code-or-line)
(define-key evil-normal-state-map (kbd "<SPC>s") 'evil-avy-goto-char)
(define-key evil-normal-state-map (kbd "gd") 'counsel-etags-find-tag-at-point)
(define-key evil-normal-state-map (kbd "gb") 'evil-jump-backward)
(global-set-key (kbd "C-c n") 'display-line-numbers-mode)
;; esc quits
(provide 'init-evil)
