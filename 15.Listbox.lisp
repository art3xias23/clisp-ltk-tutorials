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
    (let ((countries-listbox (make-instance 'scrolled-listbox)))
      (grid countries-listbox 0 0 :rowspan 5)

      (listbox-append countries-listbox "Bulgaria")

      (bind (listbox countries-listbox) "<Double-1>" (lambda(evt) (format t "Selection is ~a~%" (listbox-get-selection countries-listbox)))))))

(func)

