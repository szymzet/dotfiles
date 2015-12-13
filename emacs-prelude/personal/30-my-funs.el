(defun split-window-right-and-move-there-dammit ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun split-window-below-and-move-there-dammit ()
  (interactive)
  (split-window-below)
  (windmove-down))

(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)))

;; full screen magit-status

(defun magit-status-fullscreen (prefix)
  (interactive "P")
  (magit-status)
  (unless prefix
    (delete-other-windows)))

;; full screen vc-annotate

(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

(eval-after-load "vc-annotate"
  '(progn
     (defadvice vc-annotate (around fullscreen activate)
       (window-configuration-to-register :vc-annotate-fullscreen)
       ad-do-it
       (delete-other-windows))

     (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

(defun szz-toggle-polish-keys ()
  "Toggles *right* command key to be Meta or Command (for foreign characters)"
  (interactive)
  (if (equal system-type 'darwin)
      (if (equal mac-command-modifier 'meta)
          (progn
            (setq mac-right-option-modifier 'left
                  mac-command-modifier 'super
                  mac-right-command-modifier 'left)
            (message "Polish keys OFF"))
        (progn
          (setq mac-right-option-modifier nil ; for Polish characters
                mac-command-modifier 'meta
                mac-right-command-modifier 'meta)
          (message "Polish keys ON")))
    (message "not running on Mac OS X, but on: %s" system-type)))

