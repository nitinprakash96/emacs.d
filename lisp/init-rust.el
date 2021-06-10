;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (when (maybe-require-package 'rust-mode)
;;   (when (maybe-require-package 'racer)
;;     (add-hook 'rust-mode-hook #'racer-mode))
;;   (when (maybe-require-package 'company)
;;     (add-hook 'racer-mode-hook #'company-mode)))

;; (when (maybe-require-package 'flycheck-rust)
;;   (with-eval-after-load 'rust-mode
;;     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package lsp-mode
             :ensure
             :commands lsp
             :custom
             ;; what to use when checking on-save. "check" is default, I prefer clippy
             (lsp-rust-analyzer-cargo-watch-command "clippy")
             (lsp-eldoc-render-all t)
             (lsp-idle-delay 0.6)
             (lsp-rust-analyzer-server-display-inlay-hints t)
             :config
             (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
             :ensure
             :commands lsp-ui-mode
             :custom
             (lsp-ui-peek-always-show t)
             (lsp-ui-sideline-show-hover t)
             (lsp-ui-doc-enable nil))

(use-package rustic
             :ensure
             :bind (:map rustic-mode-map
                         ("M-j" . lsp-ui-imenu)
                         ("M-?" . lsp-find-references)
                         ("C-c C-c l" . flycheck-list-errors)
                         ("C-c C-c a" . lsp-execute-code-action)
                         ("C-c C-c r" . lsp-rename)
                         ("C-c C-c q" . lsp-workspace-restart)
                         ("C-c C-c Q" . lsp-workspace-shutdown)
                         ("C-c C-c s" . lsp-rust-analyzer-status))
             :config
             ;; uncomment for less flashiness
             ;; (setq lsp-eldoc-hook nil)
             ;; (setq lsp-enable-symbol-highlighting nil)
             ;; (setq lsp-signature-auto-activate nil)

             ;; comment to disable rustfmt on save
             (setq rustic-format-on-save t)
             (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm
  (setq-local buffer-save-without-query t))

(provide 'init-rust)
;;; init-rust.el ends here
