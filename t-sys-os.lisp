(if (probe-file (pathname "c:/Windows/System32/cmd.exe"))
    (with-open-stream (st (run-program "cmd" :arguments '("/c" "ver") :output :stream))
      (loop
	 (let ((line (read-line st nil)))
	   (if line
	       (format t "~A~&" line)
	       (return))))))

;;
;; alternative : lsb_release -d
;;

(if (probe-file (pathname "/bin/uname"))
    (with-open-stream (st (run-program "uname" :arguments '("-s") :output :stream))
      (let ((arch (read st)))
	(cond ((eq arch 'linux)
	       (format t "~a~%" 'linux))
	      ((eq arch 'darwin)
	       (format t "~a~%" 'mac))
	      (t
	       (format t "~a~%" 'unknown))))))
    
