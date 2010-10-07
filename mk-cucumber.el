(add-to-list 'load-path "~/emacs/lib/cucumber")
(setq feature-default-i18n-file "~/emacs/lib/cucumber/i18n.yml")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

