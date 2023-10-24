; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Scale example.lisp")
    (let*
        ((label (make-instance 'label 
                               :text ""))
                               
                               
         (scale (make-instance 'scale 
                               :orientation :horizontal
                               :from 1 
                               :to 100
                               :length 200
                               :command (lambda(val) (setf (text label) (format NIL "Scale is at ~a" (ceiling val)))))))
      (grid label 0 0 :sticky "ew")
      (grid scale 1 0 :sticky "ew"))))
                               

(func)
