;;; File        : .emacs
;;; Description : Main Emacs configuration file
;;; Author      : Mikhail Kurkov <mkurkov@gmail.com>
;;; -------------------------------------------------------------------

;; default paths
(add-to-list 'load-path "~/emacs/lib")
(setq custom-file "~/.emacs.d/custom.el")

;; appearance tweaking
(load "~/emacs/mk-user.el")
(load "~/emacs/mk-lang.el")
(load "~/emacs/mk-ui.el")

;; my own macroses
(load "~/emacs/mk-macro.el")

;; load saved sessions afterall
(load "~/emacs/mk-desktop.el")



