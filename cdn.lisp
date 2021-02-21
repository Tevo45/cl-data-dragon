;;;; cdn.lisp
;;;; fetches data-dragon information from a remote path (like riot's cdn)

(in-package #:cl-data-dragon)

(defun fetch-string (&rest drakma-args)
  (flexi-streams:octets-to-string
   (apply #'drakma:http-request drakma-args)
   :external-format :utf-8))

(defun fetch-json (&rest drakma-args)
  (json:decode-json-from-string (apply #'fetch-string drakma-args)))

(defun get-latest-dd-version ()
  (car (fetch-json "https://ddragon.leagueoflegends.com/api/versions.json")))

(defclass cdn ()
  ((base :initarg :base-url
	 :initform "http://ddragon.leagueoflegends.com/cdn"
	 :reader base)
   (version :initarg :version
	    :initform (get-latest-dd-version)
	    :reader version)))

(defmethod get-data ((dataset cdn) language path)
  (fetch-json (format nil "~a/~a/data/~a/~{~a~^/~}.json" (base dataset) (version dataset) language path)))
