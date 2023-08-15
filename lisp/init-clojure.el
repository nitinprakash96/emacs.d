;;; init-clojure.el --- Clojure support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; See also init-clojure-cider.el

(when (maybe-require-package 'clojure-mode)
  (require-package 'cljsbuild-mode)
  (require-package 'elein)

  (with-eval-after-load 'clojure-mode
    (add-hook 'clojure-mode-hook 'sanityinc/lisp-setup)))

;; First install the package:
(use-package flycheck-clj-kondo
  :ensure t)

;; then install the checker as soon as `clojure-mode' is loaded
(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))

(provide 'init-clojure)
;;; init-clojure.el ends here
