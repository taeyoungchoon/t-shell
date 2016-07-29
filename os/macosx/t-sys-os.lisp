(with-open-stream (st (ext:run-shell-command "uname -a" :output :stream))
  (let ((arch (read st)))
    (cond ((eq arch 'linux)
	   (format t "~a~%" 'linux))
	  ((eq arch 'darwin)
	   (format t "~a~%" 'macosx))
	  (t
	   (format t "~a~%" 'unknown)))))
    
