;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

;; Increase gc-cons-threshold, depending on your system you may set it back to a
;; lower value in your dotfile (function `dotspacemacs/user-config')
(setq gc-cons-threshold 100000000)

(defconst spacemacs-version         "0.200.10" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= spacemacs-emacs-min-version emacs-version))
    (error (concat "Your version of Emacs (%s) is too old. "
                   "Spacemacs requires Emacs version %s or above.")
           emacs-version spacemacs-emacs-min-version)
  (load-file (concat (file-name-directory load-file-name)
                     "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (spacemacs/init)
  (configuration-layer/sync)
  (spacemacs-buffer/display-startup-note)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start)))




;avy
(define-key global-map (kbd "C-;") 'avy-goto-char)

;emacs
(define-key global-map (kbd "s-b") 'helm-buffers-list)
(define-key global-map (kbd "C-x C-b") 'helm-buffers-list)

;company-mode

(define-key global-map (kbd "s-SPC") 'company-complete)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
  )


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (
                               :background nil))))

 '(org-table ((t (
                               :background nil))))
 '(org-done ((t (
                  :background nil))))
 '(org-todo ((t (
                 :background "Black"))))


 )



;;This sector is about initial style
(setq initial-frame-alist '((top . 0) (left . 0) (width . 174) (height . 58)));;maxmize frame after launch
(tool-bar-mode 0);;hide toolbar

(set-frame-parameter (selected-frame) 'alpha (list 90 70))
(add-to-list 'default-frame-alist (cons 'alpha (list 90 70)))
(set-background-color "Black")

(set-default-font "Source Code Pro:pixelsize=16")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "PingFang SC" :size 16)))



;; tune rescale so that Chinese character width = 2 * English character width
(setq face-font-rescale-alist '(("Source Code Pro" . 1.0) ("PingFang SC" . 1.25)))
