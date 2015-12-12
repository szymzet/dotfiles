(prelude-require-packages '(gist
                            ag
                            highlight-symbol
                            comment-dwim-2
                            yasnippet
                            rspec-mode
                            which-key
			    helm-swoop
                            beacon
                            org-bullets
                            hydra))

(setq company-dabbrev-downcase nil)

;; I'm not into spellchecking all the time
(setq prelude-flyspell nil)

;;
;; ace-window
;;
(setq aw-dispatch-alist '((?x aw-delete-window " Ace - Delete Window")
                          (?v split-window-below)
                          (?b balance-windows)
                          (?s split-window-right)))
(setq aw-keys '(?j ?k ?l ?\; ?f ?d))
(ace-window-display-mode 1)

;;
;; ag
;;
(setq ag-highlight-search t)
(setq ag-reuse-window t)

;;
;; beacon
;;
(setq beacon-blink-duration 0.3)
(setq beacon-blink-when-buffer-changes t)
(setq beacon-blink-delay 0.15)
(beacon-mode 1)

;;
;; highlight-symbol
;;
(setq highlight-symbol-idle-delay 30)
(setq highlight-symbol-on-navigation-p 1)

;;
;; scss
;;
(setq scss-compile-at-save nil)

;;
;; flycheck
;;
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(sass scss)))

;;
;; web-mode
;;
(setq web-mode-markup-indent-offset 2)

;;
;; js, javascript
;;
(setq js-indent-level 2)

;;
;; smartparens
;;
(setq smartparens-global-strict-mode nil)
(setq smartparens-strict-mode nil)

;;
;; magit
;;
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")
(set-default 'magit-unstage-all-confirm nil)
(set-default 'magit-stage-all-confirm nil)

;;
;; company
;;
(setq company-idle-delay 0)
(setq company-show-numbers t)
(setq company-minimum-prefix-length 3)

;;
;; avy jump
;;

(with-eval-after-load "isearch"
  (define-key isearch-mode-map (kbd "M-s j") 'avy-isearch))
(setq avy-case-fold-search nil)

;;
;; projectile
;;
(setq projectile-switch-project-action 'projectile-dired)

;;
;; yasnippets
;;
(yas-global-mode +1)
(setq hippie-expand-try-functions-list (cons 'yas-hippie-try-expand
                                             hippie-expand-try-functions-list))

;;
;; rspec
;;
(setq rspec-use-rake-when-possible nil)

;;
;; diff-hl
;;
(global-diff-hl-mode -1)

;;
;; helm
;;
(setq helm-swoop-pre-input-function (lambda () ()))
(setq helm-buffer-max-length 60)

;;
;; which-key
;;
(which-key-mode)
(setq which-key-idle-delay 1)
