(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org-install)

;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Org agenda files
(setq org-agenda-files (file-expand-wildcards "~/org/[a-zA-Z0-9]*.org"))

;; TODO states
(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "|" "CANCELLED(c@/!)")
                                )))

;; Change todo state with C-c C-t KEY
(setq org-use-fast-todo-selection t)

;; Fixing task state with S-arrow
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; Setting tags when moving to particular state
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t) ("NEXT"))
              ("SOMEDAY" ("WAITING" . t))
              (done ("NEXT") ("WAITING"))
              ("TODO" ("WAITING") ("CANCELLED") ("NEXT"))
              ("STARTED" ("WAITING"))
              ("DONE" ("WAITING") ("CANCELLED") ("NEXT")))))

;; Change task state to STARTED from TODO when clocking in
(defun mk/clock-in-to-started (kw)
  "Switch task from TODO to STARTED when clocking in"
  (if (and (string-equal kw "TODO")
           (not (string-equal (buffer-name) "*Remember*")))
      "STARTED"
    nil))

(setq org-clock-in-switch-to-state (quote mk/clock-in-to-started))

(setq org-default-notes-file "~/org/inbox.org")

;;; Refiling tasks from inbox

; Use IDO for target completion
(setq org-completion-use-ido t)

; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))

; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Efforts

; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00"))))

;; Custom Agenda Views

(setq org-agenda-custom-commands
      (quote (("s" "Started Tasks" todo "STARTED" ((org-agenda-todo-ignore-scheduled nil)
                                                   (org-agenda-todo-ignore-deadlines nil)
                                                   (org-agenda-todo-ignore-with-date nil)))
              ("w" "Tasks waiting on something" tags "WAITING/!" ((org-use-tag-inheritance nil)))
              ("r" "Refile New Notes and Tasks" tags "LEVEL=1+REFILE" ((org-agenda-todo-ignore-with-date nil)
                                                                       (org-agenda-todo-ignore-deadlines nil)
                                                                       (org-agenda-todo-ignore-scheduled nil)))
              ("N" "Notes" tags "NOTE" nil)
              ("n" "Next" tags "NEXT-WAITING-CANCELLED/!" nil)
              ("p" "Projects" tags-todo "LEVEL=2-NEXT-WAITING-CANCELLED/!-DONE" nil)
              ("A" "Tasks to be Archived" tags "LEVEL=2/DONE|CANCELLED" nil)
              ("h" "Habits" tags "STYLE=\"habit\"" ((org-agenda-todo-ignore-with-date nil)
                                                    (org-agenda-todo-ignore-scheduled nil)
                                                    (org-agenda-todo-ignore-deadlines nil))))))

;; Babel/ditaa support
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . t)
   (ocaml . nil)
   (python . t)
   (ruby . t)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . t)))
