(defgroup my nil
  "Personal Emacs configurations."
  :group 'extensions)

(defcustom my-full-name "lemon"
  "Set user full name."
  :type 'string)

(defcustom my-mail-address "lemon9010@gmail.com"
  "Set user email address."
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

(defcustom my-theme 'moe
  "Set color theme."
  :type '(choice
          (const :tag "Default theme" default)
          (const :tag "Dark theme" dark)
          (const :tag "Zenburn theme" zenburn)
          (const :tag "moe theme" moe)
          (const :tag "doom theme" doom)
          (const :tag "Light theme" light)
          (const :tag "Daylight theme" daylight)))

(provide 'init-custom)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-custom.el ends here
