;;; packages.el --- wanchaol layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Wanchao Liang <wanchao@wanchaol-C02S60XWG8WM>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `wanchaol-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `wanchaol/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `wanchaol/pre-init-PACKAGE' and/or
;;   `wanchaol/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst wanchaol-packages
  '(
    flycheck
    protobuf-mode
    ;; google-c-style
    )
  "The list of Lisp packages required by the wanchaol layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun wanchaol/init-protobuf-mode ()
  (use-package protobuf-mode
    :init (progn
            (defun spacemacs//setup-protobuf-imenu ()
              "Setup imenu regex for protocol buffers."
              (setq imenu-generic-expression '((nil "^[[:space:]]*\\(message\\|service\\|enum\\)[[:space:]]+\\([[:alnum:]]+\\)"
                                                    2))))
            (add-hook 'protobuf-mode-hook 'spacemacs//setup-protobuf-imenu))))

(defun wanchaol/post-init-flycheck ()
  (spacemacs/add-flycheck-hook '(protobuf-mode c-mode c++-mode))
  )

;;define my init hook
;; (defun wanchaol/post-init-google-c-style ()
;;   (use-package google-c-style
;;     :init (add-hook 'c-mode-common-hook 'google-set-c-style)))

;; (defun my-c-mode-common-hook ()
;;   (setq flycheck-clang-include-path (list (expand-file-name "../include/") (projectile-expand-root "/include"))))
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Bind clang-format-region to C-M-tab in all modes:
(global-set-key [C-M-tab] 'clang-format-region)
;; Bind clang-format-buffer to tab on the c++-mode only:
(add-hook 'c++-mode-hook 'clang-format-bindings)
(defun clang-format-bindings ()
  (define-key c++-mode-map [tab] 'clang-format-buffer))
;;; packages.el ends here
