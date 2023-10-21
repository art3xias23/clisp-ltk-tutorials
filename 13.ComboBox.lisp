; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Combobox example.lisp")
    (maxsize *tk* 500 500)
    (let ((cb1 (make-instance 'combobox 
                              :values '(red green blue)))
          (cb2 (make-instance 'combobox :values '(red green blue) :state :readonly)))
      (grid cb1 0 0 :pady 10)
      (grid cb2 1 0 :pady 10)
      (bind cb2 "<<ComboboxSelected>>" (lambda(evt) (format t "Cb2 is now ~a~%" (text cb2)))))))
(func)



