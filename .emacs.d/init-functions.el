(defun configure-company-mode () (interactive) "Set up company mode"
;(add-to-list 'load-path "~/gitprojects/company-0.5")

;(require 'company)
)

(defun configure-eclim () "Configure eclim options"
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer))

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
(configure-company-keymap))


(defun speedbar-set-up () "Make keybindings and settings for speedbar"
  (define-key speedbar-mode-map (kbd "o") 'speedbar-expand-line)
  (define-key speedbar-mode-map (kbd "i") 'speedbar-contract-line)
  (setq sr-speedbar-width 60))

(defun configure-company-keymap () "Set up company mode keymap"
    (global-unset-key (kbd "M-SPC"))

    (global-set-key (kbd "M-SPC") 'company-complete-common)
;    (define-key company-mode-map (kbd "M-SPC") 'company-search-candidates)
    (define-key company-active-map (kbd "TAB") 'company-complete-selection)
)