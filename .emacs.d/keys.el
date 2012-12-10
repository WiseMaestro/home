;A file with my modifications to keymaps that I employ
;#########################
;#########################


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
  (global-set-key "\C-cc" 'call-last-kbd-macro)
  (global-set-key "\C-c\C-j" 'init-eclim)
  (global-set-key "\C-c\C-s" 'sr-speedbar-open)
  (global-set-key "\C-co" 'last-window)
  (global-set-key "\M-#" 'emms-menu))
  (global-set-key (kbd "C-c p e") 'pymacs-eval)
  (global-set-key (kbd "C-c p b") 'pymacs-exec-buffer)
  (global-set-key (kbd "C-c p d") 'pymacs-dir-region)
  (global-set-key (kbd "C-c p r") 'pymacs-exec-region)
  (global-set-key (kbd "C-x M-f") 'find-alternative-file-with-sudo)
  (global-set-key (kbd "C-x M-r") 'revert-buffer)
(global-key-setup)


(defun paredit-mode-keymap-init () "Make keybindings for paredit mode"
  (define-key paredit-mode-map (kbd "C-x l") 'paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-x r") 'paredit-backward-slurp-sexp)
  (define-key paredit-mode-map (kbd "M-l") 'paredit-forward-barf-sexp)
  (define-key paredit-mode-map (kbd "M-r") 'paredit-backward-barf-sexp))
(paredit-mode)
(paredit-mode-keymap-init)
(paredit-mode)
