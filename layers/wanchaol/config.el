;; projectile + neotree sync
(setq projectile-switch-project-action 'neotree-projectile-action)

;; org mode todo task states config
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w)" "HOLD(h)" "|" "CANCELLED(c)" "PHONE" "MEETING"))))

;; org mode agenda view config
(setq org-agenda-files
      (list "~/Dropbox/Apps/MobileOrg/gtd.org"))

(setq org-agenda-custom-commands
      '(
        ("n" todo "NEXT")
        ("w" todo "WAITING")
        ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))
        )
      )

;; org mode capture
;; Source: https://www.suenkler.info/docs/emacs-orgmode/
(setq org-capture-templates
      '(
        ;; Create Todo under GTD.org -> Work -> Tasks
        ;; file+olp specifies to full path to fill the Template
        ("w" "Work TODO" entry (file+olp "~/Dropbox/Apps/MobileOrg/gtd.org" "Work" "Tasks")
         "* TODO %? \n:PROPERTIES:\n:CREATED: %U\n:END:")
        ;; Create Todo under GTD.org -> Private -> Tasks
        ;; file+olp specifies to full path to fill the Template
        ("p" "Private TODO" entry (file+olp "~/Dropbox/Apps/MobileOrg/gtd.org" "Private" "Tasks")
         "* TODO %? \n:PROPERTIES:\n:CREATED: %U\n:END:")
        ))

;; Automatically add tags when state changes occur
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
