(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar prelude-packages
  '(twilight-theme yaml-mode)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (setq packages prelude-packages)
  (setq flag t)
  (while packages
        (when (not (package-installed-p (car packages))) (setq flag nil))
        (setq packages (cdr packages)))
  flag)

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(custom-set-variables
 '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default))))
(custom-set-faces)

(load-theme 'twilight t)

;; Control backup place
(setq backup-directory-alist `(("." . "~/.emacs-backup")))
(setq backup-by-copying t)
