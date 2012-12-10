;A lisp file intended for customizations of emacs global behavior
;and for UDFs

(global-undo-tree-mode)
(setq f nil)
(put 'set-goal-column 'disabled nil)


(defun emms-menu ()  (interactive) "Opens an emms menu buffer"(emms-menu-mode))

(defun last-window () "Run other window with -1 arg" (interactive) 
  (other-window -1))




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
(put 'narrow-to-region 'disabled nil)


(setq ring-bell-function 
(lambda ()
(unless (memq this-command
'(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit mwheel-scroll down up next-line previous-line
backward-char forward-char))
(ding))))

(defun reverse-string (pstring) 
"Reverse a string"
  (mapconcat (lambda (a) (char-to-string a)) (reverse (string-to-list pstring)) ""))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Python Pymacs specific functions
;#######################################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun pymacs-dir-region () "Pymacs dir on current region into *Dir* buffer and display the result" (interactive) (print (pymacs-eval (concat "dir(" (buffer-substring (region-beginning) (region-end)) ")"))))

(defun pymacs-exec-buffer () "Pymacs-exec on whole buffer" (interactive) (pymacs-exec  (buffer-substring (point-min) (point-max))))

(defun pymacs-exec-region () "Pymacs-exec on current region" (interactive) (pymacs-exec (buffer-substring (region-beginning) (region-end))))