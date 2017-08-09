;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.dotfiles/yasnippets"
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete)
                      yaml better-defaults emacs-lisp git
     ;; clojure
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     ;; python
     sql
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     evil-commentary
     osx
     html
     javascript
     java
     markdown
     dash
     version-control
     github
     (shell :variables
            shell-default-shell 'shell
            shell-default-position 'bottom
            shell-default-height 50
            shell-default-term-shell "/bin/bash")
     (org :variables
          org-enable-github-support t)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default dotspacemacs-editing-style 'vim
                dotspacemacs-verbose-loading nil
                dotspacemacs-startup-banner nil
                dotspacemacs-mode-line-unicode-symbols nil
                dotspacemacs-startup-lists '(recents projects)
                dotspacemacs-themes'(spacemacs-light
                                     monokai
                                     spacemacs-dark
                                     solarized-light
                                     solarized-dark
                                     leuven
                                     zenburn)
                dotspacemacs-colorize-cursor-according-to-state nil
                dotspacemacs-leader-key "SPC"
                dotspacemacs-emacs-leader-key "M-m"
                dotspacemacs-major-mode-leader-key ","
                dotspacemacs-major-mode-emacs-leader-key "C-M-m"
                dotspacemacs-command-key ":"
                dotspacemacs-auto-save-file-location 'cache
                dotspacemacs-use-ido nil
                dotspacemacs-enable-paste-micro-state nil
                dotspacemacs-which-key-delay 0.2
                dotspacemacs-loading-progress-bar nil
                dotspacemacs-fullscreen-at-startup nil
                dotspacemacs-fullscreen-use-non-native nil
                dotspacemacs-maximized-at-startup nil
                dotspacemacs-active-transparency 90
                dotspacemacs-inactive-transparency 90
                dotspacemacs-smooth-scrolling nil
                dotspacemacs-smartparens-strict-mode nil
                dotspacemacs-highlight-delimiters 'all
                dotspacemacs-persistent-server nil
                dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
                dotspacemacs-default-package-repository nil)
  ;;
  ;; User initialization goes here
  ;;
  (when (file-executable-p "/usr/local/bin/gls") ; gnu ls on mac, using brew coreutils
    (setq insert-directory-program "/usr/local/bin/gls"))
  (setq dired-listing-switches "--group-directories-first -alh")
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; use company mode everywhere
  (global-company-mode)

  (which-function-mode)

  (show-smartparens-mode nil)

  (setq-default
   flycheck-disabled-checkers '(ruby-rubylint)

   backup-by-copying t
   delete-old-versions t
   kept-old-versions 2
   kept-new-versions 6

   evil-shift-round nil
   evil-want-C-i-jump t

   scroll-margin 2
   use-dialog-box nil
   visible-bell t
   blink-matching-paren t
   default-indicate-empty-lines t
   powerline-default-separator 'nil

   ;; show *some* details when in hide-details mode
   dired-hide-details-hide-symlink-targets nil
   dired-hide-details-hide-information-lines nil

   company-idle-delay 0
   company-show-numbers t
   company-minimum-prefix-length 3

   magit-push-always-verify nil

   web-mode-markup-indent-offset 2
   js-indent-level 2
   which-func-unknown "func n/a"

   ruby-version-manager 'rbenv
   projectile-switch-project-action 'projectile-dired

   shell-command-switch "-ic"           ; -i for interactive

   projectile-enable-caching t
   )

  ;; by default no details
  (defun szz-dired-startup () (dired-hide-details-mode t))
  (add-hook 'dired-mode-hook 'szz-dired-startup)
  (add-hook 'text-mode-hook 'auto-fill-mode)

  (global-set-key (kbd "M-e") 'hippie-expand)

  (defun szz-open-scratch-buffer () (interactive) (find-file "~/Dropbox/org/scratch.org"))
  (defun szz-open-inbox-buffer () (interactive) (find-file "~/Dropbox/org/inbox.org"))

  (add-hook 'ruby-mode-hook
            (lambda () (hs-minor-mode)))

  (eval-after-load "hideshow"
    '(add-to-list 'hs-special-modes-alist
                  `(ruby-mode
                    ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
                    ,(rx (or "}" "]" "end"))                       ; Block end
                    ,(rx (or "#" "=begin"))                        ; Comment start
                    ruby-forward-sexp nil)))

  (spacemacs/set-leader-keys
    "ol" 'hs-hide-level
    "o>" 'hs-show-block
    "o<" 'hs-hide-block)

  (spacemacs/set-leader-keys
    "os" 'szz-open-scratch-buffer
    "oi" 'szz-open-inbox-buffer))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl diminish paredit winum unfill restclient-helm ob-restclient fuzzy company-restclient know-your-http-well packed evil avy simple-httpd haml-mode bind-key tern bind-map pcache alert log4e gntp powerline pcre2el org minitest hide-comnt projectile git-gutter flycheck hydra inflections multiple-cursors cider seq spinner clojure-mode auto-complete inf-ruby eclim company anzu iedit smartparens highlight f undo-tree gh ht yasnippet request helm helm-core skewer-mode js2-mode magit magit-popup git-commit with-editor async markdown-mode dash s zenburn-theme solarized-theme yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sql-indent spacemacs-theme spaceline smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restclient restart-emacs rbenv rake rainbow-delimiters quelpa pug-mode popwin persp-mode paradox ox-gfm orgit org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-http neotree mwim multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump diff-hl define-word dash-at-point company-web company-tern company-statistics company-emacs-eclim column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby bundler auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
