; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
 (with-ltk()
   (wm-title *tk* "Example even loop.lisp")
   (let ((interrupt nil)
         (button (make-instance 'button :text "Start!"))
         (label (make-instance 'label :text "No Answer"))
         (progressbar (make-instance 'progressbar 
                                     :orientation :horizontal
                                     :mode :determinate
                                     :maximum 20)))
     (grid button 0 1 :padx 5 :pady 5)
     (grid label 0 0 :padx 5 :pady 5)
     (grid progressbar 1 0 :padx 5 :pady 5))))

     

(func)
                                     

