(with-open-stream (st (run-program "cmd" :arguments '("/c" "time" "/T") :output :stream))
  (loop
     (let ((line (read-line st nil)))
       (if line
	   (format t "~A~&" line)
	   (return)))))
