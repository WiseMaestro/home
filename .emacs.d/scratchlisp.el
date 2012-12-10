

(dolist (a '("apple" "bananas" "pears")) (print (reverse-string a)))
(let (( a '("apple" "bananas" "pears")))
(while a 
   (let ((c (car a)))
     (print (reverse-string c))
     (setq a (cdr a)))
))



(save-excursion
  (set-buffer (car (emms-playlist-buffer-list)))
  (goto-char (point-min))
  (let ((a (point)))
    (goto-char (point-max))
    (copy-region-as-kill a (point))))
