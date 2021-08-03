(in-package :mu-cl-resources)

;;;;
;; NOTE
;; docker-compose stop; docker-compose rm; docker-compose up
;; after altering this file.

;; Describe your resources here

(define-resource publisher ()
  :class (s-prefix "ext:Publisher")
  :properties `((:name :string ,(s-prefix "schema:name")))
  :has-many ((book :via ,(s-prefix "ext:publisher")
                   :inverse t
                   :as "books"))
  :resource-base (s-url "https://mu.semte.ch/examples/publishers/")
  :on-path "publishers")

(define-resource book ()
  :class (s-prefix "schema:Book")
  :properties `((:title :string ,(s-prefix "schema:title"))
                (:isbn :string ,(s-prefix "schema:isbn")))
  :has-one `((publisher :via ,(s-prefix "ext:publisher")
                        :as "publishers"))
  :resource-base (s-url "https://mu.semte.ch/examples/books/")
  :on-path "books")

;; (define-resource author ()
;;   :class (s-prefix "schema:Author")
;;   :properties `((:name :string ,(s-prefix "schema:name"))
;;                 (:given-name :string ,(s-prefix "foaf:givenName"))
;;                 (:family-name :string ,(s-prefix "foaf:familyName")))
;;   :has-many `((book :via ,(s-prefix "schema:author")
;;                     :inverse t
;;                     :as "books"))
;;   :resource-base (s-url "https://mu.semte.ch/examples/authors/")
;;   :on-path "authors")

;; An example setup with a catalog, dataset, themes would be:
;;
;; (define-resource catalog ()
;;   :class (s-prefix "dcat:Catalog")
;;   :properties `((:title :string ,(s-prefix "dct:title")))
;;   :has-many `((dataset :via ,(s-prefix "dcat:dataset")
;;                        :as "datasets"))
;;   :resource-base (s-url "http://webcat.tmp.semte.ch/catalogs/")
;;   :on-path "catalogs")

;; (define-resource dataset ()
;;   :class (s-prefix "dcat:Dataset")
;;   :properties `((:title :string ,(s-prefix "dct:title"))
;;                 (:description :string ,(s-prefix "dct:description")))
;;   :has-one `((catalog :via ,(s-prefix "dcat:dataset")
;;                       :inverse t
;;                       :as "catalog"))
;;   :has-many `((theme :via ,(s-prefix "dcat:theme")
;;                      :as "themes"))
;;   :resource-base (s-url "http://webcat.tmp.tenforce.com/datasets/")
;;   :on-path "datasets")

;; (define-resource distribution ()
;;   :class (s-prefix "dcat:Distribution")
;;   :properties `((:title :string ,(s-prefix "dct:title"))
;;                 (:access-url :url ,(s-prefix "dcat:accessURL")))
;;   :resource-base (s-url "http://webcat.tmp.tenforce.com/distributions/")
;;   :on-path "distributions")

;; (define-resource theme ()
;;   :class (s-prefix "tfdcat:Theme")
;;   :properties `((:pref-label :string ,(s-prefix "skos:prefLabel")))
;;   :has-many `((dataset :via ,(s-prefix "dcat:theme")
;;                        :inverse t
;;                        :as "datasets"))
;;   :resource-base (s-url "http://webcat.tmp.tenforce.com/themes/")
;;   :on-path "themes")

;;
