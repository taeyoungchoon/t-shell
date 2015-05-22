#!/usr/bin/env clisp

(load "t-utl.lisp")

(start)
(message "chk networkable")
;(run-program "/usr/bin/uptime")

(setf ping-of-mac "/sbin/ping")
(setf ping-of-linux "/usr/bin/ping")
(setf google-dns "8.8.8.8")

;(probe-file ping-of-linux)
;(run-program "/usr/bin/whereis" :arguments (list "uptime"))
(if (probe-file ping-of-mac)
    (run-program ping-of-mac :arguments (list "-c" "3" google-dns)))
;(run-program "/usr/bin/ping" :arguments (list "-c" "3" "8.8.8.8"))

(end)
