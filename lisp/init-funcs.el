;; Dos2Unix/Unix2Dos
(defun dos2unix ()
  "Convert the current buffer to UNIX file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))

(defun unix2dos ()
  "Convert the current buffer to DOS file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))

;; Save a file as utf-8
(defun save-buffer-as-utf8 (coding-system)
  "Revert a buffer with `CODING-SYSTEM' and save as UTF-8."
  (interactive "zCoding system for visited file (default nil):")
  (revert-buffer-with-coding-system coding-system)
  (set-buffer-file-coding-system 'utf-8)
  (save-buffer))

(defun lemon-kill-this-buffer (&optional arg)
  "Kill the current buffer.
   If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))

(defun lemon-kill-other-buffers (&optional arg)
  "Kill all other buffers.
   If the universal prefix argument is used then will the windows too."
  (interactive "P")
  (when (yes-or-no-p (format "Killing all buffers except \"%s\"? "
                             (buffer-name)))
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
    (when (equal '(4) arg) (delete-other-windows))
    (message "Buffers deleted!")))

(defun lemon-kill-all-buffers (&optional arg)
  "Kill all other buffers.
   If the universal prefix argument is used then will the windows too."
  (interactive "P")
    (mapc 'kill-buffer (buffer-list))
    (when (equal '(4) arg) (delete-other-windows))
    (message "Buffers deleted!"))

(defun lemon-prompt-kill-emacs ()
  "Prompt to save changed buffers and exit Spacemacs"
  (interactive)
  (save-some-buffers)
  (kill-emacs))

(defun lemon-kill-emacs ()
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
                                    "cpp" "cxx" "cc" "c++" "C" "ipp"))
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
                   (cons "h++" cpp-header-map)
                   (cons "ipp" cpp-source-map)))
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

(defun lemon-set-project-directory ()
  (interactive)
  (let ((filename (read-directory-name "the project directory is ")))
    (setq my-saved-launch-directory (expand-file-name filename))
    (setq current-directory (expand-file-name filename))
    (setq ffip-project-root (expand-file-name filename))))

(defun lemon-ag ()
  (interactive)
  (let ((directory-name (read-directory-name "the directory name : ")))
    (setq root-directory (expand-file-name directory-name))
    (counsel-ag nil root-directory)))

(defun lemon-relative-line-number ()
  (setq-local display-line-numbers 'visual))

(defun lemon-absolute-line-number ()
  (setq-local display-line-numbers t))

(defun buffer-too-big-p ()
  (or (> (buffer-size) (* 5000 80))
      (> (line-number-at-pos (point-max)) 5000)))

(defun lemon-rename-current-buffer-file ()
  "Rename current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!")
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully rename to '%s'"
                   name (file-name-nodirecotry new-name)))))))

(defun lemon-delete-current-buffer-file ()
  "Removes file connected to current buffer and kill buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun lemon-cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(defun lemon-cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (lemon-cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))

(defun lemon-rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun lemon-toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

;; (defun lemon-fzf ()
;;   (interactive)
;;   (use-package fzf
;;     :commands
;;     (fzf/start))
;;   (fzf/start current-directory nil))

(defun lemon-fzf ()
  (interactive)
  (counsel-fzf nil current-directory))

(defun lemon-no-hlsearch ()
  (interactive)
  ;; (require 'symbol-overlay)
  (evil-search-highlight-persist-remove-all)
  (symbol-overlay-remove-all))

(defun lemon-add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(provide 'init-funcs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-funcs.el ends here
