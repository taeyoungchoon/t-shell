(require "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)

;;(defpackage :net.t0spring.t-shell
;;  (:use :common-lisp :cl-ppcre))
;;(in-package :net.t0spring.t-shell)

(with-open-file (st "/etc/hosts")
  (loop 
     (let ((line (read-line st nil)))
       ;; (if line
       ;; (unless (cl-ppcre:scan-to-strings "^#" line)
       (unless (cl-ppcre:scan "^#" line)
	 (format t "~&~a" line)
	 (return)))))
