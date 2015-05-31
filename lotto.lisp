;;
;;
;;

(defun t-random (max)
  (+ (random (- max 1)) 1))

#|
(defun t-random-test (max)
  (loop for i from 1 to 5
    do (print (t-random (max)))))
|#
