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

  (with-ltk()
    (wm-title *tk* "Example listbox")
    (let ((countries-listbox (make-instance 'scrolled-listbox))
          (country-seleciton (make-instance 'label
                                            :text "")))
      (grid countries-listbox 0 0 :rowspan 5)
      (grid (make-instance 'label
                           :text "Country selected: ")0 1)
      (grid country-seleciton 1 1)
      (listbox-append countries-listbox *country-names*)

      (bind (listbox countries-listbox) "<Double-1>" (lambda(evt) (setf (text country-seleciton)  (nth (first (listbox-get-selection countries-listbox)) *country-names*)))))))

(func)

