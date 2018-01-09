(use-package evil-leader
  :config
   (evil-leader/set-leader ","))

(use-package evil)

(global-evil-leader-mode)
(evil-mode 1)

(evil-leader/set-key
  "o"  'counsel-find-file
  "ff"  'counsel-fzf
  "fg"  'counsel-git
  "ft"  'imenu
  "ag"  'counsel-ag
  "ww"  'save-buffer
  "bd"  'kill-buffer
  "qq"  'save-buffers-kill-terminal
  "bb"  'ibuffer
  ","   'counsel-M-x
  "k"   'symbol-overlay-put
  "K"   'symbol-overlay-remove-all
  "ss"  'swiper
  "as"  'swiper-all
  "fr"  'counsel-recentf)

(provide 'init-vim)
