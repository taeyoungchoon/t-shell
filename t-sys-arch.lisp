;;
;; arch detector
;;
;; written by taeyoungchoon
;;

(with-open-stream (st (run-program "/bin/uname" :arguments '("-a") :output :stream))
  (let ((arch (read st)))
    (cond ((eq arch 'linux)
	   (format t "~a~%" arch))
	  ((eq arch 'darwin)
	   (format t "~a~%" arch)))))



