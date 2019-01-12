(eval-when-compile
 (require 'init-const))

(defcustom my-package-archives 'emacs-china
  "Set package archives from which to fetch."
  :type '(choice
          (const :tag "Melpa" melpa)
          (const :tag "Melpa Mirror" melpa-mirror)
          (const :tag "Emacs-China" emacs-china)
          (const :tag "Netease" netease)
          (const :tag "Tuna" tuna)))

(defcustom my-theme 'doom
  "Set color theme."
  :type '(choice
          (const :tag "Doom theme" doom)))

(defcustom use-yas nil
  "Enable yasnippet for company backends or not."
  :type 'boolean)

(defcustom more-feature t
  "Enable more feature for mac"
  :type 'boolean)

(defcustom use-lsp nil
  "enable lsp-mode"
  :type 'boolean)

(provide 'init-custom)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-custom.el ends here
