;; package
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
;;(add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives
;;             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

; init
(require 'smart-compile)
(setq inhibit-splash-screen t)
(display-time)
(load-theme 'wombat)
(global-set-key [(control h)] 'delete-backward-char)
(eshell)

; lisp
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;(setq inferior-lisp-program "/usr/local/bin/sbcl") ;; this is my sbcl path
(setq inferior-lisp-program "/opt/local/bin/clisp") ;; this is my sbcl path
;(add-to-list 'load-path "~/slime") ;my slime path
;(require 'slime)
;(slime-setup '(slime-fancy))

; about backup & auto-save
; http://www.gnu.org/software/emacs/manual/html_node/elisp/Auto_002dSaving.html
(setq make-backup-files t)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 30)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

; language
(setq default-input-method "korean-hangul3f")

;; about font
(set-face-font 'default "-outline-Courier New-normal-normal-normal-mono-14-*-*-*-c-*-iso10646-1")
(set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NanumGothic" . "unicode-bmp"))
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)  '("NanumGothic" . "unicode-bmp"))

;; set a default font
;(when (member "DejaVu Sans Mono" (font-family-list))
;  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))

(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

; move around
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;;(require 'ace-jump-mode)
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; swap window

; package dictionary.el
(global-set-key (kbd "<f8>") 'dictionary-lookup-definition)

;; twitter
;;(setq twittering-use-master-password t)

(setq ispell-program-name "/usr/local/bin/ispell")

;; sunshine
;;(require 'sunshine)
;;(setq sunshine-location "Seoul,KR")

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("http://feeds.nytimes.com/nyt/rss/HomePage" "http://www.devrand.org/feeds/posts/default" "http://possiblywrong.wordpress.com/feed/" "http://www.50ply.com/atom.xml"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
