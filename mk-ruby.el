;;; ruby-mode

;; don't add magic comment please
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren nil)

;; use rspec as command
(setq rspec-spec-command "rspec")
(setq rspec-use-rake-flag nil)
(setq rspec-use-bundler-when-possible nil)

(global-set-key "\C-c,s" 'rspec-verify-single)


;; rinari tags file
(setq rinari-tags-file-name "TAGS")
