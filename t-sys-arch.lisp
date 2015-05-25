#|
run-program uname output stream
with-open-stream
cond Darwin then mac thenlinux
|#

(run-program "uname" :output stream)
