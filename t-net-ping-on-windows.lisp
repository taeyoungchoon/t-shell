;;(sb-ext:run-program "/usr/bin/curl"
;;		    '("https://www.kernel.org/finger_banner")
;;		    :output *standard-output*)

(run-program "cmd" :arguments '("/c" "chcp" "437"))
(run-program "cmd" :arguments '("/c" "cls"))
;;(run-program "c:/Windows/system32/PING.exe" :arguments '("-n" "2" "8.8.8.8"))
(run-program "ping" :arguments '("-n" "3" "8.8.8.8"))
(run-program "cmd" :arguments '("/c" "pause"))
(run-program "cmd" :arguments '("/c" "chcp" "949"))
