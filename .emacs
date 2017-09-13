;; .emacs

(setq user-full-name "Abhi Gupta")
(setq user-mail-address "abhig94@gmail.com")

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; Move backup files to central location
(setq backup-directory-alist
      `((".*" . , "~/.emacs.d/backup/")))
(setq auto-save-file-name-transforms
      `((".*" , "~/.emacs.d/backup/" t)))
(setq auto-save-list-file-prefix nil)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background light)) (:foreground "yellow"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:foreground "green"))))
 '(font-lock-constant-face ((t (:foreground "cyan"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "color-25"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background light)) (:foreground "magenta"))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "cyan"))))
 '(minibuffer-prompt ((t (:foreground "color-25")))))

;; use C-\ to set input mode
(setq default-input-method "TeX")

;; line numbers
(global-linum-mode t)

;; Julia mode
(add-to-list 'load-path "~/.emacsconfig/julia-emacs")
(require 'julia-mode)

;; fix tabs
(setq tab-width 4) ; 4 spaces per tab

;; ESS, for running julia/R/etc from inside emacs
;; (load "~/.emacsconfig/ESS/lisp/ess-site.el")
;; (setq inferior-julia-program-name "/usr/local/bin/julia-0.4.2")
;; (add-to-list 'load-path "~/.emacsconfig/ESS/lisp/")

;MATLAB formatting
(add-to-list 'load-path "~/.emacs.d/")
(load "matlab.el")

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
(defun my-matlab-mode-hook ()
(setq matlab-indent-function t) ; if you want function bodies indented
(setq fill-column 76) ; where auto-fill should wrap
(turn-on-auto-fill))
(setq matlab-mode-hook 'my-matlab-mode-hook)
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(defun my-matlab-shell-mode-hook ()
'())
(setq matlab-mode-hook 'my-matlab-mode-hook)

 ;; (autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
 ;; (add-to-list
 ;;  'auto-mode-alist
 ;;  '("\\.m$" . matlab-mode))
 ;; (setq matlab-indent-function t)
 ;; (setq matlab-shell-command "matlab")


;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)



;; mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)
;; trailing whitespace
;; trailing whitespace
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "color-167") ; red
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; symlinks
(setq vc-follow-symlinks nil)

;; package.el
(load "package.el")
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; color-theme (damn you emacs 23!)
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

;; ;; solarized
;;(require 'color-theme-solarized)
;;(color-theme-solarized)
(color-theme-comidia)
;; (color-theme-calm-forest)

;; backup files
(setq backup-directory-alist
      `((".*" . , "~/.emacs.d/backup/")))
(setq auto-save-file-name-transforms
      `((".*" , "~/.emacs.d/backup/" t)))
(setq auto-save-list-file-prefix nil)


