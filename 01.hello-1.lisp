(load "~/.quicklisp/setup.lisp")
(ql:quickload "ltk")
(require "ltk")
(in-package :ltk)

(defun hello-1()
    (with-ltk ()
      (let ((b (make-instance 'button
                              :master nil
                              :text "Click me"
                              :command (lambda() (format t "Button has been clicked~%")))))
        (pack b))))

(hello-1)
