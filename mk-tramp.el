(require 'tramp)

;; Add local and .lan domains to multi-hop authorization
(add-to-list 'tramp-default-proxies-alist
             '("\\.lan\\'" "\\`root\\'" "/ssh:%h:"))

(add-to-list 'tramp-default-proxies-alist
             '("\\.local\\'" "\\`root\\'" "/ssh:%h:"))
