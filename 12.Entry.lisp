; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Entry example.lisp")
    (let* 
        ((entry-1 (make-instance 'entry))
         (entry-2 (make-instance 'entry :show "*"))
         (show (make-instance 'button
                              :text "Show entries"
                              :command (lambda() (format t "Entries: ~a:~a~%" (text entry-1) (text entry-2))))))
      (grid (make-instance 'label
                           :text "Username:") 0 0)
      (grid entry-1 0 1)
      (grid (make-instance 'label
                           :text "Password") 1 0)
      (grid entry-2 1 1)
      (grid show 2 0 :columnspan 2)
      (bind *tk* "<Return>" (lambda(env) (funcall (command show)))))))

(func)

           

          




