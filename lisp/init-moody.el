;;; init-moody.el --- Adds a ribbon to the modeline -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function))

(provide 'init-moody)
;;; init-moody.el ends here
