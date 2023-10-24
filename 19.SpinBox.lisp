; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Spinbox example.lisp")
    (let*
        ((days (make-instance 'spinbox :from 1 :to 30))
         (months (make-instance 'spinbox
                                :state :readonly
                                :values '("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")))
         (btn (make-instance 'button
                             :text "Show date"
                             :command (lambda() (format t "~a, ~a~%" (text days) (text months))))))
      (grid days 0 0 :sticky "ew")
      (grid months 1 0 :sticky "ew")
      (grid btn 2 0))))

(func)




