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

;; minor modes
(load "~/emacs/mk-iswitchb.el")
(load "~/emacs/mk-anything.el")
(load "~/emacs/mk-ido.el")
(load "~/emacs/mk-dired.el")
(load "~/emacs/mk-uniquify.el")
(load "~/emacs/mk-eproject.el")

;; vcs
(load "~/emacs/mk-git.el")
(load "~/emacs/mk-darcs.el")

;; gtd
(load "~/emacs/mk-org-mode.el")
(load "~/emacs/mk-remember.el")

;; programming
(load "~/emacs/mk-sqlplus.el")
(load "~/emacs/mk-j.el")
(load "~/emacs/mk-erlang.el")
(load "~/emacs/mk-haskell.el")

;; load saved sessions afterall
(load "~/emacs/mk-desktop.el")

;; start emacsclient server
(server-start)
