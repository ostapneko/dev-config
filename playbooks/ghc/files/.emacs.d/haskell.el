(check-packages '(haskell-mode ghc))

(require 'auto-complete)
(require 'haskell-mode)
(require 'haskell-indent)
(autoload 'ghc-init "ghc" nil t)

(defun my-haskell-config ()
  "Haskell config"
  (turn-on-haskell-indent)
  (auto-complete-mode)
  (ghc-init)
  (add-hook 'after-save-hook 'flymake-start-syntax-check)
  (define-key move-mode-map (kbd "?") 'ghc-flymake-display-errors)
  (define-key move-mode-map (kbd ">") 'flymake-goto-next-error)
  (define-key move-mode-map (kbd "<") 'flymake-goto-prev-error)
  (linum-mode))

(add-hook 'haskell-mode-hook 'my-haskell-config)

(custom-set-variables
 '(flymake-log-level 2))
