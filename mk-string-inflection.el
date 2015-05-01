(use-package string-inflection
   :ensure string-inflection
   :init (progn
           (global-unset-key (kbd "C-q"))
           (global-set-key (kbd "C-q C-u") 'string-inflection-upcase)
           (global-set-key (kbd "C-q C-l") 'string-inflection-underscore)
           (global-set-key (kbd "C-q C-c") 'string-inflection-camelcase)))
