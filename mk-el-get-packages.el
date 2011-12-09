; extra recipes for packages unknown to el-get (yet)
(setq el-get-sources
      '((:name css-mode :type elpa)

        (:name js2-mode-mooz
               :type git
               :url "git://github.com/mooz/js2-mode.git"
               :load "js2-mode.el"
               :compile ("js2-mode.el")
               :features js2-mode)

        (:name magit :type elpa)

        (:name ace-jump-mode :type elpa
               :after (lambda () (global-set-key (kbd "C-c SPC") 'ace-jump-mode)))

        (:name anything
               :after (lambda () (global-set-key "\C-x\C-a" 'anything)))

        (:name color-theme-sanityinc-solarized
               :type git
               :url "https://github.com/purcell/color-theme-sanityinc-solarized.git")
        ))

; list all packages you want installed
(setq my-el-get-packages
      (append
       '(
         gist
         markdown-mode
         erlware-mode
         anything
         distel
         )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)