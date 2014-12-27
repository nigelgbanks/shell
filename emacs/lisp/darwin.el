;; Set modifier keys
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq ns-function-modifier 'hyper)
;; Set up copy / paste to work with system
(defun mac-copy () (shell-command-to-string "pbpaste"))
(defun mac-paste (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'mac-paste)
(setq interprogram-paste-function 'mac-copy)
