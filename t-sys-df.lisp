(with-open-stream (st (run-program "df" :arguments (list "-h") :output :stream))
  (do ((line (read-line st nil) (read-line st nil)))
      ((null line))
    (format t "~a~%" line)))



