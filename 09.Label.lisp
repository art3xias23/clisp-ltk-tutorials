; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Labels Images Fonts")
    (let* 
        ((label-1 (make-instance 'label :text "Simple text label"))
         (image (image-load (make-image) "tcllogo.gif"))))))



