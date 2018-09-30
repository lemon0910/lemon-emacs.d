(use-package evil)
(evil-mode 1)

(use-package evil-search-highlight-persist
  :init
  (add-hook 'after-init-hook '(lambda()
                                (global-evil-search-highlight-persist t))))

(use-package general)
(define-key evil-normal-state-map (kbd "SPC") (general-simulate-key "C-c"))

(general-define-key
 :states '(normal visual)
 :prefix ","
  "ww"  'save-buffer
  "q"  'save-buffers-kill-terminal
  "Q"  'lemon-kill-emacs
  "bd"  'lemon-kill-this-buffer
  "bm"  'lemon-kill-other-buffers
  "ba"  'lemon-kill-all-buffers
  "k"   'symbol-overlay-put
  "dr"  'dired
  "sc"  'lemon-no-hlsearch
  "aa"  'c-open-relational-file
  "cc"  'comment-dwim-2
  "wd"  'delete-window
  "gs"  'magit-status
  "gm"  'magit-dispatch-popup
  "`"   'switch-to-previous-buffer
  "o"   'ace-window
  "gb"  'magit-blame
  "u"   'undo-tree-visualizer-mode
)

(general-define-key
 :prefix "C-c"
 "j" 'avy-goto-line-below
 "k" 'avy-goto-line-above
 "hk" 'describe-key
 "hf" 'describe-function
 "hv" 'describe-variable
 "R" 'lemon-rename-current-buffer-file
 "K" 'lemon-delete-current-buffer-file
 "n" 'global-display-line-numbers-mode
 "oc" 'occur
 "ff" 'lemon-fzf
 )

(general-define-key
 :states '(normal visual)
 "s" 'avy-goto-char-timer
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 "H" 'mwim-beginning-of-code-or-line
 "L" 'mwim-end-of-code-or-line
 "f" 'avy-goto-char-in-line
 "gd" 'counsel-etags-find-tag-at-point
 "gb" 'pop-tag-mark
 "<tab>" 'awesome-tab-forward-tab
 "TAB" 'awesome-tab-forward-tab
 "<backtab>" 'awesome-tab-backward-tab)

(cond
 ((eq my-completion 'ivy)
  (general-define-key
   :states '(normal visual)
   :prefix ","
   "ff"  'counsel-find-file
   "fg"  'counsel-git
   "ft"  'counsel-imenu
   "fr"  'counsel-recentf
   "fa"  'counsel-etags-find-tag
   "ag"  'lemon-ag
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

;; esc quits
(provide 'init-evil)
