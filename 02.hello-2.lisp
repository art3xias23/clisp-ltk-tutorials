(load "~/.quicklisp/setup.lisp")
(ql:quickload "ltk")
(in-package :ltk)

(defun hello-2()
    (with-ltk ()
      (let* ((f (make-instance 'frame))
             (b1 (make-instance 'button
                                :master f
                                :text "Button 1"
                                :command (lambda () (format t "Button1~%"))))
             (b2 (make-instance 'button
                                 :master f
                                 :text "Button 2"
                                 :command (lambda () (format t "Button2~%")))))
        (pack f)
        (pack b1 :side :right)
        (pack b2 :side :left)
        (configure f :borderwidth 10)
        (configure f :relief :flat))))

(hello-2)

