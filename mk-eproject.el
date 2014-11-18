(defun init-eproject ()
  ;; eproject global bindings
  (defmacro .emacs-curry (function &rest args)
    `(lambda () (interactive)
       (,function ,@args)))

  (defmacro .emacs-eproject-key (key command)
    (cons 'progn
          (loop for (k . p) in (list (cons key 4) (cons (upcase key) 1))
                collect
                `(global-set-key
                  (kbd ,(format "C-x p %s" k))
                  (.emacs-curry ,command ,p)))))

  (.emacs-eproject-key "k" eproject-kill-project-buffers)
  (.emacs-eproject-key "v" eproject-revisit-project)
  (.emacs-eproject-key "b" eproject-ibuffer)
  (.emacs-eproject-key "o" eproject-open-all-project-files)

  (define-key eproject-mode-map (kbd "C-x p g") #'eproject-grep)
  (define-key eproject-mode-map (kbd "C-x p t") #'eproject-todo)

  ;; Project Root rules
  (define-project-type erlang (generic)
    (or (look-for ".git") (look-for "src"))
    :relevant-files ("\\.hrl$" "\\.erl$" "\\.app$" "\\.edoc$" "\\.c$" "\\.h$"))

  (defun my-erlang-project-hook ()
    (set (make-local-variable 'compile-command)
         (format "cd %s; make -k" (eproject-root))))

  (add-hook 'erlang-project-file-visit-hook 'my-erlang-project-hook)
)

(use-package eproject
  :ensure eproject
  :init (init-eproject))
