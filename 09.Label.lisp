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
         (image (image-load (make-image) "tcllogo.gif"))
         (label-2 (make-instance 'label :image image))
         (label-3 (make-instance 'label
                                 :font "Halvetica 14 bold"))
         (label-4 (make-instance 'label
                                 :image image :text "Tcl Logo"))
         (label-5 (make-instance 'label
                                 :image image :text "Tcl Logo"))
         (label-6 (make-instance 'label
                                 :image image :text "Tcl Logo"))
         (text "\"Lisp is worth learning for the profound englightment experience you will have when you finally get it, the experience will make you a better programmer for the rest of your days, even if you never actually use lisp iteself a lot.\" - Eric Raymond, \"How to Become a Hacker\"")
         (label-7 (make-instance 'label
                                 :text text :wraplength 300)))
      (configure label-4 :compound :bottom)
      (configure label-5 :compound :center)
      (configure label-6 :compound :top)

      (grid label-1 0 0)
      (grid label-2 0 1)
      (grid label-3 0 2)
      (grid label-4 1 0)
      (grid label-5 1 1)
      (grid label-6 1 2)
      (grid label-7 2 0 :columnspan 3 :sticky "news"))))
                                 


(func)
