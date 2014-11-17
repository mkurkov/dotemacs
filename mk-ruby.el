(use-package inf-ruby
  :ensure inf-ruby)

(use-package ruby-mode
  :ensure ruby-mode
  :init
  (progn
    ;; don't add magic comment please
    (setq ruby-insert-encoding-magic-comment nil)
    (setq ruby-deep-indent-paren nil)
))

(use-package rspec-mode
  :ensure rspec-mode
  :init
  (progn
    ;; use rspec as command
    (setq rspec-spec-command "rspec")
    (setq rspec-use-rake-flag nil)
    (setq rspec-use-bundler-when-possible nil)

    (global-set-key "\C-c,s" 'rspec-verify-single)
))

(use-package rinari
  :ensure rinari
  :init
  (progn
    ;; rinari tags file
    (setq rinari-tags-file-name "TAGS")
))

(use-package haml-mode :ensure haml-mode)
(use-package yaml-mode :ensure yaml-mode)
(use-package feature-mode :ensure feature-mode)
