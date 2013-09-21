;; Packages
(load-file "~/.emacs.d/package-installation.el")

;; Load basic packages
(check-packages '(twilight-theme
		  jujube-theme
		  yaml-mode
		  magit
		  auto-complete))

;; Theme
(custom-set-variables
 '(custom-safe-themes (quote ("579e9950513524d8739e08eae289419cfcb64ed9b7cc910dd2e66151c77975c4" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default))))

(load-theme 'jujube t)

;; Move mode
(load-file "~/.emacs.d/move-mode.el")

;; Control backup place
(setq backup-directory-alist `(("." . "~/.emacs-backup")))
(setq backup-by-copying t)

;; Remove top menu bar
(menu-bar-mode -1)

;; Delete trailing spaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; key chords
(key-chord-mode 1)
(key-chord-define-global "jk" 'enable-move-mode)

;; Tab hatred
(setq tab-width 2)
(setq indent-tabs-mode nil)

;; Line numbers
(require 'linum)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
;; Add space between line number and text
(setq linum-format "%3d ")

;; Haskell
(load-file "~/.emacs.d/haskell.el")
