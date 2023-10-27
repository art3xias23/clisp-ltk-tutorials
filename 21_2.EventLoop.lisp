; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
 (with-ltk()
   (wm-title *tk* "Example listbox")

   (defun random-color()
       (list (random 256)
             (random 256)
             (random 256)))

   (defun change-background()
       (ltk:configure *ltk-main-window* :background (random-color)))

   (let ((label (make-instance 'label :text "0"))
         (button (make-instance 'button :text "Start"))
         (counter 0))
    (grid label 1 1)
    (grid button 2 1)

    (labels ((start ()
               (setf (text button) "Stop"
                     (command button) #'stop)
               (after 1 #'random-color)
               (after 1 #'(lambda () (progn
                                       (setf counter (1+ counter))
                                       (setf (text label) counter)))))
             (stop ()))
      (setf (command button) #'start)))))
         
(func)

