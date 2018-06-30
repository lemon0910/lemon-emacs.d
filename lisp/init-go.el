;;; Code:

;; Golang
;;
;; Go packages:
;; go get -u github.com/nsf/gocode
;; go get -u github.com/rogpeppe/godef
;; go get -u github.com/golang/lint/golint
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u golang.org/x/tools/cmd/guru
;; go get -u golang.org/x/tools/cmd/gorename
;; go get -u golang.org/x/tools/cmd/godoc
;; go get -u github.com/derekparker/delve/cmd/dlv
;; go get -u github.com/josharian/impl
;; go get -u github.com/cweill/gotests/...
;; go get -u github.com/fatih/gomodifytags
;; go get -u github.com/davidrjenni/reftools/cmd/fillstruct
;;
(use-package go-mode
  :config
  ;; `goimports' or `gofmt'
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save)

  (use-package go-eldoc
    :hook (go-mode . go-eldoc-setup))

  (use-package go-guru)

  (with-eval-after-load 'company
    (use-package company-go
      :init (cl-pushnew (company-backend-with-yas 'company-go) 'company-backends))))

(general-define-key
 :states '(normal visual)
 :keymaps 'go-mode-map
 "gd" 'godef-jump
 "gr" 'go-guru-referrers)

(provide 'init-go)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-go.el ends here
