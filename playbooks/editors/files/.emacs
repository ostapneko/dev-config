;; Package installation
(load-file "~/.emacs.d/package-installation.el")

;; Theme
(custom-set-variables
 '(custom-safe-themes (quote ("6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" default))))
(custom-set-faces)

(load-theme 'twilight t)

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
