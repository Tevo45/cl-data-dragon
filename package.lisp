;;;; package.lisp

(defpackage #:cl-data-dragon
  (:nicknames #:lol-dd)
  (:use #:cl)
  (:export :data-dragon-client
           :get-champ-by-name
	   :get-champ-by-key
           :get-champ-name-by-key
	   
	   :get-data
           :version
	   
	   :cdn
           :get-latest-dd-version))
