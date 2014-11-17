(use-package haskell-mode
   :ensure haskell-mode
   :init
   (progn
     (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

     ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
     (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
     ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

     (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
))

(use-package ghc :ensure ghc)
