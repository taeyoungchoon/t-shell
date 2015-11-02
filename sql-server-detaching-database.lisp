(defun build-dbname (mon day)
  (format nil "M6_LOG_2015~2,'0d~2,'0d_000000" mon day))

(defun main ()
  (loop for mon from 6 to 7 do
       (loop for day from 1 to 31 do
	    (format t "sp_detach_db ~a~&" (build-dbname mon day))
	    (format t "go~&"))))

(main)
