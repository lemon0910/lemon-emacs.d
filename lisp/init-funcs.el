;; Dos2Unix/Unix2Dos
(defun dos2unix ()
  "Convert the current buffer to UNIX file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))

(defun unix2dos ()
  "Convert the current buffer to DOS file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))

;; Create a new scratch buffer
(defun create-scratch-buffer ()
  "Create a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

;; Save a file as utf-8
(defun save-buffer-as-utf8 (coding-system)
  "Revert a buffer with `CODING-SYSTEM' and save as UTF-8."
  (interactive "zCoding system for visited file (default nil):")
  (revert-buffer-with-coding-system coding-system)
  (set-buffer-file-coding-system 'utf-8)
  (save-buffer))

(defun lemon/kill-this-buffer (&optional arg)
  "Kill the current buffer.
   If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))

(defun lemon/kill-other-buffers (&optional arg)
  "Kill all other buffers.
   If the universal prefix argument is used then will the windows too."
  (interactive "P")
  (when (yes-or-no-p (format "Killing all buffers except \"%s\"? "
                             (buffer-name)))
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
    (when (equal '(4) arg) (delete-other-windows))
    (message "Buffers deleted!")))

(defun lemon/kill-all-buffers (&optional arg)
  "Kill all other buffers.
   If the universal prefix argument is used then will the windows too."
  (interactive "P")
    (mapc 'kill-buffer (buffer-list))
    (when (equal '(4) arg) (delete-other-windows))
    (message "Buffers deleted!"))

(defun lemon/prompt-kill-emacs ()
  "Prompt to save changed buffers and exit Spacemacs"
  (interactive)
  (save-some-buffers)
  (kill-emacs))

(defun lemon/kill-emacs ()
  "Lose all changes and exit Spacemacs"
  (interactive)
  (kill-emacs))

(defun c-open-relational-file-get-opening-file-name (file-name-prefix ext-list)
  (let ((opening-file-name (concat file-name-prefix "." (car ext-list))))
    (cond ((null (car ext-list))             nil)
          ((file-exists-p opening-file-name) opening-file-name)
          (t                                 (c-open-relational-file-get-opening-file-name file-name-prefix 
                                                                                           (cdr ext-list))))))

(defun c-open-relational-file ()
  "keeping in touch between header file and source file for C or C++"
  (interactive)
  (let* ((c-or-cpp-header-map (list "m" "mm" "mpp" "M" "c" 
                                    "cpp" "cxx" "cc" "c++" "C"))
         (c-source-map        (list "h" "s"))
         (asm-source-map      (list "c"))
         (cpp-source-map      (list "hpp" "h" "hxx" "h++" "hh" "H"))
         (cpp-header-map      (list "cpp" "cxx" "cc" "c++" "C"))
         (ext-map (list
                   (cons "h"   c-or-cpp-header-map)
                   (cons "m"   c-source-map)
                   (cons "c"   c-source-map)
                   (cons "s"   asm-source-map)
                   (cons "C"   cpp-source-map)
                   (cons "cc"  cpp-source-map)
                   (cons "cpp" cpp-source-map)
                   (cons "cxx" cpp-source-map)
                   (cons "c++" cpp-source-map)
                   (cons "M"   cpp-source-map)
                   (cons "H"   cpp-header-map)
                   (cons "hh"  cpp-header-map)
                   (cons "hpp" cpp-header-map)
                   (cons "hxx" cpp-header-map)
                   (cons "h++" cpp-header-map)))
         (opened-file-name (buffer-file-name (window-buffer)))
         (opened-file-name-prefix (file-name-sans-extension opened-file-name))
         (opened-file-ext-type (file-name-extension opened-file-name))
         (opening-file-ext-type-list (cdr (assoc opened-file-ext-type ext-map)))
         (opening-file-name (c-open-relational-file-get-opening-file-name opened-file-name-prefix
                                                                          opening-file-ext-type-list))
         (opening-file-buffer (if (null opening-file-name)
                                  nil
                                (find-file-noselect opening-file-name))))
    (progn 
      ;(print opened-file-name)
      ;(print opened-file-name-prefix)
      ;(print opened-file-ext-type)
      ;(print opening-file-name)
      (if (null opening-file-buffer)
          (message "not found relational file")
        (switch-to-buffer opening-file-buffer)))))

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(provide 'init-funcs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-funcs.el ends here
