(with-open-stream (st (run-program "uptime" :arguments nil :output :stream))
  (let ((uptime (read-line st)))
    (format t "~a~%" uptime)))




