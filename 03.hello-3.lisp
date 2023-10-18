(load "~/.quicklisp/setup.lisp")
(ql:quickload "nodgui")
(in-package :nodgui)

(defun hello ()
  (with-nodgui ()
    (grid
      (make-instance 'button
                     :text "Hello") 0 0)))

(hello)
