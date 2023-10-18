(load "~/.quicklisp/setup.lisp")
(ql:quickload "ltk")
(use-package :ltk)

(defun hello ()
  (with-ltk ()
    (wm-title *tk* "Feet to Meters")
    (let ((content (make-instance 'frame)))
      (configure content :padding "3 3 12 12")
      (grid content 0 0 :sticky "nsew")
      (grid-columnconfigure *tk* 0 :weight 1)
      (grid-rowconfigure *tk* 0 :weight 1)

      (let* ((feet-entry (make-instance 'entry 
                                       :master content
                                       :width 7))
             (metres-label (make-instance 'label 
                                         :master content
                                         :text "")))
        (flet ((calculate ()
                 (let ((feet (read-from-string (text feet-entry)))
                       (rounded-meters (if (numberp feet)
                                           (/ (round (* 0.3048 feet 10000.0) 10000.0)
                                             "")))
                       (setf (text metres-label) rounded-meters)))
                 (grid feet-entry 1 2 :sticky "we" :padx 5 :pady 5)))
          (grid (make-instance 'label :master content :text "feet")
                1 3 :sticky "w" :padx 5 :pady 5)
          (grid (make-instance 'label :master content :text "is equivalent to")
                2 1 :sticky "e" :padx 5 :pad)        
          (grid metres-label 2 2 :sticky "we" :padx 5 :pady 5)
          (grid (make-instance 'label :master content :text "metres")
                2 3 :sticky "w" :padx 5 :pady 5)
          (grid (make-instance 'button 
                           :master content
                           :text "Calculate"
                           :command #'calculate)
                3 3 :sticky "w" :padx 5 :pady 5)
          (focus feet-entry)
          (bind *tk* "<Return>" (lambda (evt) (calculate))))))))

(hello)
