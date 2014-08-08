;;;;;;;;;;;;;;;;;;;;;;;;;;; -*- Mode: Emacs-Lisp -*- ;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs --- A simple startup file, enabling Auctex (and ispell.info)
;; Author          : Claus Dethlefsen
;; Created On      : Wed Aug 30 10:41:44 2000
;; Last Modified By: Claus Dethlefsen
;; Last Modified On: Thu Jan 10 12:44:02 2002
;; Update Count    : 8
;; Status          : Ok, but adjust the path to auctex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Put this file in your HOME directory  (e.g. c:\)
;; See http://www.math.auc.dk/~dethlef/Tips/
;; for more information on setting up LaTeX, Emacs, AucTeX etc.

;; -----------------------------------------------------------------
;; AUC TeX

;(add-to-list 'load-path "c:/program files/emacs/site-lisp/auctex/")
(add-to-list 'Info-default-directory-list "c:/program files/emacs/site-lisp/auctex/doc/")
(load "tex-site") 

;; -----------------------------------------------------------------
;; Reftex activation (Reftex is included with Emacs 21.1)

(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;; ----------------------------------------------------------------------
;; Info for Ispell
(add-to-list 'Info-default-directory-list "c:/usr/local/info/")      

;; ----------------------------------------------------------------------
;; ----------------------------------------------------------------------
;; ----------------------------------------------------------------------
;; ----------------------------------------------------------------------
;; ----------------------------------------------------------------------
;; ----------------------------------------------------------------------


(defun my-c-mode-common-hook ()
  ;; use k&r style for all C like languages
  (c-set-style "k&r")
  ;; other customizations can go here
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq inhibit-startup-message t)

(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "white")
(set-default-font "-*-Courier New-normal-r-*-*-16-*-*-*-c-*-*-iso8859-1")

(setq auto-mode-alist
           (append
         '(("\\.F$"  . fortran-mode)
           ("\\.inc$"  . fortran-mode)
           ("\\.C$"  . c++-mode)
           ("\\.cc$"  . c++-mode)
           ("\\.h$"  . c++-mode)
           ("\\.cxx$"  . c++-mode)
           ("\\.html$" . html-mode)
             )
         auto-mode-alist))

; ------------------------------------------------------------
     ; Color coding
     (setq gc-cons-threshold 1000000)
     ;(require 'vc-status)
;     (if (eq window-system 'x)
         (progn
           (transient-mark-mode t)
           
           (if (fboundp 'what\ line) (fmakunbound 'what\ line))
           (if (fboundp 'set\ cursor\ free) (fmakunbound 'set\ cursor\
free))
           (if (fboundp 'set\ cursor\ bound)
               (fmakunbound 'set\ cursor\ bound))
           (if (fboundp 'set\ scroll\ margins)
               (fmakunbound 'set\ scroll\ margins))
           (if (fboundp 'what\ line) (fmakunbound 'what\ line))
           
           (if (x-display-color-p)
               (progn
                 (eval-after-load
                  "font-lock"
                  '(progn
                     (setq c-font-lock-keywords c-font-lock-keywords-2
                           c++-font-lock-keywords c++-font-lock-keywords-2
                           lisp-font-lock-keywords
lisp-font-lock-keywords-2)))
                 (global-font-lock-mode t)
                 
                 (mapcar (function
                          (lambda (flist)
                            (copy-face (car (cdr flist)) (car flist))
                            (set-face-foreground (car flist) (car (cdr
(cdr flist))))
     ))
                               
                         '((italic-blue italic "deepskyblue")
                           (italic-turquiose italic "turquoise")
                           (italic-orange italic "orange")
                           (bold-yellow default "yellow")
                           (bold-green default "green")
                           (default-red default "red")))
                 
                 (setq font-lock-comment-face 'italic-blue
                       font-lock-doc-string-face 'italic-turquiose
                       font-lock-string-face 'italic-orange
                       font-lock-function-name-face 'bold-yellow
                       font-lock-keyword-face 'bold-green
                       font-lock-type-face 'default-red)
                 
         
     ;  (set-face-foreground 'font-lock-comment-face "saddle brown")
     ;  (set-face-foreground 'font-lock-doc-string-face "chocolate")
     ;  (set-face-foreground 'font-lock-string-face "firebrick")
     ;  (set-face-foreground 'font-lock-function-name-face "blue")
     ;  (set-face-foreground 'font-lock-keyword-face "slate blue")
     ;  (set-face-foreground 'font-lock-type-face "steel blue")
                 (set-face-background 'region "yellow")
                 (set-face-foreground 'region "hot pink")
                 (setq w3-node-style 'font-lock-keyword-face)
                 (setq w3-address-style 'font-lock-comment-face)
                 (setq w3-bold-style 'font-lock-keyword-face)
                 (setq w3-italic-style 'font-lock-comment-face)
                 )
                                             ; else x-display-color-p
             (if (eq 'gray-scale (x-display-visual-class))
                 (progn
                   (set-face-background 'region "DarkSlateGrey")
                   )
               (progn
                 (set-face-background 'region "White")
                 (set-face-foreground 'region "Black")
                 (setq hilit-background-mode 'mono)
                 )
               )
             )
           )
;       )

