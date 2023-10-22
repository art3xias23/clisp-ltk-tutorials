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

 (with-ltk()
   (wm-title *tk* "Example listbox")
   (let* ((countries-listbox (make-instance 'scrolled-listbox))
          (country-seleciton (make-instance 'label
                                            :text ""))
          (button-1 (make-instance 'button
                                   :text "Select China"
                                   :command (lambda() (select-country "China" countries-listbox *country-names*)))))
     (grid countries-listbox 0 0 :rowspan 5)
     (grid (make-instance 'label
                          :text "Country selected: ")0 1)
     (grid country-seleciton 1 1)
     (grid button-1 4 1)
     (listbox-append countries-listbox *country-names*)

     (bind (listbox countries-listbox) "<Double-1>" (lambda(evt) (setf (text country-seleciton)  (nth (first (listbox-get-selection countries-listbox)) *country-names*)))))))

(func)

