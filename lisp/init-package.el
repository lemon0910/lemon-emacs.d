;;; Code:

(eval-when-compile (require 'init-custom))

;; FIXME: DO NOT copy package-selected-packages to init/custom file forcibly.
;; https://github.com/jwiegley/use-package/issues/383#issuecomment-247801751
(with-eval-after-load 'package
  (defun package--save-selected-packages (&optional value)
    "Set and (don't!) save `package-selected-packages' to VALUE."
    (when value
      (setq package-selected-packages value))
    (unless after-init-time
      (add-hook 'after-init-hook #'package--save-selected-packages))))

;;
;; ELPA: refer to https://elpa.emacs-china.org/
;;
(defvar-local package-archives-list '(melpa emacs-china tuna))
(defun switch-package-archives (archives)
  "Switch to specific package ARCHIVES repository."
  (interactive
   (list
    (intern (completing-read "Switch to archives: "
                             package-archives-list))))
  (cond
   ((eq my-package-archives 'melpa)
    (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                             ("melpa" . "http://melpa.org/packages/"))))
   ((eq my-package-archives 'emacs-china)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                             ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
   ((eq my-package-archives 'tuna)
    (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                             ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))))

(switch-package-archives my-package-archives)

;; Initialize packages
(setq package-enable-at-startup nil)    ; To prevent initialising twice
(package-initialize)

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq use-package-expand-minimally t)
(setq use-package-enable-imenu-support t)

;; Required by `use-package'
(use-package diminish)
(use-package bind-key)

;; A mondern package interface
(use-package paradox
  :init (defalias 'upgrade-packages 'paradox-upgrade-packages)
  :config
  (setq paradox-github-token t)
  (setq paradox-execute-asynchronously t)
  (setq paradox-automatically-star nil)
  (setq paradox-display-star-count nil))

(provide 'init-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-package.el ends here
