(use-package evil)
(evil-mode 1)
(use-package evil-search-highlight-persist
  :init
  (add-hook 'after-init-hook '(lambda()
                                (global-evil-search-highlight-persist t))))

(use-package general)
(define-key evil-normal-state-map (kbd "SPC") (general-simulate-key "C-c"))
(when more-feature
  (add-hook 'evil-insert-state-entry-hook #'lemon-absolute-line-number)
  (add-hook 'evil-insert-state-exit-hook #'lemon-relative-line-number))

(use-package evil-magit)

(general-define-key
 :states '(normal visual)
 :prefix ","
  "ww"  'save-buffer
  "q"  'save-buffers-kill-terminal
  "Q"  'lemon/kill-emacs
  "bd"  'lemon/kill-this-buffer
  "bm"  'lemon/kill-other-buffers
  "ba"  'lemon/kill-all-buffers
  "k"   'symbol-overlay-put
  "K"   'symbol-overlay-remove-all
  "dr"  'dired
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

(general-define-key
 :prefix "C-c"
 "n" 'display-line-numbers-mode
 "s" 'avy-goto-char-2
 "j" 'avy-goto-line-below
 "k" 'avy-goto-line-above
 "f" 'avy-goto-char)

(general-define-key
 :states '(normal visual)
 "s" 'avy-goto-char-2
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 "H" 'mwim-beginning-of-code-or-line
 "L" 'mwim-end-of-code-or-line
 "gd" 'counsel-etags-find-tag-at-point
 "gb" 'pop-tag-mark)

(cond
 ((eq my-completion 'ivy)
  (general-define-key
   :states '(normal visual)
   :prefix ","
   "ff"  'counsel-find-file
   "fg"  'counsel-git
   "fz"  'my-fzf
   "ft"  'counsel-imenu
   "fr"  'counsel-recentf
   "fa"  'counsel-etags-find-tag
   "ag"  'my-ag
   "bb"  'ivy-switch-buffer
   ","   'counsel-M-x
   "ss"  'swiper
   ))
 ((eq my-completion 'helm)
  (general-define-key
   :states '(normal visual)
   :prefix ","
   "ff" 'helm-find-files
   "fg" 'helm-ls-git-ls
   "ft" 'helm-imenu
   "ag" 'helm-do-ag
   "bb" 'helm-mini
   ","  'helm-M-x
   "ss" 'helm-swoop)))

(when my-lsp
  (general-define-key
   :states '(normal visual)
   :keymaps 'ccls-tree-mode-map
   "f" 'ccls-tree-press
   "q" 'ccls-tree-quit
   "Q" 'quit-window
   "RET" 'ccls-tree-press-and-switch))

;; esc quits
(provide 'init-evil)
