;;; File        : .emacs
;;; Description : Main Emacs configuration file
;;; Author      : Mikhail Kurkov <mkurkov@gmail.com>
;;; -------------------------------------------------------------------

;; default paths
(add-to-list 'load-path "~/emacs/lib")
(setq custom-file "~/.emacs.d/custom.el")

;; package support
(load "~/emacs/mk-elpa.el")
(load "~/emacs/mk-use-package.el")

;; appearance tweaking
(load "~/emacs/mk-user.el")
(load "~/emacs/mk-lang.el")
(load "~/emacs/mk-ui.el")

;; my own macroses
(load "~/emacs/mk-macro.el")

;; minor modes
(load "~/emacs/mk-iswitchb.el")
(load "~/emacs/mk-ido.el")
(load "~/emacs/mk-dired.el")
(load "~/emacs/mk-uniquify.el")
(load "~/emacs/mk-eproject.el")
(load "~/emacs/mk-tramp.el")
(load "~/emacs/mk-move-text.el")
(load "~/emacs/mk-expand-region")
(load "~/emacs/mk-ace-jump-mode")
(load "~/emacs/mk-yasnippet")

;; vcs
(load "~/emacs/mk-darcs.el")
(load "~/emacs/mk-magit")

;; gtd
(load "~/emacs/mk-org-mode.el")
(load "~/emacs/mk-remember.el")

;; programming
(load "~/emacs/mk-sql.el")
(load "~/emacs/mk-j.el")
(load "~/emacs/mk-haskell")
(load "~/emacs/mk-erlang.el")
(load "~/emacs/mk-shell.el")
(load "~/emacs/mk-ruby.el")
(load "~/emacs/mk-compilation.el")
(load "~/emacs/mk-webdev")
(load "~/emacs/mk-typescript")

;; editing
(load "~/emacs/mk-markdown")
(load "~/emacs/mk-graphviz")
(load "~/emacs/mk-tex")
(load "~/emacs/mk-xml")
(load "~/emacs/mk-string-inflection")

;; IRC
(load "~/emacs/mk-erc.el")

;; Mailing
(load "~/emacs/mk-gnus.el")

;; load saved sessions afterall
(load "~/emacs/mk-desktop.el")

;; server start
(server-start)
