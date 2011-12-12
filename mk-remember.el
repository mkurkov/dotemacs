;;;  Load Org Remember Stuff
(require 'remember)

(org-remember-insinuate)

; I use C-M-r to start org-remember
(global-set-key (kbd "C-M-r") 'org-remember)

; Keep clocks running
(setq org-remember-clock-out-on-exit nil)

; C-c C-c stores the note immediately
(setq org-remember-store-without-prompt t)

; I don't use this -- but set it in case I forget to specify a location in a future template
(setq org-remember-default-headline "Tasks")

; 2 remember templates for TODO tasks and Notes
(setq org-remember-templates (quote (("todo" ?t "* TODO %?\n  %u\n  %a" nil bottom nil)
                                     ("note" ?n "* %?                                        :NOTE:\n  :CLOCK:\n  :END:\n  %U\n  %a" nil bottom nil)
                                     )))

;;; function to run remember outside emacs
(defadvice remember-finalize (after delete-remember-frame activate)
  "Advise remember-finalize to close the frame if it is the remember frame"
  (if (equal "remember" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice remember-destroy (after delete-remember-frame activate)
  "Advise remember-destroy to close the frame if it is the rememeber frame"
  (if (equal "remember" (frame-parameter nil 'name))
      (delete-frame)))

;; make the frame contain a single window. by default org-remember
;; splits the window.
(add-hook 'remember-mode-hook
          'delete-other-windows)

(defun make-remember-frame ()
  "Create a new frame and run org-remember."
  (interactive)
  (make-frame '((name . "remember") (width . 80) (height . 10)))
  (select-frame-by-name "remember")
  (org-remember))
