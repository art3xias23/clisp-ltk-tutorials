; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Scrollbar example.lisp")
    (let ((listbox (make-instance 'listbox :height 5))
          (scrollbar (make-instance 'scrollbar :orientation :vertical))
          (status (make-instance 'label :text "Status message here")))
      (grid listbox 0 0 :sticky "nwes")
      (grid scrollbar 0 1 :sticky "ns")
      (grid status 1 0 :columnspan 2 :sticky "ew"))))
(func)




