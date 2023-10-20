(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func()
    (with-ltk()
     (wm-title *tk* "frame-example.lisp")
     (let ((frame1 (make-instance 'frame :borderwidth 1 :relief :groove))
           (frame2 (make-instance 'frame :borderwidth 2 :relief :sunken))
           (frame3 (make-instance 'frame :borderwidth 3 :relief :raised)))
       (grid frame1 0 0 :padx 5 :pady 5)
       (grid frame2 0 1 :padx 5 :pady 5)
       (grid frame3 0 2 :padx 5 :pady 5)
       (configure frame1 :padding "2")
       (configure frame2 :padding "5 40 10 10")
       (grid (make-instance 'label
                            :master frame1 :text "Label1") 0 0)
       (grid (make-instance 'label
                            :master frame2 :text "Label2") 0 0)
       (grid (make-instance 'label
                            :master frame3 :text "Label3") 0 0))))

(func)


     
