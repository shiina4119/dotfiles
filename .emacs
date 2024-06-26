;;; .emacs --- Initialization file for Emacs  -*- lexical-binding: t; -*-
;;; Commentary:
;;; vertico, which-key, doom-modeline, spacious-padding,
;;; lsp features (lsp-mode, flycheck, sideline, company, yasnippet),
;;; nerd-icons, doom-themes
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default frame-title-format '("deezmacs - [" mode-name "]"))
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-12"))
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode t)
(global-hl-line-mode t)
(global-display-line-numbers-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(electric-pair-mode t)
(pixel-scroll-precision-mode t)
(setq-default display-fill-column-indicator-column 79)
(global-set-key (kbd "C-c h") 'org-html-export-to-html)
(setq-default indent-tabs-mode nil)
; JS/TS indent
(setq js-indent-level 2)
(setq typescript-indent-level 2)
; lsp-mode performance tuning
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setenv "LSP_USE_PLISTS" "true")


;; sync emacs PATH with shell PATH
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"))))
    
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)


;; Configure automatic backups
(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.emacsbackups/"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)


(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))


(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)


(use-package vertico
  :init
  (vertico-mode t))

(use-package which-key
  :config
  (which-key-mode t))

(use-package doom-modeline
  :init
  (doom-modeline-mode t))

(use-package spacious-padding
  :init
  (spacious-padding-mode t))


(use-package doom-themes
  :config
  (load-theme 'doom-zenburn t))

;; (use-package ef-themes
;;   :config
;;   (load-theme 'ef-bio t))


;; major modes
(use-package markdown-mode
  :mode
  ("README\\.md\\'" . gfm-mode))

(use-package org
  :mode
  ("\\.org$" . org-mode))


;; nerd-icons
(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))


;; LSP
(use-package lsp-mode
  :bind
  ("C-c l" . lsp)
  ("C-c f" . lsp-format-buffer)
  ("C-c r" . lsp-format-region)
  :hook
  ;; (c-mode . lsp)
  ;; (python-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands
  (lsp))

;; (use-package lsp-pyright
;;   :hook
;;   (python-mode . (lambda ()
;;                    (require 'lsp-pyright)
;;                    (lsp))))

(use-package lsp-ui
  :commands
  lsp-ui-mode
  :hook
  (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :bind
  ([f8] . treemacs))

(use-package flycheck
  :hook
  (lsp-mode . flycheck-mode))

(use-package company
  :hook
  (prog-mode . company-mode))

(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode))


(provide '.emacs)
;;; .emacs ends here
