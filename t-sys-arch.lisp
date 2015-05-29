;;
;; arch detector
;;
;; written by taeyoungchoon
;;
;; todo
;; - on windows
;; *** - Win32 error 2 (ERROR_FILE_NOT_FOUND): The system cannot find the file specified.
;;

;; probe-file first
(with-open-stream (st (run-program "/bin/uname" :arguments '("-a") :output :stream))
  (let ((arch (read st)))
    (cond ((eq arch 'linux)
	   (format t "~a~%" arch))
	  ((eq arch 'darwin)
	   (format t "~a~%" arch)))))



