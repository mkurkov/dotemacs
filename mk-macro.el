;;; File        : mk-macro.el
;;; Description : Some macroses.
;;; Author      : Mikhail Kurkov <mkurkov@gmail.com>
;;; -------------------------------------------------------------------


;; date/time insert
(defun insert-date()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(global-set-key [f7] 'insert-date)


;; filling the line with character
(defun fill-line (character)
  "Insert a line of characters till end of line"
  (interactive "c")
  (let (count)
    (setq count (+ 1 (- fill-column (current-column))))
    (if (> count 0)
        (insert-char character count))))

(global-set-key [f5] 'fill-line )


;; toggle between saved positions as in MIM editor
;;       F2 - save current position
;;   Alt-F2 - return to saved position
;;       F3 - save current position and return to previously saved pos
(defun save-point-and-switch ()
  "Save current point to register 0 and go
to the previously saved position"
  (interactive)
  (let (temp)
    (setq temp (point-marker))
    (when (not (equal (get-register 0) nil))
      (jump-to-register 0))
    (set-register 0 temp)))

(defun save-point-only ()
 "Save current point to register 0"
 (interactive)
 (let (temp)
   (setq temp (point-marker))
   (set-register 0 temp)))

(defun switch-point-only ()
 "Save current point to register 0"
 (interactive)
 (when (not (equal (get-register 0) nil))
   (jump-to-register 0)))


(global-set-key [f2] 'save-point-only)
(global-set-key [(meta f2)] 'switch-point-only)
(global-set-key [f3] 'save-point-and-switch)


;; Revert all unchanged buffers (after git checkout for example)
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files.") )
