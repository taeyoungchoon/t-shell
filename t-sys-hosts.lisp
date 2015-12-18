;; (with-open-file (s "c:/Windows/system32/drivers/etc/hosts" :direction :input)
(with-open-file (s "c:/foo.txt" :direction :input)
  (format t "~A~&" (read-line s)))
  ;; (loop
  ;;    (let ((line (read s)))
  ;;      (if line
  ;; 	   (format t "~A~&" line)
  ;; 	   (return)))))
