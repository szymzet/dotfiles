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
   '((auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.dotfiles/yasnippets")
     better-defaults
     emacs-lisp
     git
     clojure
     ruby
     erlang
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     evil-commentary
     html
     javascript
     markdown
     (shell :variables
            shell-default-shell 'shell
            shell-default-position 'bottom
            shell-default-height 30
            shell-default-term-shell "/bin/bash")
     (org :variables
          org-enable-github-support t)

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     ;; emacs-lisp
     ;; git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; syntax-checking
     ;; version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(gist
                                      rspec-mode
                                      comment-dwim-2)
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
                dotspacemacs-startup-lists '(recents projects)
                dotspacemacs-themes '(zenburn leuven)
                dotspacemacs-colorize-cursor-according-to-state t
                dotspacemacs-default-font '("Hack"
                                            :size 15
                                            :weight normal
                                            :width normal
                                            :powerline-scale 1.1)
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
                dotspacemacs-maximized-at-startup t
                dotspacemacs-active-transparency 90
                dotspacemacs-inactive-transparency 90
                dotspacemacs-mode-line-unicode-symbols t
                dotspacemacs-smooth-scrolling t
                dotspacemacs-smartparens-strict-mode t
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

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; use company mode everywhere
  (global-company-mode)

  (setq-default

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
   company-minimum-prefix-length 1

   magit-push-always-verify nil

   web-mode-markup-indent-offset 2
   js-indent-level 2

   ruby-version-manager 'rbenv
   projectile-switch-project-action 'projectile-dired

   org-default-notes-file "~/Dropbox/notes/inbox.org"
   org-capture-templates
   `(("t" "todo" entry (file+headline "~/Dropbox/notes/inbox.org" "Tasks")
      "* TODO %?\nCaptured %<%Y-%m-%d %H:%M>\n")
     ("n" "note" entry (file+headline "~/Dropbox/notes/inbox.org" "Notes")
      "* NOTE %?\nCaptured %<%Y-%m-%d %H:%M>\n")
     ("s" "snippet" entry (file+headline "~/Dropbox/notes/inbox.org" "Snippets")
      "* %?\n\n#+BEGIN_SRC\n#+END_SRC\nCaptured %<%Y-%m-%d %H:%M>\n"))
   )

  (defun szz-open-scratch-buffer () (interactive) (find-file "~/Dropbox/notes/scratch.org"))
  (defun szz-dired-notes () (interactive) (dired "~/Dropbox/notes/"))

  ;; by default no details
  (defun szz-dired-startup () (dired-hide-details-mode t))
  (add-hook 'dired-mode-hook 'szz-dired-startup)

  (global-set-key (kbd "M-e") 'hippie-expand)

  (spacemacs/set-leader-keys
    "og" 'gist-buffer-private
    "oG" 'gist-list
    "os" 'szz-open-scratch-buffer
    "oc" 'org-capture
    "on" 'szz-dired-notes)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
