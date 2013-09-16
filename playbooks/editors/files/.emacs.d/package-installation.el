(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar prelude-packages
  '(twilight-theme
    yaml-mode
    key-chord
    auto-complete
    )
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
