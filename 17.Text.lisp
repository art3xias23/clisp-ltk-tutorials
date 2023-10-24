; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Text example.lisp")
    (let
        ((text-1 (make-instance 'scrolled-text))
         (text-2 (make-instance 'scrolled-text))
         (txt "\"Lisp is worth learning for the profound enlightment experience you will have when you finally get it; that experience will make you a better programmer for the rest of your days even if you never actually use Lisp itself a lot\""))
        (append-text (textbox text-1) txt)

        (configure (textbox text-1) :wrap :word)
        (grid text-1 0 0)
        (grid text-2 0 1)
      (dotimes ( i 10)
        (append-text (textbox text-1) txt)
        (append-newline (textbox text-1)))

      (setf (text (textbox text-2)) txt))))

(func)





