(defconst lemon-c-style
  '((c-backslash-column . 70)
    (c-basic-offset . 2)
    (c-cleanup-list scope-operator)
    (c-comment-only-line-offset . 0)
    (c-electric-pound-behavior)
    (c-hungry-delete-key t)
    (c-hanging-braces-alist
     (brace-list-open)
     (brace-entry-open)
     (substatement-open after)
     (block-close . c-snug-do-while)
     (extern-lang-open after)
     (inexpr-class-close before))
    (c-hanging-colons-alist)
    (c-hanging-comment-starter-p . t)
    (c-hanging-comment-ender-p . t)
    (c-offsets-alist
     (string . c-lineup-dont-change)
     (c . c-lineup-C-comments)
     (defun-open . 0)
     (defun-close . 0)
     (defun-block-intro . +)
     (class-open . 0)
     (class-close . 0)
     (inline-open . 0)
     (inline-close . 0)
     (func-decl-cont . +)
     (knr-argdecl-intro . +)
     (knr-argdecl . 0)
     (topmost-intro . 0)
     (topmost-intro-cont . +)
     (member-init-intro . +)
     (member-init-cont . 0)
     (inher-intro . +)
     (inher-cont . c-lineup-multi-inher)
     (block-open . 0)
     (block-close . 0)
     (brace-list-open . 0)
     (brace-list-close . 0)
     (brace-list-intro . +)
     (brace-list-entry . 0)
     (brace-entry-open . 0)
     (statement . 0)
     (statement-cont . +)
     (statement-block-intro . +)
     (statement-case-intro . +)
     (statement-case-open . 0)
     (substatement . +)
     (substatement-open . 0)
     (case-label . +)
     (access-label . -)
     (label . 2)
     (do-while-closure . 0)
     (else-clause . 0)
     (catch-clause . 0)
     (comment-intro . c-lineup-comment)
     (arglist-intro . +)
     (arglist-cont . 0)
     (arglist-cont-nonempty . c-lineup-arglist)
     (arglist-close . +)
     (stream-op . c-lineup-streamop)
     (inclass . +)
     (cpp-macro . -)
     (cpp-macro-cont . c-lineup-dont-change)
     (friend . 0)
     (objc-method-intro . -1000)
     (objc-method-args-cont . c-lineup-ObjC-method-args)
     (objc-method-call-cont . c-lineup-ObjC-method-call)
     (extern-lang-open . 0)
     (extern-lang-close . 0)
     (inextern-lang . +)
     (namespace-open . 0)
     (namespace-close . 0)
     (innamespace . 0)
     (template-args-cont . ++)
     (inlambda . c-lineup-inexpr-block)
     (lambda-intro-cont . +)
     (inexpr-statement . 0)
     (inexpr-class . +)))
  "lemon Programming Style")

(defun lemon-c-mode-common-hook ()
  (c-add-style "lemon-c" lemon-c-style t)
  (c-set-style "lemon-c")
  (c-set-offset 'member-init-intro '++)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)	;; use spaces instead of tabs
  ;; (c-toggle-auto-state 1)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent))

(use-package cc-mode
  :ensure nil
  :init
  (add-hook 'c-mode-common-hook #'lemon-c-mode-common-hook)
  :config
  ;; Company mode backend for C/C++ header files
  (use-package company-c-headers
    :init (add-to-list 'company-backends (company-backend-with-yas 'company-c-headers))
    :after company))

(when my-lsp
  (defun ccls//enable ()
    (condition-case nil
        (lsp-ccls-enable)
      (user-error nil)))

  (use-package ccls
    :commands lsp-ccls-enable
    :init (add-hook 'c-mode-common-hook #'(lambda()
                                            (ignore-errors (ccls//enable))))
    :config
    (setq ccls-executable "/usr/local/bin/ccls")
    (setq ccls-extra-init-params '(:cacheFormat "msgpack"))))

(when (and more-feature (not my-lsp))
  ;; git clone https://github.com/Valloric/ycmd.git
  ;; cd ycmd && git submodule --init --recursive && ./build.py --all
  (use-package ycmd
    :init
    (add-hook 'c-mode-common-hook 'ycmd-mode)
    :config
    ;; (set-variable 'ycmd-global-config "/path/to/global_config.py")
    (set-variable 'ycmd-server-command `("python" ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
    (set-variable 'ycmd-global-config (file-truename "~/.emacs.d/ycmd/examples/.ycm_extra_conf.py"))
    (use-package company-ycmd)
    (company-ycmd-setup)))

(provide 'init-c)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-c.el ends here
