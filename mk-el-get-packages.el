; extra recipes for packages unknown to el-get (yet)
(setq el-get-sources
      '(
        (:name color-theme-sanityinc-solarized
               :type elpa)

        (:name ace-jump-mode
               :after (progn (global-set-key (kbd "C-c SPC") 'ace-jump-mode)))

        (:name anything
               :after (progn (global-set-key "\C-x\C-a" 'anything)))

        ))

; list all packages you want installed
(setq my-el-get-packages
      (append
       '(
         css-mode
         js2-mode
         ace-jump-mode
         magit
         markdown-mode
         erlware-mode
         anything
         distel
         feature-mode
         haml-mode
         haskell-mode
         yaml-mode
         graphviz-dot-mode
         rspec-mode
         rinari
         textile-mode
         eproject
         yasnippet
         )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)
