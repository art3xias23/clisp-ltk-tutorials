(load "~/.quicklisp/setup.lisp")
(require "asdf")
(require "ltk")

(use-package :ltk)

(defun run ()
    (with-ltk ()
      (wm-title *tk* "Tip Calculator")
      (let* ((a-rdb (make-instance 'radio-button
                                   :text "Cheap"
                                   :variable "tip"
                                   :value "5")) 
             (b-rdb (make-instance 'radio-button
                                                                :text "Medium"
                                                                :variable "tip"
                                                                :value "15"))
             (c-rdb (make-instance 'radio-button
                                                                 :text "Generous"
                                                                 :variable "tip"
                                                                 :value "25"))
             (total (make-instance 'entry
                                                  :text ""))

             (total-tip (make-instance 'label
                                                     :text "")))
            (flet ((calculate ()
                              (let ((amount   (* (parse-integer (text total)) (/ (value c-rdb) 100))))
                                 (setf (text total-tip) (format NIL "~,2f" amount)))))
                (grid total 1 3)
                (grid a-rdb 2 1)
                (grid b-rdb 2 2)
                (grid c-rdb 2 3)
                (grid (make-instance 'button
                                          :text "Calculate"
                                          :command (lambda() (calculate))) 3 2)
                (grid (make-instance 'label
                                              :text "Total Tip") 3 1)
                (grid total-tip 3 3)))))

(run)
