# My User Home Directory Configuration

As used for my personal laptop.

## Noteworthy Aspects

- Incorporates [Home Manager](https://github.com/nix-community/home-manager),
  with substantial configuration for MATE Desktop and Firefox.

- Substantial Emacs configuration, and a little configuration for other apps.
  (Not managed by Home Manager.)

- Custom Bash prompt.

- Enables both: sharing changes between multiple users (via the `main` branch),
  and tracking private per-user dot-files (in private per-user branches).

- Integrates with my [NixOS
  configuration](https://github.com/DerickEddington/nixos-config), and provides
  the "skeleton" for new user's home directories, giving reproducible consistent
  user environments that can be tailored per-user.

- [Companion support
  script](https://github.com/DerickEddington/nixos-config/blob/main/users/setup-home)
  for easily setting this up for new users, with hidden `~/.git` so that home
  directories normally do not appear as repositories (which is normally
  undesirable).  The dot-files remain a working-tree checkout of each user's
  repository.

- [Companion
  command](https://github.com/DerickEddington/nixos-config/blob/main/users/with-unhidden-gitdir.nix)
  for temporarily unhiding `~/.git`, for working on dot-files changes.
