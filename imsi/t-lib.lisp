;;(sb-ext:run-program "/usr/bin/curl"
;;		    '("https://www.kernel.org/finger_banner")
;;		    :output *standard-output*)

(run-program "/usr/bin/curl"
		    :arguments '("https://www.kernel.org/finger_banner"))
