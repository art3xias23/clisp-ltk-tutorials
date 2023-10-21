; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Checkbox example.lisp")
    (let* (
           (image (image-load (make-image) "tcllogo.gif"))
           (button-1 (make-instance 'check-button 
                                    :text "Simple text label"
                                    :command (lambda(value) (format t "Button1 value: ~a~%" value))))
           (button-2 (make-instance 'check-button
                                    :image image
                                    :command (lambda(value) (format t "Button2 value: ~a~%" value))))
           (button-3 (make-instance 'check-button
                                    :image image
                                    :text "Tcl Logo"
                                    :command (lambda(value) (format t "Button3 value: ~a~%" value))))
           (show (make-instance 'button
                                :text "Show states"
                                :command (lambda() (format t "Values b1: ~a, b2: ~a, b3: ~a~%"
                                                           (value button-1)
                                                           (value button-2)
                                                           (value button-3))))))
      (configure button-3 :compound :top)

      (grid button-1 0 0)
      (grid button-2 0 1)
      (grid button-3 0 2)
      (grid show 1 0 :columnspan 3))))

(func)

   
                                    
                                    




