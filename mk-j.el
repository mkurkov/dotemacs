(use-package j-mode
  :ensure j-mode
  :init
  (progn
;     (autoload 'j-mode "j-mode.el"  "Major mode for J." t)
 ;    (autoload 'j-shell "j-mode.el" "Run J from emacs." t)
     (setq auto-mode-alist (cons '("\\.ij[rstp]" . j-mode) auto-mode-alist))
     (setq j-path "~/j64-801/bin") ))
