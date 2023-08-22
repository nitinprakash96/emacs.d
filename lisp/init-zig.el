;;; init-zig.el --- Support for the Zig language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package zig-mode
  :ensure t)

(provide 'init-zig)
;;; init-zig.el ends here
