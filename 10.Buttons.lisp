; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Buttons example.lisp")
    (let* ((image (image-load (make-image) "tcllogo.gif"))
           (button-1 (make-instance 'button
                                    :text "Button1"
                                    :command (lambda() (format t "Button1~%"))))
           (button-2 (make-instance 'button
                                    :image image
                                    :command (lambda() (format t "Button2~%"))))
           (button-3 (make-instance 'button
                                    :image image
                                    :text "Button3"
                                    :command (lambda() (format t "Button3~%")))))
      (configure button-3 :compound :top)
      (configure button-1 :state :disabled)

      (bind *tk* "<Return>" (lambda(evt) (funcall (command button-2))))

      (grid button-1 0 0)
      (grid button-2 0 1)
      (grid button-3 0 2))))

(func)




