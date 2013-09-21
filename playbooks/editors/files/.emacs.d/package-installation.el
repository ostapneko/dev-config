(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun check-packages (packages)
  (unless (packages-installed-p packages)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p packages)
      (when (not (package-installed-p p))
        (package-install p)))))

(defun packages-installed-p (packages)
  (setq remaining-packages packages)
  (setq flag t)
  (while remaining-packages
        (when (not (package-installed-p (car remaining-packages))) (setq flag nil))
        (setq remaining-packages (cdr remaining-packages)))
  flag)
