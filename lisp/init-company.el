(use-package company
  :diminish company-mode
  :bind (
         :map company-active-map
              ([tab] . company-complete-common-or-cycle)
              ("C-n" . company-complete-common-or-cycle)
              ("C-m" . company-complete-selection)
         :map company-search-map
         ([tab] . company-select-next))
  :init
   (add-hook 'after-init-hook #'global-company-mode)
  :config
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil
        company-dabbrev-code-other-buffers t
        company-show-numbers t
        company-backends '(company-files company-dabbrev-code company-dabbrev company-keywords company-etags)))

(setq company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
        company-preview-if-just-one-frontend))

(defun ora-company-number ()
  "Forward to `company-complete-number'.
Unless the number is potentially part of the candidate.
In that case, insert the number."
  (interactive)
  (let* ((k (this-command-keys))
         (re (concat "^" company-prefix k)))
    (if (cl-find-if (lambda (s) (string-match re s))
                    company-candidates)
        (self-insert-command 1)
      (company-complete-number
       (if (equal k "0")
           10
         (string-to-number k))))))

(with-eval-after-load 'company
(let ((map company-active-map))
  (mapc (lambda (x) (define-key map (format "%d" x) 'ora-company-number))
        (number-sequence 0 9))))

(provide 'init-company)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-company.el ends here
