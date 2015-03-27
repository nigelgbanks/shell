;; Enable Emacs 24 package manager
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Add load paths
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; No splash screen
(setq inhibit-startup-message t)
;; Don't create ~ files
(setq make-backup-files nil)
;; Stop creating those #auto-save# files
(setq auto-save-default nil)
;; Allow up / downcase regions
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; Always use spaces
(setq indent-tabs-mode nil)
;; Indent level for Javascript
(setq js-indent-level 2)
;; Indent level for C and similar languages
(setq c-basic-offset 2)
;; 80 Characters is line length
(setq fill-column 80)
;; Show trailing whitespace with purple background.
(setq show-trailing-whitespace t)
;; Always remove trailing whitespace when editing
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Auto refresh buffers
(global-auto-revert-mode 1)
;; Auto refresh dired
(setq global-auto-revert-non-file-buffers t)
;; Platform Settings
(if (eq system-type 'darwin)
    (load "darwin.el"))
;; Functions for use everywhere.
(load "functions.el")
;; Set up magit
(add-to-list 'load-path "/path/to/git-modes")
(add-to-list 'load-path "/path/to/magit")
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list "/path/to/magit/")))
(require 'magit)
(autoload 'magit-status "magit" nil t)
(global-set-key "\C-ci" 'magit-status)

