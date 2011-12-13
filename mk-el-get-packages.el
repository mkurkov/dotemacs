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

        (:name feature-mode :type elpa)

        (:name cucumber-mode :type git
               :url "https://github.com/michaelklishin/cucumber.el.git"
               :after (lambda()
                         (setq feature-default-i18n-file "~/.emacs.d/el-get/cucumber-mode/i18n.yml")
                         (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode) )))

        (:name eproject :type git
               :url "https://github.com/jrockway/eproject.git")

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
         haml-mode
         haskell-mode
         )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)
(el-get 'wait)
