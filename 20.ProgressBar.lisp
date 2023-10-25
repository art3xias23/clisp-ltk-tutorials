; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
 (with-ltk()
   (wm-title *tk* "Progress Bar example.lisp")
   (let*
       ((bar-1 (make-instance 'progressbar :length 100))
        (bar-2 (make-instance 'progressbar :length 200 :orientation :vertical))
        (bar-3 (make-instance 'progressbar :length 100 :mode :indeterminate)))
     (setf (value bar-1) 50)
     (setf (value bar-2) 80)

     (grid bar-1 0 0 :padx 5 :pady 5)
     (grid bar-2 0 1 :rowspan 2 :padx 5 :pady 5)
     (grid bar-3 1 0)

     (format-wish "~a start ~a" (widget-path bar-3) 10))))

(func)
