(require 'package)

(setq package-archives '(
   ("ELPA" . "http://tromey.com/elpa/")
   ("gnu" . "http://elpa.gnu.org/packages/")
   ("marmalade" . "http://marmalade-repo.org/packages/")
   ("melpa" . "http://melpa.milkbox.net/packages/")
))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
