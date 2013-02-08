;;; File        : mk-desktop.el
;;; Description : Desktop configuration file
;;; Author      : Mikhail Kurkov <mkurkov@gmail.com>
;;; -------------------------------------------------------------------


(setq-default desktop-missing-file-warning nil)

;; desktop paths\files
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")

(setq-default desktop-save t)
(setq-default save-place t)

;; some buffer locals to keep in desktop file
(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
(add-to-list 'desktop-locals-to-save 'tab-width)
(add-to-list 'desktop-locals-to-save 'eproject-root)

;; run desktop
(desktop-save-mode 1)

;; save history too
(savehist-mode 1)
