(load "~/.quicklisp/setup.lisp")
(require "asdf")
(require "ltk")

(use-package :ltk)

(defun hello ()
    (with-ltk ()
      (wm-title *tk* "Tip Calculator")
      (let ((content (make-instance 'frame)))
        (let* ((a-rdb (make-instance 'radio-button
                                     :master content
                                     :text "Cheap"
                                     :variable "tip"
                                     :value "5")) 
               (b-rdb (make-instance 'radio-button
                                                                  :master content
                                                                  :text "Medium"
                                                                  :variable "tip"
                                                                  :value "15"))
               (c-rdb (make-instance 'radio-button
                                                                   :master content
                                                                   :text "Generous"
                                                                   :variable "tip"
                                                                   :value "25"))
               (total (make-instance 'entry
                                                    :master content
                                                    :text "Total Fee"))

               (total-tip (make-instance 'label
                                                       :master content
                                                       :text "")))
              (flet ((calculate ()
                                (let ((amount   (* (if(numberp (text total)) (text-total) 0) (/(value a-rdb) 100))))
                                   (setf (text total-tip) amount))))
                  (grid (make-instance 'label
                                       :master content
                                       :text "Total Tip") 3 1)
                  (grid total-tip 3 3)
                
                  (grid total 1 3)
                  (grid a-rdb 2 1)
                  (grid b-rdb 2 2)
                  (grid c-rdb 2 3)
                  (grid (make-instance 'button
                                            :master content
                                            :text "Calculate"
                                            :command #'calculate))
                  (grid (make-instance 'label
                                                :master content
                                                :text "Total Tip") 3 1)
                  (grid total-tip 3 3))))))

(hello)
