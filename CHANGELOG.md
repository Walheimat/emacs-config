# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Maps `org-next-visible-heading` (and `previous`) to `M-n` and `M-p`
  respectively.

### Changed

- The advice for `list-buffers--refresh` no longer filters if called
  with `C-u`.
- Function `wal/other-window` will now call `other-frame` if another
  frame exists.

### Fixed

- Turning off `org-tree-slide` now only turns on modes that were
  actually turned off for it. `dimmer-mode` is now also turned off.
  `beacon-mode` is no longer turned on or off.

## [1.7.5] - 2021-07-17

Hefty lefty.

### Added

- Function to write a `dap-mode` template into a JSON and save that as
  a file.
- Macro `wal/try` to do a safe `require` before executing body.
- Added `hydra` for `smerge-mode`.

### Changed

- `dap-mode`-Template for `debugpy` is now an interactive function.
- The `consult` dispatch is bound to `wal/univ`-ed `consult-buffer`
  again.
- `H-u` doubles for `C-u` now.
- Binds `yas-insert-snippet` in its `transient`.
- Adds `wal/univ` commands to `consult` and `projectile` configurations.
- Improves (and extends) the `transient` for `consult`.
- Binds `persp-forget-buffer` in its `transient`; the function
  definitions were shuffled a bit.
- Keymaps for `kmacro` and `bookmark` are now bound in `wal/captain`.
- Kubernetes is now user-prefixed (meaning the default is `H-8`).
- Moves non-letter user-prefixed bindings to use `C-c` instead. This
  was done to both relieve some pinky pressure and potentially free
  prefixed symbol keys.

### Fixed

- Several invocations of `H-u` call `universal-argument-more` now so
  it can be used like `C-u`. Previously only one argument was
  possible.

### Removed

- Package `perspective` is now always enabled, custom variable
  `wal/use-perspectives` was removed.
- Valid efforts are no longer set for `org-mode`.

## [1.7.4] - 2021-07-09

Perpetual transience.

### Added

- Replaced `json-mode` with `jsonian-mode`.
- Expansion pack extras can now be installed individually **and** in
  bulk.
- Going to clocked task bound in `goto-map` + "t".
- Explicit `transient` configuration.
- Binds `avy-goto-char` and `avy-goto-word-0` in `goto-map`.
- Binds more commands in the `transient` for `consult`.
- Creates `transient` maps for `projectile`, `perspective`,
  `yasnippet` and binds them to their keys using `wal/univ`.
- Creates `transient` for `verb` and its response buffers.

### Changed

- Response buffers for `verb` now use directional display.
- Improved bindings for `org-roam`, notably to bind capturing "today".
- Package `org-roam` is now an expansion itself.
- The templates used by `org-roam` have been slightly adapted; the one
  for daily files has an alternative one for adding an active
  timestamp.
- The expansion packs were slightly adapted.
- Package `yasnippet` was reverted to old hook-based configuration.
- Jumping to line and word was moved to `goto-map` using "l" and "w";
  function `wal/avy-jump` was renamed to `wal/avy-goto-word`.
- The freed keys ("j" and "l") are now used by `consult-buffer` and
  `projectile-` and `project-find-file` respectively.
- Package `projectile` uses "p" again for its prefixes.
- Package `lsp-mode` uses "l" again for its prefixes and "h" for the
  dispatch.
- Binding `:wal-bind` for "u" is bound to the dispatch for now.
- Some functions were moved to `wal-func`.
- Forces `compile-mode` to scroll.

### Removed

- Package `org-alert` was mothballed as it doesn't reliably work and
  freezes Emacs too much.

## [1.7.3] - 2021-06-26

Active pause.

### Added

- New variable `wal/active-theme` set during initialization. Function
  `consult-theme` updates it. The variable is read when calling new
  function `wal/load-active-theme` (also called during
  initialization).
- Functions `query-replace` are now bound in `wal/colonel` to "q" and
  "Q".
- Temporary fix to make `kubernetes--save-window-state` work.
- Temporary fix to require `org-indent` because some package uses its
  face without requiring the package.
- Binds toggling built-in package `hideshow`.
- New function `wal/avy-mark-region` to do just that, bound to
  `wal/colonel` + "r SPC".
