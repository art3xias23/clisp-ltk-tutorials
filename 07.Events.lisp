(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk()
      (let ((label (make-instance 'label
                                  :text "Starting...")))
           (grid label 0 0 :padx 50 :pady 50)
           (bind label "<Enter>"
                 (lambda(evt) (setf (text label) "Moved Mouse inside")))
           (bind label "<ButtonPress-1>"
                 (lambda(evt) (setf (text label) "Click left mouse button")))
           (bind label "<Leave>"
                 (lambda(evt) (setf (text label) "Moved mouse outside")))
           (bind label "<3>"
                 (lambda(evt) (setf (text label) "Clicked right mouse button")))
           (bind label "<Double-1>"
                 (lambda(evt) (setf (text label) "Double clicked")))
           (bind label "<B3-Motion>"
                 (lambda(evt) (setf (text label) (format NIL "Right button drag to ~a ~a" (event-x evt) (event-y evt))))))))

(func)


