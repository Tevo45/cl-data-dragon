;;;; dataset.lisp
;;;; defines the overall interface of a dataset object

(in-package #:cl-data-dragon)

(defgeneric get-data (dataset language path)
  (:documentation "Fetches an object at path determined by concatenating the elements of `path` under language `language`"))

(defgeneric version (dataset)
  (:documentation "Returns the version of data dragon that is being used as the source"))
