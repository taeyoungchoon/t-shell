;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; (add-hook 'yaml-mode-hook #'smartparens-mode)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company hydra highlight-indentation ansible ansible-doc smartparens))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (highlight-indentation-mode)
;; (add-hook 'yaml-mode-hook '(lambda () (ansible 1)))

;; http://en.enisozgen.com/editing-ansible-files-in-emacs/
(add-hook 'yaml-mode-hook #'highlight-indentation-mode)

;; https://salishsea-meopar-docs.readthedocs.io/en/latest/work_env/emacs_config.html
;; wget https://raw.github.com/yoshiki/yaml-mode/master/yaml-mode.el
(global-font-lock-mode 1)

(line-number-mode 1)
(column-number-mode 1)

(setq-default indent-tabs-mode nil)

(setq default-tab-width 2)
(setq tab-width 2)

(setq-default show-trailing-whitespace t)

;; add my personal elisp repository to the load-path
(add-to-list 'load-path "~/elisp")

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
