; derived from ELPA installation
; http://tromey.com/elpa/install.html
(defun eval-url (url)
  (let ((buffer (url-retrieve-synchronously url)))
  (save-excursion
    (set-buffer buffer)
    (goto-char (point-min))
    (re-search-forward "^$" nil 'move)
    (eval-region (point) (point-max))
    (kill-buffer (current-buffer)))))

;; Load ELPA
(add-to-list 'load-path "~/.emacs.d/elpa")

(defun install-elpa ()
  (eval-url "http://tromey.com/elpa/package-install.el"))

(if (require 'package nil t)
    (progn
      ;; Emacs 24+ includes ELPA, but requires some extra setup
      ;; to use the (better) tromey repo
      (if (>= emacs-major-version 24)
          (setq package-archives '( ("ELPA" . "http://tromey.com/elpa/")
                                    ("gnu" . "http://elpa.gnu.org/packages/")
                                    ("marmalade" . "http://marmalade-repo.org/packages/") )))
      (package-initialize))
  (install-elpa))
