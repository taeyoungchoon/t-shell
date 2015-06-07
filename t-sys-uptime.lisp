(require "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)
;;(defpackage #:t-shell
;;  (:use #:cl #:cl-ppcre))

;;(in-package #:t-shell)
;;(require 'cl-ppcre)
;;(asdf:load-system 'cl-ppcre)

(with-open-stream (st (run-program "uptime" :arguments nil :output :stream))
  (let ((uptime (read-line st nil nil)))
;;    (format t "~a~&" (car (split "\\s+" uptime)))))
;;    (format t "~a~&" (car (cl-ppcre:split "\\s+" uptime)))))
    (format t "~a~&" (cl-ppcre:split "\\s+" uptime))))
;;    (format t "~a~&" (car (cl-ppcre:split "\\s+" uptime)))))
;;    (format t "~a~%" (type-of uptime))))
;;    (format t "~a~%" uptime)))

