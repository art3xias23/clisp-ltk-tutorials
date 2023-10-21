; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
  (with-ltk ()
    (wm-title *tk* "Geometry Manager example.lisp")
    (let* (
           (content (make-instance 'frame))
           (frame (make-instance 'frame 
                                 :master content
                                 :borderwidth 5
                                 :relief :ridge
                                 :width 200 :height 100))
           (name (make-instance 'label 
                                :master content 
                                :text "Name"))
           (entry (make-instance 'entry
                                 :master content))
           (cb1 (make-instance 'check-button 
                               :master content
                               :text "One"))

           (cb2 (make-instance 'check-button 
                               :master content
                               :text "Two"))
            
           (cb3 (make-instance 'check-button 
                               :master content
                               :text "Three"))
           (ok (make-instance 'button 
                              :master content
                              :text "Ok"))

           (cancel (make-instance 'button 
                                  :master content
                                  :text "Cancel")))
      (configure content :padding "3 3 12 12")
      (grid content 0 0 :sticky "nsew")
      (grid frame 0 0 :columnspan 3 :rowspan 3 :sticky "nsew")
      (grid name 0 3 :columnspan 2 :sticky "nw" :padx 5)
      (grid entry 1 3 :columnspan 2 :sticky "new" :padx 5)
      (grid cb1 3 0)
      (grid cb2 3 1)
      (grid cb3 3 2)
      (grid ok 3 3)
      (grid cancel 3 4)
      (grid-columnconfigure *tk* 0 :weight 1)                         ; 4
      (grid-rowconfigure *tk* 0 :weight 1)
      (grid-columnconfigure content 0 :weight 3)
      (grid-columnconfigure content 1 :weight 3)
      (grid-columnconfigure content 2 :weight 3)
      (grid-columnconfigure content 3 :weight 1)
      (grid-columnconfigure content 4 :weight 1)
     (grid-rowconfigure content 1 :weight 1))))

(func)



