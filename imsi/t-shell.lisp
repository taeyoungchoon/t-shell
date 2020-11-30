;; (ext:execute "notepad")
;; (ext:shell "notepad")
;; (ext:run-shell-command "notepad")
;; (ext:run-program "notepad")
;; (execute "notepad")
;; (shell "notepad")
(run-shell-command "dir")		;include shell built-in like dir
(run-shell-command "date /T")		;include shell built-in like dir
(run-program "notepad")			;general with arguments
;; (run-program "date /T")			;general with arguments
