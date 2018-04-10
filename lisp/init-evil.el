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
  "fz"   'counsel-fzf
  "fg"  'counsel-git
  "cg"  'cgounsel-git-grep
  "ft"  'counsel-imenu
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
  "as"  'swiper-all 
  "cc"  'comment-dwim-2
  "wd"  'delete-window
  "wh"  'evil-window-left
  "wl"  'evil-window-right
  "wj"  'evil-window-down
  "wk"  'evil-window-up
  "gs"  'magit-status
  "gm"  'magit-dispatch-popup
  "`"   'switch-to-previous-buffer
)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "H") 'mwim-beginning-of-code-or-line)
(define-key evil-normal-state-map (kbd "L") 'mwim-end-of-code-or-line)
(define-key evil-normal-state-map (kbd "<SPC>s") 'evil-avy-goto-char)
(define-key evil-normal-state-map (kbd "gd") 'counsel-etags-find-tag-at-point)
(define-key evil-normal-state-map (kbd "gb") 'evil-jump-backward)
(define-key evil-normal-state-map (kbd "C-b") (lambda ()
                                                (interactive)
                                                (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-f") (lambda ()
                                                (interactive)
                                                (evil-scroll-down nil)))

;; esc quits
(provide 'init-evil)
