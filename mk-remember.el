;;;  Load Org Remember Stuff
(add-to-list 'load-path "~/emacs/remember")
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


