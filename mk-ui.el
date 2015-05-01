;;; File        : mk-ui.el
;;; Description : UI, fonts/faces setup.
;;; Author      : Mikhail Kurkov <mkurkov@gmail.com>
;;; -------------------------------------------------------------------

;; Color theming
(use-package color-theme :ensure color-theme)

(setq x-underline-at-descent-line t)
(setq solarized-emphasize-indicators nil)

(use-package solarized-theme
   :ensure solarized-theme
   :init (load-theme 'solarized-dark t))

(use-package modeline-posn
  :ensure modeline-posn)

;; date-time display
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)
(blink-cursor-mode t)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; don't ask about local variables
(setq enable-local-variables :safe)

;; cua mode
(setq cua-enable-cua-keys nil)           ;; don't add C-x,C-c,C-v
(cua-mode t)                             ;; for rectangles, CUA is nice

;; line numbering
(global-linum-mode 1)

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

(setq default-tab-width 4)
(setq-default tab-width 4)
(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))


(setq split-width-threshold nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; some hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; shell color mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
