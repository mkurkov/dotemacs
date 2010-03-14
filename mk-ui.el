;;; File        : mk-ui.el
;;; Description : UI, fonts/faces setup.
;;; Author      : Mikhail Kurkov <mkurkov@gmail.com>
;;; -------------------------------------------------------------------

;; date-time display
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)
(blink-cursor-mode t)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; set misc decoration variables
(custom-set-variables
 '(global-font-lock-mode t)
 '(scalable-fonts-allowed t)
 '(uniquify-buffer-name-style (quote forward))
 '(use-dialog-box nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(custom-buffer-done-kill t)
 '(initial-scratch-message nil)
 '(transient-mark-mode t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(global-hl-line-mode t)
 '(make-backup-files nil)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(c-basic-offset 4)
 '(require-final-newline t)
)

(setq split-width-threshold nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; some hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; font/faces
(custom-set-faces
 '(default ((t (:background "grey12" :foreground "grey70" :height 150 ))))
 '(hl-line ((t (:background "grey20"))))
 '(region  ((t (:background "#463935"))))
 '(cursor  ((t (:background "chocolate4"))))
 )
