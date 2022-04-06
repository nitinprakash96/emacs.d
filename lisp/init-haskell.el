;;; init-haskell.el --- Support the Haskell language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'haskell-mode)
;;   (add-hook 'haskell-mode-hook 'subword-mode)
;;   (add-hook 'haskell-cabal-mode 'subword-mode)


;;   (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;;   (add-auto-mode 'haskell-mode "\\.ghci\\'")

;;   ;; Indentation
;;   (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;; Source code helpers

;; (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

;;   (when (maybe-require-package 'reformatter)
;;     (reformatter-define hindent
;;       :program "hindent"
;;       :lighter " Hin")

;;     (defalias 'hindent-mode 'hindent-on-save-mode)

;;     ;; (reformatter-define ormolu
;;     ;;   :program "ormolu"
;;     ;;   :lighter " Orm")

;;     (reformatter-define stylish-haskell
;;       :program "stylish-haskell"
;;       :lighter " Sty"))

;;   (with-eval-after-load 'haskell-mode
;;     (define-key haskell-mode-map (kbd "C-c h") 'hoogle)
;;     (define-key haskell-mode-map (kbd "C-o") 'open-line))


;;   (with-eval-after-load 'page-break-lines
;;     (add-to-list 'page-break-lines-modes 'haskell-mode)))


;; TODO: Can we get rid of use-package to keep it consistent with rest of the modules?

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package yasnippet
  :ensure t)

(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-haskell
  :ensure t
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper")
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  ;; (setq lsp-haskell-stylish-haskell-on t)
  (setq lsp-haskell-hlint-on t)
  (setq lsp-haskell-format-on-import-on t)
  (setq lsp-haskell-server-args ())
  ;; Comment/uncomment this line to see interactions between lsp client/server.
  (setq lsp-log-io t))

(provide 'init-haskell)
;;; init-haskell.el ends here
