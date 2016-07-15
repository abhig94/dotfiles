;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

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
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

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