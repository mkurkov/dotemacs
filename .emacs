;;; File        : .emacs
;;; Description : Main Emacs configuration file
;;; Author      : Mikhail Kurkov <mkurkov@gmail.com>
;;; -------------------------------------------------------------------

;; default paths
(add-to-list 'load-path "~/emacs/lib")
(setq custom-file "~/.emacs.d/custom.el")

;; load daemon in noninteractive mode
;; http://stackoverflow.com/questions/4933134/emacs-daemon-startup-freezes-if-file-has-auto-save-data
(defadvice desktop-restore-file-buffer
  (around my-desktop-restore-file-buffer-advice)
  "Be non-interactive while starting a daemon."
  (if (and (daemonp)
           (or (not (boundp 'server-process))
               (not server-process)))
      (let ((noninteractive t))
        ad-do-it)
    ad-do-it))

(ad-activate 'desktop-restore-file-buffer)

;; package support
(load "~/emacs/mk-elpa.el")
(load "~/emacs/mk-el-get.el")
(load "~/emacs/mk-el-get-packages.el")

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

;; vcs
(load "~/emacs/mk-darcs.el")

;; gtd
(load "~/emacs/mk-org-mode.el")
(load "~/emacs/mk-remember.el")

;; programming
(load "~/emacs/mk-sqlplus.el")
(load "~/emacs/mk-j.el")
;(load "~/emacs/mk-erlang.el")
(load "~/emacs/mk-shell.el")
(load "~/emacs/mk-ruby.el")
(load "~/emacs/mk-compilation.el")

;; IRC
(load "~/emacs/mk-erc.el")

;; Mailing
(load "~/emacs/mk-gnus.el")

;; load saved sessions afterall
(load "~/emacs/mk-desktop.el")
