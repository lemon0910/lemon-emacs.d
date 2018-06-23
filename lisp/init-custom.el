(defgroup my nil
  "Personal Emacs configurations."
  :group 'extensions)

(defcustom my-full-name "lemon"
  "Set user full name."
  :type 'string)

(defcustom my-proxy "127.0.0.1:1087"
  "Set network proxy."
  :type 'string)

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
          (const :tag "Doom theme" doom)
          (const :tag "modern theme" modern)))

(defcustom my-company-backend-with-yas nil
  "Enable yasnippet for company backends or not."
  :type 'boolean)

(defcustom more-feature t
  "Enable more feature for mac"
  :type 'boolean)

(defcustom my-completion 'ivy
  "set completion type"
  :type '(choice
          (const :tag "ivy" ivy)
          (const :tag "helm" helm)))

(defcustom my-benchmark-enabled nil
  "Enable the init benchmark or not."
  :type 'boolean)

(provide 'init-custom)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-custom.el ends here
