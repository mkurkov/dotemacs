;; User info

(setq user-mail-address (getenv "MAIL"))
(setq user-full-name    (getenv "USER_NAME"))

(setenv "SHELL" "/bin/sh")              ;using bin/sh in emacs (for tramp mode)