- Sets `persp-modestring-short` if even the truncated perspective
  names go beyond new threshold `wal/perspective-shorten-after`
  (default is 30 characters).
- Adds `explain-pause-mode` using `quelpa` to have a history of why
  Emacs was slow.

### Changed

- Custom variable `wal/perspective-max-modeline-length` was renamed to
  `wal/perspective-truncate-after`.
- Custom command line flag `--doctor` not sets new variable
  `wal/doctor` which both controls `use-package` collecting statistics
  and turns on `explain-pause-mode`.
- Updated `commitlint` dependencies.
- Dispatch/command map for `bookmark` now uses "C-c m".
- Lints `commitlint` config with `prettier`.

### Removed

- Package `doom-modeline`.
- Package `golden-ratio`.
- Package `company` and `slime-company`.
- Package `highlight-indent-guide` (temporarily).
- Hack to fix duplicate logs in `lsp-dart`.
- Hack to fix `kubernetes` function to refresh overview (about to be
  fixed upstream).
- Hack to fix autoloads for `kubernetes-overview` (seemingly fixed
  upstream).

## [1.7.2] - 2021-06-12

Slug or snail.

### Added

- Warning emitted for non-GNU systems can now be ignored by setting
  `wal/ack-warnings` to `t`.
- Adds and configures packages `python-pytest`.
- Adds `org-speed` command "N" to log non-continuously (as in from
  now).
- Adds `ein` as a Python expansion pack extra.
- Adds `org-alert`.
- Configures `org-refile` to consider headlines up to level 3.

### Changed

- Added listing errors to `lsp-mode` transient.
- Improved inferior shell mappings for `python-mode`.
- Finding a file with projectile while not in a project is now advised
  to switch projects.
- Capture template for `org-roam` now uses slug with no date prefix.
- Commands from `projectile` are advised to only prompt if
  `universal-argument` is given.
- The `modus-themes` are now always loaded because of a customization
  quirk.
- Upgraded to latest `commitlint` version.

### Fixed

- Package `marginalia` is now required with errors ignored (on first
  start-up, the package won't be there).
- Expansion pack packages are now only loaded if installed.
- Advise function `kubernetes-utils--save-window-state` to use a
  function, not a macro so that it works (in Emacs 29).
- Disables `org-sticky-header-mode` in presentations.
- Borderless setting for `modus-themes` was fixed.
- Fixes `slime` requiring potentially missing `slime-company`.

## [1.7.1] - 2021-05-14

Less is less.

### Added

- Adds and configure package `imenu-list`.
- Adds and configures package `org-transclusion`.
- Adds and configures package `goggles`.

### Changed

- Uses `modify-all-frames-parameters` for setting transparency and
  also updates `wal/transparency`.
- Suggest using `.Xmodmap` file for hyper/caps switch.
- No longer uses the `consult` variants of yanking.
- The default `dap-mode` hydra is now bound in the smaller hydra.
- Offset for `fish-mode` is now 2.

### Fixed

- Remove `eshell-mode-map` mapping in `eshell` configuration (the map
  belongs to `esh-mode` but is no longer required).
- Advice for `persp-format-name` takes names shorter than the
  truncation into account.
- Always use copying for backup files to prevent problems with
  `lsp-mode` managed buffers.
- Custom `use-package` keyword `:wal-ways` should now work as intended
  (and not only if a different keyword was included in the state).
  Packages should now be automatically ensured again unless the
  evaluation of keyword, `wal/minimal` and `wal/minimal-exclude`
  resolves to `nil`.

## [1.7.0] - 2021-04-30

Locally sourced.

### Added

- Added `quelpa` so non-MELPA packages can be installed from GitHub.
- Added my mode-line package `wal-line` using `quelpa` recipe.
- Package `ligature` is now installed using `quelpa`.
- Upgraded `commitlint` to latest version.

### Removed

- Package `org-bullets` in favor of using `org-modern`.

### Fixed

- Icons set for `popper` and `org-sticky-header` now use
  `all-the-icons-*` instead of the `doom-modeline` equivalent to
  decouple functionality from `doom-modeline`.
