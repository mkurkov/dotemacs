(require 'tramp)

;; Add local and .lan domains to multi-hop authorization
(add-to-list 'tramp-default-proxies-alist
             '("\\.lan\\'" "\\`root\\'" "/ssh:%h:"))

(add-to-list 'tramp-default-proxies-alist
             '("\\.lan\\'" "\\`erlang\\'" "/ssh:%h:"))

(add-to-list 'tramp-default-proxies-alist
             '("\\.lan\\'" "\\`mandarin\\'" "/ssh:%h:"))

(add-to-list 'tramp-default-proxies-alist
             '("\\erlang.lan\\'" "\\`erlang\\'" "/ssh:%h:"))

(add-to-list 'tramp-default-proxies-alist
             '("\\.local\\'" "\\`root\\'" "/ssh:%h:"))
