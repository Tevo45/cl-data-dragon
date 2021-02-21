;;;; cl-data-dragon.asd

(asdf:defsystem #:cl-data-dragon
  :description "Common Lisp interface to Riot's Data Dragon"
  :author "Estevan Castilho <estevan.cps@gmail.com>"
  :license  "Public Domain"
  :version "0.0.1"
  :serial t
  :depends-on ("cl-json" "drakma")
  :components ((:file "package")
	       (:file "dataset")
	       (:file "cdn")
               (:file "data-dragon")))
