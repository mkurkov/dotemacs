;; utility function to (brokenly :< ) handle versioned dirs
(defun wild (dir stem)
   "returns the last (alphabetically) filename that matches dir/stem*."
   (car
    (reverse
     (sort
      (let (value)
        (dolist (element (file-name-all-completions stem dir) value)
     (setq value (cons (concat dir element) value)))) 'string-lessp))))

;; we need to find the paths to OTP, distel and esense
;;
;; for OTP, we need the dir containing man and lib.
;; on debian, that would be /usr/lib/erlang
;; for esense, we need the dir where esense.el lives
;; e.g. $HOME/code/esense-1.9
;; for distel, we need distel.el
;; e.g. $HOME/jungerl/lib/distel/elisp
;; you also need to add the corresponding bit to $HOME/.erlang
;; code:add_patha(os:getenv("HOME")++"/jungerl/lib/distel/ebin").

(defvar erlang-erl-path "/opt/local/lib/erlang")
(defvar erlang-esense-path (wild "~/local/lib/erlang/lib/" "esense-"))
(defvar erlang-distel-path  "~/local/lib/erlang/lib/distel/elisp")

;; find the erlang mode .el file
(defvar erlang-erlmode-path
   (concat (wild (concat erlang-erl-path "/lib/") "tools-") "emacs"))

(add-to-list 'load-path erlang-erlmode-path)
(add-to-list 'load-path erlang-esense-path)
(add-to-list 'load-path erlang-distel-path)

(show-paren-mode t)
(global-font-lock-mode t)              ; enable syntax highlighting

(add-hook 'erlang-load-hook 'my-erlang-load-hook)

;; use to start an erlang shell with boot flags
(defun erl-shell (flags)
   "Start an erlang shell with flags"
   (interactive (list (read-string "Flags: ")))
   (set 'inferior-erlang-machine-options (split-string flags))
   (erlang-shell))

(defun my-erlang-load-hook ()
   (require 'distel)
   (distel-setup)

   ;; when loading a beam file from emacs, add the path to erlang
   (setq erl-reload-dwim t)

   (require 'esense)
   (setq esense-indexer-program
     (concat erlang-esense-path "esense.sh"))
   (setq esense-completion-display-method 'frame)

   ;; find the man pages
   (setq erlang-root-dir erlang-erl-path))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
(defun my-erlang-mode-hook ()

   ;;esense
   (esense-mode)

   ;; distel The Right Way(tm)
   (local-set-key [(meta l)] 'erl-find-mod)
   (local-set-key [(meta \()] 'erl-openparent)
   (local-set-key [(meta /)]  'erl-complete)
   (local-set-key [(control x) (\?)] 'erlang-man-function)

   ;; make hack for compile command
   ;; uses Makefile if it exists, else looks for ../inc & ../ebin
   (unless (null buffer-file-name)
     (make-local-variable 'compile-command)
     (setq compile-command
           (if (file-exists-p "Makefile") "make -k"
             (concat
              (concat
               "erlc "
               (concat
                (if (file-exists-p "../ebin") "-o ../ebin " "")
                (if (file-exists-p "../inc") "-I ../inc " "")
                (if (file-exists-p "../include") "-I ../include " "")
                )
               "+debug_info -W " buffer-file-name))))))

(add-hook 'comint-mode-hook 'my-comint)
(defun my-comint ()
   ;; try to make the shell more like the real shell
   (local-set-key [tab] 'comint-dynamic-complete)
   (local-set-key [(control up)] 'previous-line)
   (local-set-key [(control down)] 'next-line)
   (local-set-key [up] 'comint-previous-input)
   (local-set-key [down] 'comint-next-input))

(add-hook 'erlang-shell-mode-hook 'my-erlang-shell)
(defun my-erlang-shell ()
   (setq comint-dynamic-complete-functions
         '(my-erl-complete  comint-replace-by-expanded-history)))

(defun my-erl-complete ()
   "Call erl-complete if we have an Erlang node name"
   (if erl-nodename-cache
       (erl-complete erl-nodename-cache)
     nil))

(require 'erlang-start)

;;default erlang shell params
(set 'inferior-erlang-machine-options (split-string "-sname emacs -pz ../ebin"))
