; Ltk Template
(load "~/.quicklisp/setup.lisp")

(require "asdf")
(require "ltk")

(use-package :ltk)

(defun func ()
   (defparameter *country-names* '("Argentina" "Australia" "Belgium" "Brazil" "Canada" "China"
                                             "Denmark" "Finland" "France" "Greece" "India"
                                             "Italy" "Japan" "Mexico" "Netherlands" "Norway"
                                             "Spain" "Sweden" "Switzerland"))
 (defun select-country (item lb list-items)
   (let*
        ((lower-countries (mapcar #'string-downcase *country-names*))
         (lower-item (string-downcase item))
         (pos (position lower-item lower-countries :test #'string=)))
     (format t "Item is: ~a~%" item)
     (format t "Selected position is: ~d~%" pos)
    (listbox-select lb pos)))

 (defun hard-search(item elements lb)
     (let*
         ((pos (get-position item elements)))
       (if pos
           (progn 
             (listbox-clear lb)
             (listbox-append lb item))
           (progn
             (listbox-clear lb)
             (listbox-append lb "Could not find item")))))

 (defun get-position(item elements)
     (let ((pos (position (string-downcase item) (mapcar #'string-downcase elements) :test #'string=)))
       pos))

 (defun highlight-skip-one-item (lb items)
   (dotimes(i (length items))
       (when (evenp i)
         (listbox-configure (listbox lb) i :background "#f0f0ff"))))
           

 (with-ltk()
   (wm-title *tk* "Example listbox")
   (let* (
          (frame (make-instance 'frame))
          (selection-frame (make-instance 'frame
                                          :master frame))
          (hard-frame (make-instance 'frame
                                     :master frame))
          (dynamic-frame (make-instance 'frame
                                        :master frame))
          (countries-listbox (make-instance 'scrolled-listbox 
                                            :master frame))
          (country-selection-label (make-instance 'label
                                            :text "Country selected: "
                                            :master selection-frame))
          (country-seleciton (make-instance 'label
                                            :text ""
                                            :master selection-frame))
          (hard-search-label (make-instance 'label
                                            :text "Hard Search"
                                            :master hard-frame))
          (dynamic-search-label (make-instance 'label
                                        :text "Dynamic Search"
                                        :master dynamic-frame))
          (hard-search-entry (make-instance 'entry
                                            :master hard-frame))
          (dynamic-search-entry (make-instance 'entry
                                        :master dynamic-frame))
          (hard-search-button (make-instance 'button
                                      :master hard-frame
                                      :text "Search"
                                      :command (lambda() (hard-search (text hard-search-entry) *country-names* (listbox countries-listbox)))))
          (dynamic-search-button (make-instance 'button
                                                :master dynamic-frame
                                                :text "Search"
                                                :command (lambda() (dynamic-search)))))
     (grid frame 0 0)
     (grid selection-frame 0 1 :rowspan 3 :padx 10 :pady 10)
     (grid hard-frame 0 2 :rowspan 3 :padx 10 :pady 10)
     (grid dynamic-frame 0 3 :rowspan 3 :padx 10 :pady 10)
     (grid countries-listbox 0 0 :rowspan 5)
     (grid country-selection-label  0  1)
     (grid country-seleciton  1  1 :rowspan 2)
     (grid hard-search-label  0  2)
     (grid dynamic-search-label  0  3)
     (grid hard-search-entry  1  2 :pady 10)
     (grid dynamic-search-entry  1  3 :pady 10)
     (grid hard-search-button  2  2)
     (grid dynamic-search-button  2  3)
     (listbox-append countries-listbox *country-names*)
     (configure selection-frame :relief :raised :borderwidth 2)
     (configure hard-frame :relief :raised :borderwidth 2)
     (configure dynamic-frame :relief :raised :borderwidth 2)
     (grid-rowconfigure selection-frame 3 :weight 3)

     (bind (listbox countries-listbox) "<Double-1>" (lambda(evt) (setf (text country-seleciton)  (nth (first (listbox-get-selection countries-listbox)) *country-names*))))
     (highlight-skip-one-item countries-listbox *country-names*))))

(func)

