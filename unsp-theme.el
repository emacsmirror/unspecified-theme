;;; unsp-theme.el --- Theme unspecifying most face attributes  -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Free Software Foundation, Inc.

;; Author:                  Mekeor Melire <mekeor@posteo.de>
;; Created:                 2024
;; Homepage:                https://codeberg.org/mekeor/emacs-unsp
;; Keywords:                faces, theme
;; Maintainer:              Mekeor Melire <mekeor@posteo.de>
;; Package-Requires:        ((emacs "28.1") (most-faces "0.0.3"))
;; SPDX-License-Identifier: GPL-3.0-or-later
;; Version:                 0.0.1

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see
;; <https://www.gnu.org/licenses/>.

;;; Commentary:

;; `unsp-theme' is a package that provides an equally named theme
;; which sets most (if not all) face attributes to `unspecified'. In
;; particular, it thus unspecifies all default attributes of defined
;; faces. It is useful for Emacs users who want to radically theme the
;; user interface themselves. And it is useful for theme authors who
;; want to make sure they do not rely on pre-given face attributes and
;; thus for debugging.

;; For a screenshot, check out the `screenshot' branch or access it
;; online:
;; https://codeberg.org/mekeor/emacs-unsp/raw/branch/screenshot/screenshot.png

;;; Code:

(require 'most-faces)

(deftheme unsp)

(defface unsp
  '((t
      :background unspecified
      :box unspecified
      :extend unspecified
      :family unspecified
      :foundry unspecified
      :foreground unspecified
      :height unspecified
      :inherit unspecified
      :inverse-video unspecified
      :overline unspecified
      :slant unspecified
      :stipple unspecified
      :strike-through unspecified
      :underline unspecified
      :weight unspecified
      :width unspecified))
  "A face with all attributes unspecified.")

(apply #'custom-theme-set-faces 'unsp
  (seq-map
    (lambda (face)
      (list face
        '((t
            :background unspecified
            :box unspecified
            :extend unspecified
            :family unspecified
            :foundry unspecified
            :foreground unspecified
            :height unspecified
            :inherit unspecified
            :inverse-video unspecified
            :overline unspecified
            :slant unspecified
            :stipple unspecified
            :strike-through unspecified
            :underline unspecified
            :weight unspecified
            :width unspecified))))
    ;; `most-faces' promises to keep `default' face at beginning.
    (cdr most-faces-as-faces)))

(apply #'custom-theme-set-variables 'unsp
  (seq-map
    (lambda (var) (list var ''unsp))
    most-faces-as-variables))

(funcall #'custom-theme-set-variables 'unsp
  `(highlight-parentheses-colors nil)
  `(ibuffer-fontification-alist nil))

(provide-theme 'unsp)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
    (file-name-directory load-file-name)))

(provide 'unsp-theme)

;;; unsp-theme.el ends here
