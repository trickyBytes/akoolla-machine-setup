(setq user-full-name "Richard Tiffin")
(setq user-mail-address "richard.tififn@akoolla.com")

(if (fboundp 'gnutls-available-p)
    (fmakunbound 'gnutls-available-p))
(setq tls-program '("gnutls-cli --tofu -p %p %h")
      imap-ssl-program '("gnutls-cli --tofu -p %p %s")
      smtpmail-stream-type 'starttls
      starttls-extra-arguments '("--tofu")
      )

(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      ;;ido-at-point ;; completion with ido
                      cider))

(package-initialize)

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;;(ido-at-point-mode)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;;No tabs in files
(setq tab-width 2
      indent-tabs-mode nil)

;;No back-up files
(setq make-backup-files nil)

;;Deal with temp files and take them away
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
