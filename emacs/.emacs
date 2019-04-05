(setq user-full-name "Richard Tiffin")
(setq user-mail-address "richard.tiffin@akoolla.com")

(require 'cl)
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(defvar trickbytes/packages '(ac-slime
			      auto-complete
			      clojure-mode
			      cider
			      magit
			      markdown-mode
			      smex
			      yaml-mode
			      ) "Default packages")

(defun trickybytes/packages-installed-p ()
  (loop for pkg in  trickbytes/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (trickybytes/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg  trickbytes/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
;;(menu-bar-mode -1)
(tool-bar-mode -1)
 
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(setq tab-width 2
      indent-tabs-mode nil)

(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(require 'auto-complete-config)
(ac-config-default)


(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

(setq column-number-mode t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(load-file "~/.emacs.d/color-themes/themes/spolsky-theme.el")
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (yaml-mode smex markdown-mode magit cider ac-slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
