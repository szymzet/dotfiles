(add-hook 'prog-mode-hook
          (lambda () (highlight-symbol-mode 1)))

(add-hook 'prog-mode-hook
          (lambda () (highlight-symbol-nav-mode 1)))

(add-hook 'prog-mode-hook
          (lambda () (setq show-trailing-whitespace t)))

(add-hook 'shell-mode-hook
          (lambda () (setq show-trailing-whitespace nil)))

(add-hook 'term-mode-hook
          (lambda () (setq show-trailing-whitespace nil)))

;; send regular tab key so that the shell can autocomplete
(add-hook 'shell-mode-hook
          (lambda () (define-key comint-mode-map "\t" 'self-insert-command)))

(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode)))
