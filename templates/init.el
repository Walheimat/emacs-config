;;; init.el --- Walheimat's init file

;;; Commentary:

;; This init file serves as the controller to Walheimat's literate
;; configuration.
;;
;;It will tangle that file's source blocks to create and subsequently
;;load package `wal'.
;;
;; Either copy this file to any location Emacs will load from (cf.
;; 49.4 The Emacs Initialization File in the manual) or load the
;; included setup file to do this for you.

;;; Code:

(declare-function org-babel-tangle-file "ob-tangle")

(defvar wal/emacs-config-default-path
  (expand-file-name "emacs-config" user-emacs-directory)
  "The default path to Walheimat's literate configuration.")

(defvar wal/emacs-config-package-path
  (expand-file-name "wal" wal/emacs-config-default-path)
  "The path to the tangled Lisp files.")

(defvar wal/init-error nil
  "Set to the error message if initialization failed.")

(defun wal/find-or-create-package-directory ()
  "Find (or create) package directory.

Returns the path to the directory or nil (if created)."
  (if (file-directory-p wal/emacs-config-package-path)
      wal/emacs-config-package-path
    (make-directory wal/emacs-config-package-path)))

(defun wal/directory-files (directory)
  "Get all non-dot-directory files in DIRECTORY."
  (nthcdr 2 (directory-files directory t)))

(defun wal/tangle-config (&optional maybe load)
  "(MAYBE) tangle the configuration (and LOAD it).

The init file will call this function to tangle source blocks
only if that hasn't already happened and then load the package.

If called interactively this will tangle the blocks without
loading the package."
  (interactive)
  (let ((source-file (expand-file-name "README.org" wal/emacs-config-default-path))
        (found-target-dir (wal/find-or-create-package-directory)))
    (unless (and maybe found-target-dir)
      (require 'org)
      (require 'ob-tangle)
      (org-babel-tangle-file source-file))
    (when load
      (condition-case err
          (load-file (expand-file-name "wal.el" (wal/find-or-create-package-directory)))
        (error
         (setq wal/init-error (error-message-string err))
         (delay-warning
          'wal
          (format "Initializing the config failed.\n\nReview the following message:\n\n%s\n\nThen tangle again." wal/init-error)
          :error))))))

;; Maybe tangle, load.
(let ((gc-cons-threshold most-positive-fixnum)
	  (gc-cons-percentage 0.8)
      (file-name-handler-alist nil))
  (wal/tangle-config t t))

;;; init.el ends here
