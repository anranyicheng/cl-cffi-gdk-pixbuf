;;; ----------------------------------------------------------------------------
;;; liber.lisp
;;;
;;; Copyright (C) 2022 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------

#-liber-documentation
(push :liber-documentation *features*)

(asdf:load-system :liber)
(asdf:load-system :cl-cffi-gdk-pixbuf :force t)

(defpackage :liber-gdk-pixbuf
  (:use :common-lisp)
  (:export :generate-html
           :generate-html-single-page))

(in-package :liber-gdk-pixbuf)

;;; ---------------------------------------------------------------------------

(defun generate-html ()
  (let* ((base (asdf:component-pathname (asdf:find-system :cl-cffi-gdk-pixbuf)))
         (output-directory
             (merge-pathnames "../books/cl-cffi-gdk-pixbuf/" base)))
    (format t "Generate HTML to ~a~%" output-directory)
    (ensure-directories-exist output-directory)
    (liber:generate-html-documentation
      '(:gdk-pixbuf)
      output-directory
      :author "Crategus"
      :author-url "http://www.crategus.com"
      :index-title "cl-cffi-gdk-pixbuf API documentation"
      :heading "cl-cffi-gdk-pixbuf"
      :css "crategus.css"
      :single-page-p nil
      :paginate-section-p nil
      :include-slot-definitions-p t
      :include-internal-symbols-p nil)))

(defun generate-html-single-page ()
  (let* ((base (asdf:component-pathname (asdf:find-system :cl-cffi-gdk-pixbuf)))
         (output-directory
             (merge-pathnames "../books/cl-cffi-gdk-pixbuf/single-page/" base)))
    (format t "Generate Single PAGE HTML to ~a~%" output-directory)
    (ensure-directories-exist output-directory)
    (liber:generate-html-documentation
      '(:gdk-pixbuf)
      output-directory
      :author "Crategus"
      :author-url "http://www.crategus.com"
      :index-title "cl-cffi-gdk-pixbuf API documentation (single page)"
      :heading "cl-cffi-gdk-pixbuf"
      :css "crategus.css"
      :single-page-p t
      :include-slot-definitions-p t
      :include-internal-symbols-p nil)))

;;; --- End of file liber.lisp -------------------------------------------------
