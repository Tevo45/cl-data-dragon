;;;; cl-data-dragon.lisp

(in-package #:cl-data-dragon)

(defclass data-dragon-client ()
  ((language :initarg :language
	     :initform "en_US"
	     :reader language)
   (source :initarg :source
	   :initform (make-instance 'cdn)
	   :documentation "Dataset object used to fetch information")
   (champ-key->name-table)))

(defgeneric get-champ-by-name (client name)
  (:documentation "Fetches champion information by name"))

(defgeneric get-champ-name-by-key (client key)
  (:documentation "Fetches champion name based on key"))

(defgeneric get-champ-by-key (client key)
  (:documentation "Fetches champion information by key"))

(defmethod initialize-instance :after ((client data-dragon-client) &key)
  (with-slots (source language champ-key->name-table) client
    (let ((champs (get-data source language '("championFull"))))
      (setf champ-key->name-table (cdr (assoc :keys champs))))))

(defmethod get-champ-by-name ((client data-dragon-client) name)
  (with-slots (language source) client
    (cdr (assoc :data
		(get-data source language (list "champion" name))))))

(defmethod get-champ-name-by-key ((client data-dragon-client) key)
  (with-slots (champ-key->name-table) client
    (cdr (assoc (intern (format nil "~a" key) :keyword)
		champ-key->name-table))))

(defmethod get-champ-by-key ((client data-dragon-client) key)
  (get-champ-by-name client
		     (get-champ-name-by-key client key)))
