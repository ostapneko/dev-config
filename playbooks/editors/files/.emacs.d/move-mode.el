(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
          (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
        (insert "\n"))

      ;; now insert as many time as requested
      (while (> n 0)
             (insert current-line)
             (decf n)))))

(defun kill-whole-line ()
  "Delete a while line, including the newline"
  (interactive)
  (move-beginning-of-line nil)
  (kill-line 1))

(defun add-new-line ()
  "Add a new line and disable move mode"
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent)
  (disable-move-mode))

(defun add-new-line-above ()
  "Add a new line above, move the cursor up and disable move mode"
  (interactive)
  (move-beginning-of-line nil)
  (newline)
  (disable-move-mode)
  (previous-line)
  (indent-for-tab-command))

(define-minor-mode move-mode
  "Move mode"
  ;; The initial value - Set to 1 to enable by default
  1
  ;; The indicator for the mode line.
  " Move"
  ;; The minor mode keymap
  `(
    ("s" . next-line)
    ("w" . previous-line)
    ("a" . backward-char)
    ("d" . forward-char)
    ("\S-d" . forward-word)
    ("\S-a" . backward-word)
    ("\C-s" . save-buffer)
    ("o" . find-file)
    ("\C-l" . duplicate-current-line)
    ("\M-l" . kill-whole-line)
    ("\C-t" . show-terminal)
  )
  ;; MAKE mode global rather than buffer local
  :global 1
)

;; Need to move those out of the keymap
;; because the call 'move-mode recursively and
;; Emacs doesn't look happy with it
(define-key move-mode-map (kbd "j") 'disable-move-mode)
(define-key move-mode-map (kbd "l") 'add-new-line)
(define-key move-mode-map (kbd "L") 'add-new-line-above)

(add-hook 'minibuffer-setup-hook 'disable-move-mode)
(add-hook 'minibuffer-exit-hook 'enable-move-mode)
(add-hook 'term-mode-hook 'disable-move-mode)

(defun disable-move-mode ()
  "Exit move mode"
  (interactive)
  (move-mode 0))

(defun enable-move-mode ()
  "Enter move mode"
  (interactive)
  (move-mode 1))

(defun show-terminal ()
  "Show terminal frame above current buffer"
  (interactive)
  (split-window-below)
  (term "/bin/bash")
  (term-char-mode)
  (local-set-key (kbd "\C-t") (lambda ()
				      (interactive)
				      (delete-window)
				      (enable-move-mode))))
