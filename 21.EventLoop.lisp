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
     (grid progressbar 1 0 :padx 5 :pady 5)

     (labels ((start ()
                (setf (text button) "Stop!"
                      (command button) #'stop)
                (setf (text label) "Working ...")
                (setf interrupt nil)
                (after 1 #'next))
              (stop()
                  (setf interrupt t))
              (next (&optional (count 0))
                (configure progressbar :value count)
                (if interrupt
                    (result "")
                    (after 100
                           #'(lambda ()
                               (if (= count 20)
                                   (result 42)
                                   (next (1+ count)))))))
              (result (answer)
                (configure progressbar :value 0)
                (setf (text button) "Start!"
                      (command button) #'start)
                (setf (text label)
                      (if (numberp answer)
                          (format NIL "Answer: ~a" answer)
                          "No Answer"))))
       (setf (command button) #'start)))))

     

(func)
                                     

