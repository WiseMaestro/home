
 
(defvar emms-menu-mode-map (make-sparse-keymap) "Keymap for emms-menu-mode.el")

(defun emms-play-music-directory () "emms-play-directory, but always start in ~/Music"
  (interactive)
  (let ((default-directory "~/Music/")) 
    ( call-interactively 'emms-play-directory)))

(defun emms-play-music-file () "emms-play-file, but always start in ~/Music"
  (interactive)
 (let ((default-directory "~/Music/")) 
    ( call-interactively 'emms-play-file)))

(define-key emms-menu-mode-map (kbd "n") 'emms-next)
(define-key emms-menu-mode-map (kbd "p") 'emms-previous)
(define-key emms-menu-mode-map (kbd "SPC") 'emms-pause)
(define-key emms-menu-mode-map (kbd "M-j") 'emms-play-music-directory)
(define-key emms-menu-mode-map (kbd "C-f") 'emms-play-music-file)
(define-key emms-menu-mode-map (kbd "q") 'emms-menu-mode)
(define-key emms-menu-mode-map (kbd "f") 'emms-seek-forward)
(define-key emms-menu-mode-map (kbd "b") 'emms-seek-backward)
(define-key emms-menu-mode-map (kbd "s") 'emms-stop)





(define-minor-mode emms-menu-mode
"This is a minor mode for navigating emms 
\\<emms-menu-mode-map>"
   :lighter " cccp"
   :keymap 'emms-menu-mode-map
   :after-hook ()
)

(provide 'emms-menu-mode)