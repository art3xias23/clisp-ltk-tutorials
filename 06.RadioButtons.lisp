(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun hello ()
  (with-ltk ()
    (let* (
           (a-rdb (make-instance 'radio-button
                                       :text "Option A"
                                       :variable "choice" 
                                       :value "10"))
           (b-rdb (make-instance 'radio-button
                                                   :text "Option B"
                                                   :variable "choice"
                                                   :value "20"))
           (c-rdb (make-instance 'radio-button
                                                   :text "Option C"
                                                   :variable "choice"
                                                   :value "30"))
           (but (make-instance 'button
                                             :text "Get Radio Value"
                                             :command (lambda() (format t "Value is: ~a~%" (value c-rdb))))))
          (grid a-rdb 1 1)
          (grid b-rdb 1 2)
          (grid c-rdb 1 3)
          (grid but 2 1 :columnspan 3))))

(hello)
