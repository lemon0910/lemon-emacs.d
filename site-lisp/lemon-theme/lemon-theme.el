;;; Code:

(make-face 'mode-line-default-face)
(make-face 'mode-line-header)
(make-face 'tcl-substitution-char-face)

(custom-set-variables
   ;; lisp parentheses rainbow
    '(hl-paren-colors '("#326B6B"))
     '(hl-paren-background-colors
           '("#00FF99" "#CCFF99" "#FFCC99" "#FF9999" "#FF99CC"
                  "#CC99FF" "#9999FF" "#99CCFF" "#99FFCC" "#7FFF00"))
      ;; fill-column-indicator
       '(fci-rule-color "gray80")
        ;; marker
         '(highlight-symbol-colors
               '("#EFFF00" "#73CD4F" "#83DDFF" "MediumPurple1" "#66CDAA"
                      "DarkOrange" "HotPink1" "#809FFF" "#ADFF2F"))
          ;; org-mode code blocks
           '(org-src-block-faces '(("emacs-lisp" (:background "#F0FFF0")))))

(custom-set-faces
 '(default ((t (:foreground "#326B6B" :background "#c7edcc"))))
 '(cursor ((t (:background "#225522"))))
 '(hl-line ((t (:background "#A0F0A0" :inverse-video nil))))

 '(mode-line-default-face ((t (:foreground "#326B6B"))))
 '(mode-line-header ((t (:foreground "gray25" :weight bold))))

 ;; Highlighting faces
 '(fringe ((t (:background "#E5E5E5" :foreground "gray40"))))
 '(highlight ((t (:background "#D5F0D5"))))
 '(region ((t (:foreground "#326B6B" :background "#EEEEA0"))))
 '(cua-rectangle ((t (:foreground "#326B6B" :background ,"#BFFF00"))))
 '(secondary-selection ((t (:background "#8cc4ff"))))
 '(isearch ((t (:foreground "#326B6B" :background "yellow" :inverse-video nil))))
 '(lazy-highlight ((t (:background "#DDEE00" :inverse-video nil))))
 '(trailing-whitespace ((t (:background "#ef2929"))))

 ;; Mode line faces
 '(mode-line ((t (:box (:line-width -1 :style released-button)
                       :background "#d3d7cf" :foreground "#2e3436"))))
 '(mode-line-inactive ((t (:box (:line-width -1 :style released-button)
                                :background "#eeeeec" :foreground "#2e3436"))))

 ;; Escape and prompt faces
 '(minibuffer-prompt ((t (:weight bold :foreground "#204a87"))))
 '(escape-glyph ((t (:foreground "#00A86B"))))
 '(error ((t (:foreground "#a40000" :weight bold))))
 '(warning ((t (:foreground "#ce5c00"))))
 '(success ((t (:foreground "#4e9a06"))))

 ;; Font lock faces
 '(font-lock-builtin-face ((t (:foreground "#009292"))))
 '(font-lock-comment-face ((t (:foreground "gray50"))))
 '(font-lock-constant-face ((t (:foreground "#3465BD"))))
 '(font-lock-function-name-face ((t (:weight extra-bold :foreground "#3063EA")))) ;"blue" "#1155CF" "#3032FF" "#3063EA"
 '(font-lock-keyword-face ((t (:weight semi-bold :foreground "purple"))))
 '(font-lock-string-face ((t (:foreground "#119911"))) t) ; "ForestGreen"
 '(font-lock-type-face ((t (:foreground "#009292" :weight bold))))
 '(font-lock-variable-name-face ((t (:width condensed :foreground "DarkGoldenrod"))))
 '(font-lock-warning-face ((t (:foreground "#AA0000" :weight bold))))

 ;; Button and link faces
 '(link ((t (:underline t :foreground "#204a87"))))
 '(link-visited ((t (:underline t :foreground "#3465a4"))))

 ;; Jabber
 '(jabber-roster-user-chatty ((t (:inherit font-lock-type-face :bold tx))))
 '(jabber-roster-user-online ((t (:inherit font-lock-keyword-face :bold t))))
 '(jabber-roster-user-offline ((t (:foreground "#326B6B" :background "#F0FFF0"))))
 '(jabber-roster-user-away ((t (:inherit font-lock-doc-face))))
 '(jabber-roster-user-xa ((t (:inherit font-lock-doc-face))))
 '(jabber-roster-user-dnd ((t (:inherit font-lock-comment-face))))
 '(jabber-roster-user-error ((t (:inherit font-lock-warning-face))))

 '(jabber-title-small ((t (:height 1.2 :weight bold))))
 '(jabber-title-medium ((t (:inherit jabber-title-small :height 1.2))))
 '(jabber-title-large ((t (:inherit jabber-title-medium :height 1.2))))

 '(jabber-chat-prompt-local ((t (:inherit font-lock-string-face :bold t))))
 '(jabber-chat-prompt-foreign ((t (:inherit font-lock-function-name-face :bold nil))))
 '(jabber-chat-prompt-system ((t (:inherit font-lock-comment-face :bold t))))
 '(jabber-rare-time-face ((t (:inherit font-lock-function-name-face :bold nil))))

 '(jabber-activity-face ((t (:inherit jabber-chat-prompt-foreign))))
 '(jabber-activity-personal-face ((t (:inherit jabber-chat-prompt-local :bold t))))

 ;; LaTeX
 '(font-latex-bold-face ((t (:bold t :foreground "DarkOliveGreen"))))
 '(font-latex-italic-face ((t (:italic t :foreground "DarkOliveGreen"))))
 '(font-latex-math-face ((t (:foreground "DarkGoldenrod"))))
 '(font-latex-sedate-face ((t (:foreground "DimGray"))))
 '(font-latex-string-face ((t (nil))))
 '(font-latex-warning-face ((t (:bold t :weight semi-bold :foreground "#00CC00"))))

 ;; quack
 '(quack-pltish-paren-face ((((class color) (background light)) (:foreground "#53AD2F"))))
 '(quack-pltish-keyword-face ((t (:foreground "#A020F0" :weight bold))))

 ;; js2-mode
 '(js2-external-variable ((t (:foreground "DodgerBlue3"))))
 '(js2-function-param ((t (:foreground "#009292")))) ;"SeaGreen" "#00A86B"

 ;; clojure/CIDER
 '(cider-result-overlay-face ((t (:background "#F0FFF0" :box (:line-width -1 :color "#F0F0A1")))))

 ;; java
 '(jdee-java-properties-font-lock-comment-face ((t (:foreground "gray50"))))
 '(jdee-java-properties-font-lock-equal-face ((t (:foreground "DodgerBlue3"))))
 '(jdee-java-properties-font-lock-substitution-face ((t (:inherit font-lock-function-name-face :bold nil))))
 '(jdee-java-properties-font-lock-class-name-face ((t (:inherit font-lock-constant-face :bold nil))))
 '(jdee-java-properties-font-lock-value-face ((t (:inherit font-lock-string-face :bold nil))))
 '(jdee-java-properties-font-lock-backslash-face ((t (:foreground "#00A86B"))))

 ;; scala
 '(scala-font-lock:var-face ((t (:foreground "#ce5c00"))))
 '(ensime-result-overlay-face ((t (:background "#F0FFF0" :foreground "gray50" :box (:line-width -1 :color "#F0F0A1")))))

 ;; Tcl
 '(tcl-substitution-char-face ((t (:foreground "OliveDrab4"))))

 ;; erc
 '(erc-action-face ((t (:foreground "gray" :weight bold))))
 '(erc-command-indicator-face ((t (:foreground "black" :weight bold))))
 '(erc-nick-default-face ((t (:foreground "SlateBlue" :weight bold))))
 '(erc-input-face ((t (:foreground "#000099"))))
 '(erc-notice-face ((t (:foreground "dark sea green" :weight bold))))
 '(erc-timestamp-face ((t (:foreground "#32CD32" :weight bold))))

 ;; circe
 '(circe-server-face ((t (:foreground "dark sea green"))))
 '(circe-prompt-face ((t (:foreground "gray25" :background "LightSeaGreen" :weight bold))))
 '(lui-time-stamp-face ((t (:foreground "#32CD32"))))
 '(circe-highlight-nick-face ((t (:foreground "DarkTurquoise")))) ;"#0445b7"

 ;; rst
 '(rst-definition ((t (:inherit font-lock-constant-face))) t)
 '(rst-level-1 ((t (:background "#D5F0D5"))) t)
 '(rst-level-2 ((t (:background "#DAEADA"))))
 '(rst-level-3 ((t (:background "#DAEADA"))))
 '(rst-level-4 ((t (:background "#DAEADA"))))
 '(rst-level-5 ((t (:background "#DAEADA"))))
 '(rst-level-6 ((t (:background "#DAEADA"))))
 '(rst-block ((t (:inherit font-lock-function-name-face :bold t))) t)
 '(rst-external ((t (:inherit font-lock-constant-face))) t)
 '(rst-directive ((t (:inheit font-lock-builtin-face))) t)
 '(rst-literal ((t (:inheit font-lock-string-face))))
 '(rst-emphasis1 ((t (:inherit italic))) t)
 '(rst-adornment ((t (:bold t :foreground "#3465a4"))))

 ;; whitespace-mode
 '(whitespace-empty ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-indentation ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-newline ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-space-after-tab ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-tab ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-hspace ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-line ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-space ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-space-before-tab ((t (:background "#F0FFF0" :foreground "#babdb6"))) t)
 '(whitespace-trailing ((t (:background "#F0FFF0" :foreground "#ad7fa8"))) t)

 ;; diff
 '(diff-indicator-added ((t (:foreground "#339933"))) t)
 '(diff-added ((t (:foreground "#339933"))) t)
 '(diff-indicator-removed ((t (:foreground "#cc0000"))) t)
 '(diff-removed ((t (:foreground "#cc0000"))) t)

 ;; magit
 '(magit-diff-add ((t (:foreground "#339933"))) t)
 '(magit-diff-del ((t (:foreground "#cc0000"))) t)
 '(magit-diff-added ((t (:foreground "#22aa22" :background "#ddffdd"))) t)
 '(magit-diff-removed ((t (:foreground "#aa2222" :background "#ffdddd"))) t)
 '(magit-diff-added-highlight ((t (:foreground "#22aa22" :background "#cceecc"))) t)
 '(magit-diff-removed-highlight ((t (:foreground "#aa2222" :background "#eecccc"))) t)
 '(magit-diff-context-highlight ((t (:background "#F0FFF0" :foreground "grey50"))) t)
 '(magit-diff-file-heading-highlight ((t (:background "#D5F0D5"))) t)
 '(magit-item-highlight ((t (:background "#E3F2E1"))) t)
 '(magit-log-author ((t (:foreground "SpringGreen4"))) t)
 '(magit-popup-argument ((t (:foreground "#3032FF"))) t)
 '(magit-process-ok ((t (:foreground "#119911"))) t)
 '(magit-section-highlight ((t (:background "#D5F0D5"))) t)
 '(magit-branch-remote ((t (:foreground "DarkOliveGreen4"))) t)
 '(magit-section-heading ((t (:bold t :foreground "DarkGoldenrod4"))) t)

 ;; git-gutter
 '(git-gutter:added ((t (:foreground "#339933"))) t)
 '(git-gutter:deleted ((t (:foreground "#cc0000"))) t)
 '(git-gutter:modified ((t (:foreground "DodgerBlue3"))) t)

 ;; git-gutter-fringe
 '(git-gutter-fr:added ((t (:foreground "#339933"))) t)
 '(git-gutter-fr:deleted ((t (:foreground "#cc0000"))) t)
 '(git-gutter-fr:modified ((t (:foreground "gray50"))) t)

 ;; org-mode
 '(org-table ((t (:foreground "#009292"))) t)
 '(org-level-4 ((t (:foreground "#00A86B"))) t)

 ;; misc
 '(nxml-element-local-name ((t (:foreground "#0066CC" :weight normal))) t)
 '(speedbar-tag-face ((t (:foreground "DarkSlateGray4"))))
 '(yas-field-highlight-face ((t (:background "#DDEE00"))))
 '(idle-highlight ((t (:foreground "#326B6B" :background "#F2FFC0"))) t)
 '(comint-highlight-prompt ((t (:foreground "#3465BD" :weight bold))) t)
 '(speedbar-selected-face ((t (:foreground "#339966" :underline t))) t)

 '(flx-highlight-face  ((t (:foreground "#0066CC" :bold t :underline t))) t)

 ;; powerline
 '(powerline-active1 ((t (:background "#babdb6" :inherit mode-line))) t)
 '(powerline-active2 ((t (:background "#d3d7cf" :inherit mode-line))) t)
 '(powerline-inactive1  ((t (:background "grey70" :inherit mode-line-inactive))) t)
 '(powerline-inactive2  ((t (:background "grey80" :inherit mode-line-inactive))) t)

 ;; tabbar
 '(tabbar-modified ((t (:inherit tabbar-default :foreground "#118811"
                                 :bold t
                                 :box (:line-width 1 :color "white"
                                                   :style released-button)))))
 '(tabbar-selected ((t :inherit tabbar-default
                       :box (:line-width 1 :color "white" :style pressed-button)
                       :foreground "#2e3436" :bold t)))
 '(tabbar-selected-modified ((t :inherit tabbar-selected)))

 ;; web-mode
 '(web-mode-current-element-highlight-face
   ((t (:background "#D5F0D5"))))
 '(web-mode-html-tag-face ((t (:foreground "grey28"))) t)
 '(web-mode-html-attr-name-face ((t (:foreground "#4045F0"))) t)
 '(web-mode-doctype-face ((t (:foreground "#3465BD"))) t)
 '(web-mode-comment-face ((t (:foreground "gray50"))) t)
 '(web-mode-css-selector-face ((t (:foreground "#009292"))) t)
 '(web-mode-function-call-face ((t :inherit organic-fg)))
 '(web-mode-function-name-face ((t :inherit font-lock-function-name-face)))

 '(eldoc-highlight-function-argument
   ((t (:foreground "#119911" :weight bold))) t)

 '(table-cell ((t (:foreground "#326B6B" :background "#E3FFE1"))) t)

 ;; dired
 '(diredp-dir-heading ((t (:background "#E3FFE1"))))
 '(diredp-dir-name ((t (:foreground "#2e3436"))))
 '(diredp-file-name ((t (:foreground "#326B6B"))))
 '(diredp-file-suffix ((t (:foreground "#009292"))))

 ;;Highlight pair parentheses
 '(show-paren-match ((t (:background "#F0F0A1"))))
 '(show-paren-mismatch ((t (:background "#FFF0F0"))))

 ;; rainbow-delimiters
 ;; (1 (2 (3 (4 (5 (6 (7 (8 (9 (10 (11 (12))))))))))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#666666" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#5544EE" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#2265DC" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#00A89B" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#229900" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#999900" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#F57900" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#EE66E8" :background "#F0FFF0"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "purple"  :background "#F0FFF0"))))
 ;; helm
 '(helm-buffer-directory ((t (:foreground "DodgerBlue"))))
 ;; '(helm-ff-directory ((t (:background "black" :foreground "dodgerblue"))))
 '(helm-ff-dotted-directory ((t (:foreground "DodgerBlue"))))
 '(helm-ff-dotted-symlink-directory ((t (:foreground "DarkOrange"))))
 ;; '(helm-ff-file ((t (:background "black" :foreground "darkgreen"))))
 ;; '(helm-ff-invalid-symlink ((t (:background "black" :foreground "red"))))
 ;; '(helm-ff-prefix ((t (:background "black" :foreground "yellow"))))
 '(helm-ff-symlink ((t (:foreground "DarkOrange4"))))
 '(helm-selection ((t (:background "cyan" :foreground "yellow"))))
 ;; '(helm-source-header ((t (:background "black" :foreground "gold" :underline t :height 1.1))))
 '(helm-visible-mark ((t (:background "darkgreen" :foreground "grey"))))
 ;; avy
 '(avy-lead-face ((t (:background "gray" :foreground "white"))))
 '(avy-lead-face-0 ((t (:background "gray" :foreground "white"))))
 '(avy-lead-face-2 ((t (:background "gray" :foreground "white"))))
 )

(provide 'lemon-theme)
