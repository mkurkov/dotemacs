(require 'sqlplus)
(add-to-list 'auto-mode-alist '("\\.sqp\\'" . sqlplus-mode))
(setq sqlplus-command "sqlplus-start.sh")
(setq sqlplus-pagesize 20000)
