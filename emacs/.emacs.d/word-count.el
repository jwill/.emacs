;; simple wordcount, like wc(1) 
;; copy&paste form http://emacswiki.org

(defun count-words (start end)
    "Count number of words"
    (interactive "r")
    (save-excursion
      (save-restriction
 (narrow-to-region start end)
 (goto-char (point-min))
 (count-matches "\\sw+"))))

(defun count-words-in-buffer ()
  (print (count-words (point-min) (point-max))))

(provide 'todotxt)
