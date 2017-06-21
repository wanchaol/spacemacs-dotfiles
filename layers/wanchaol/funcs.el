(defun clang-format-bindings ()
  (define-key c++-mode-map [tab] 'clang-format-buffer))

;; (defun my-c-mode-common-hook ()
;;   (setq flycheck-clang-include-path (list (expand-file-name "../include/") (projectile-expand-root "/include"))))
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
