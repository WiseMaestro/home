;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
;hell no

(setq load-path (cons "/Users/keith.wyss/.emacs.d/" load-path))
(require 'undo-tree)
(global-undo-tree-mode)

(setq f nil)

(require 'sr-speedbar)
(defun configure-company-mode () (interactive) "Set up company mode"
;(add-to-list 'load-path "~/gitprojects/company-0.5")


;(require 'company)

)

(defun configure-company-keymap () "Set up company mode keymap"
    (global-unset-key (kbd "M-SPC"))

    (global-set-key (kbd "M-SPC") 'company-complete-common)
;    (define-key company-mode-map (kbd "M-SPC") 'company-search-candidates)
    (define-key company-active-map (kbd "TAB") 'company-complete-selection)
)
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

(defun init-autocomplete () (interactive) "Initialize auto-completion"
  (add-to-list 'load-path "~/.emacs.d/autocomplete")
  (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
  (ac-config-default))

(defun configure-eclim () "Configure eclim options"
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)
  )



(defun init-eclim () (interactive) "Initialize eclipse integration"
  (init-autocomplete)
  (add-to-list 'load-path (expand-file-name "~/gitProjects/emacs-eclim/"))
  ;; only add the vendor path when you want to use the libraries provided with emacs-eclim
  (add-to-list 'load-path (expand-file-name "~/gitProjects/emacs-eclim/vendor"))
  (require 'eclim)
  (setq eclim-auto-save f)
  (global-eclim-mode)
  (require 'eclimd)
  (configure-eclim)
  ;; add the emacs-eclim source
  (require 'ac-emacs-eclim-source)
  (add-hook 'eclim-mode-hook (lambda ()
			       (add-to-list 'ac-sources 'ac-source-emacs-eclim)
			       (add-to-list 'ac-sources 'ac-source-emacs-eclim-c-dot)))
  (setq eclimd-executable "~/eclipse/eclimd")
  (setq eclimd-default-workspace "~/Documents/workspace")
  (setq eclim-executable "~/eclipse/eclim")
  
  (define-key eclim-mode-map (kbd "<f3>") 'eclim-java-find-declaration)
  (define-key eclim-mode-map (kbd "<f5>") 'eclim-java-find-references)
  (define-key eclim-mode-map  (kbd "\C-ct") 'eclim-java-find-type)
  (define-key eclim-mode-map  (kbd  "\C-co") 'eclim-java-import-missing)
  (define-key eclim-mode-map (kbd "<f1>") 'eclim-manage-projects)
  (define-key eclim-mode-map (kbd "<f4>") 'eclim-java-hierarchy)
  (define-key eclim-mode-map (kbd "<f2>") 'eclim-java-find-implementors)
  (define-key eclim-mode-map (kbd "\C-cp") 'eclim-problems)
  (add-to-list 'load-path "~/gitprojects/company-0.5")
  (configure-company-mode)
  (require 'company-emacs-eclim)
(setq company-backends '(
					;			 company-abbrev
					;			 company-clang
					;			 company-css
					;			 company-dabbrev-code
					;			 company-dabbrev
					;			 company-emacs-eclim
					;			 company-elisp
					;			 company-etags
					;			 company-files
					;			 company-gtags
					;			 company-ispell
					;			 company-keywords
					;			 company-nxml
					;			 company-oddmuse
					;			 company-ropemacs
								 company-semantic
					;			 company-template
					;			 company-tempo
					;			 company-xcode
	))
  (company-emacs-eclim-setup)
  (global-company-mode t)
(configure-company-mode)
(configure-company-keymap)

)

(defun global-key-setup () "Set up global keybindings"
  (global-set-key (kbd "M--") 'shrink-window-horizontally)
  (global-set-key (kbd "M-+") 'enlarge-window-horizontally)
  (global-set-key (kbd "M-n") 'enlarge-window)
  (global-set-key (kbd "M-p") 'shrink-window)
  (global-set-key (kbd "\C-cl") 'sr-speedbar-refresh-turn-on)
  (global-set-key (kbd "\C-cu") 'sr-speedbar-refresh-turn-off)
  (global-unset-key [f1])
  (global-unset-key [f2])
  (global-unset-key [f3])
  (global-unset-key [f4])
  (global-unset-key [f5])
  (global-set-key "\C-x\C-m" 'execute-extended-command)
  (global-unset-key "\C-x\C-c")
  (global-set-key "\C-x\C-c" 'suspend-frame)
  (global-set-key "\C-c(" 'start-kbd-macro)
  (global-set-key "\C-c)" 'end-kbd-macro)
  (global-set-key "\C-c\C-c" 'call-last-kbd-macro)
  (global-set-key "\C-c\C-j" 'init-eclim)
  (global-set-key "\C-c\C-s" 'sr-speedbar-open))




(defun paredit-mode-keymap-init () "Make keybindings for paredit mode"
  (define-key paredit-mode-map (kbd "C-x l") 'paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-x r") 'paredit-backward-slurp-sexp)
  (define-key paredit-mode-map (kbd "M-l") 'paredit-forward-barf-sexp)
  (define-key paredit-mode-map (kbd "M-r") 'paredit-backward-barf-sexp))

(defun speedbar-set-up () "Make keybindings and settings for speedbar"
  (define-key speedbar-mode-map (kbd "o") 'speedbar-expand-line)
  (define-key speedbar-mode-map (kbd "i") 'speedbar-contract-line)
  (setq sr-speedbar-width 60))





(paredit-mode)
(paredit-mode-keymap-init)
(paredit-mode)
;(init-autocomplete)
(speedbar-set-up)
(global-key-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)


(defun find-alternative-file-with-sudo ()
  (interactive)
  (let ((fname (or buffer-file-name
           dired-directory)))
    (when fname
      (if (string-match "^/sudo:root@localhost:" fname)
      (setq fname (replace-regexp-in-string
               "^/sudo:root@localhost:" ""
               fname))
    (setq fname (concat "/sudo:root@localhost:" fname)))
      (find-alternate-file fname))))
