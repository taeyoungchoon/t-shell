#!/usr/bin/env clisp

(load "t-utl.lisp")

(start)
(message "chk networkable")
;(run-program "/usr/bin/uptime")
(run-program "/bin/ping" :arguments (list "-c" "3" "168.126.63.1"))
(end)
