;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
;hell no


;Requires
;#########################
;#########################
(setq load-path (cons "/home/megaloman/.emacs.d/" load-path))
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/autocomplete")
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))
(require 'cl)
(require 'undo-tree)
(require 'python)
(require 'auto-complete)
(require 'yasnippet)
(require 'sr-speedbar)
(require 'package)
(progn (cd "~/.emms")
       (normal-top-level-add-subdirs-to-load-path))
(cd "~/.emacs.d")
(require 'emms-setup)
(require 'auto-complete-config)
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(require 'pymacs)
(require 'emms-menu-mode)

(load-file "~/.emacs.d/cccp-mode.el")



;emms setup
;#######################################
;#######################################
(emms-standard)
(emms-default-players)


;pandora setup
;#######################################
;#######################################
(add-to-list 'load-path "~/.emacs.d/pianobar.el")
(autoload 'pianobar "pianobar" nil t)
(setq pianobar-username "WyssMan@gmail.com")
(setq pianobar-station "0")
(defun startpianobar () "Start pianobar" (interactive)
  (let  (( pianobar-password (read-passwd "The Pandorica will open.")))
  (pianobar)
  (delete-window)
  (define-key pianobar-key-map (kbd ">") 'pianobar-love-current-song)
  (define-key pianobar-key-map (kbd "<") 'pianobar-ban-current-song)))

;Python stuff
;#######################################
;#######################################
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map (kbd "RET") 'newline-and-indent)))

(defadvice python-send-region (around advice-python-send-region-goto-end)
      "Fix a little bug if the point is not at the prompt when you do
    C-c C-[rc]"
      (let ((oldpoint (with-current-buffer (process-buffer (python-proc)) (point)))
	    (oldinput
	      (with-current-buffer (process-buffer (python-proc))
		   (goto-char (point-max))
		      ;; Do C-c C-u, but without modifying the kill ring:
		      (let ((pmark (process-mark (get-buffer-process (current-buffer)))))
			     (when (> (point) (marker-position pmark))
			              (let ((ret (buffer-substring pmark (point))))
					 (delete-region pmark (point))
					  ret))))))
        ad-do-it
        (with-current-buffer (process-buffer (python-proc))
          (when oldinput (insert oldinput))
          (goto-char oldpoint))))
    (ad-enable-advice 'python-send-region 'around 'advice-python-send-region-goto-end)
    (ad-activate 'python-send-region)


;Paredit and eldocs
;#########################
;#########################
(defun set-up-paredit-and-eldocs () "Set up paredit and its eldocs" 
   ;;El-doc needs an adding
   (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
   (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
   (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
		   ;; My god I love paredit mode
   (autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code." t)
        (add-hook 'emacs-lisp-mode-hook	 (lambda () (paredit-mode +1)))
        (add-hook 'lisp-mode-hook		 (lambda () (paredit-mode +1)))
        (add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
        (add-hook 'scheme-mode-hook		 (lambda () (paredit-mode +1))))

(set-up-paredit-and-eldocs)


;Set up autocomplete
;#########################
;#########################
(defun init-autocomplete () (interactive) "Initialize auto-completion"
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
  (ac-config-default))

(init-autocomplete)



;Setup initializations, load keymaps, and apply customizations/udfs
;#########################
;#########################
(load-file "~/.emacs.d/init-functions.el")
(load-file "~/.emacs.d/keys.el")
(load-file "~/.emacs.d/customizations.el")



;(when (not (window-system)) (sr-speedbar-open))


;Theme Setup
;#########################
;#########################


(color-theme-initialize)
(load-file "~/.emacs.d/color-theme-dark-emacs.el")

(eval-after-load "color-theme"
  (progn
    (setq color-theme-is-global nil)
    (when (window-system) ; needed for the first frame
      (color-theme-dark-emacs)
      )))
 
(add-hook 'after-make-frame-functions
          '(lambda (f)
             (with-selected-frame f
               (if (window-system f)
                   (color-theme-dark-emacs)
                 ))))



;Marmalade
;#########################
;#########################

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)


(load-file "ac-python-setup.el")