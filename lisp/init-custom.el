(defcustom my-package-archives 'emacs-china
  "Set package archives from which to fetch."
  :type '(choice
          (const :tag "Melpa" melpa)
          (const :tag "Emacs-China" emacs-china)
          (const :tag "Tuna" tuna)))

(defcustom my-theme 'doom
  "Set color theme."
  :type '(choice
          (const :tag "Default theme" default)
          (const :tag "Dark theme" dark)
          (const :tag "Light theme" light)
          (const :tag "Daylight theme" daylight)
          (const :tag "zenburn theme" zenburn)
          (const :tag "cyberpunk theme" cyberpunk)
          (const :tag "Doom theme" doom)
          (const :tag "organic green theme" organic-green)
          (const :tag "madhat2r" madhat2r)
          (const :tag "tangotango" tangotango)
          (const :tag "lazycat theme" lazycat)
          (const :tag "gruvbox theme" gruvbox)))

(defcustom my-completion 'helm
  "set completion type"
  :type '(choice
          (const :tag "ivy" ivy)
          (const :tag "helm" helm)))

(defcustom my-yas nil
  "Enable yasnippet for company backends or not."
  :type 'boolean)

(defcustom more-feature t
  "Enable more feature for mac"
  :type 'boolean)

(defcustom my-benchmark-enabled nil
  "Enable the init benchmark or not."
  :type 'boolean)

(defcustom my-lsp nil
  "enable lsp-mode"
  :type 'boolean)

(provide 'init-custom)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-custom.el ends here
