# FAudio Pause/Stop Repro Game

Simple example to demonstrate a possible bug in FAudio:

1. Play a Cue
1. Pause that Cue
1. Play another Cue
1. Observe that first Cue is now not only paused, but is also stopped

Expected behaviour is that the first Cue does not stop, and remains in a paused state, ready for resumption.

## Requirements

* FNA checked out in a sibling directory
* FNA libraries to be copied into build dir
* Git LFS, because there are large content files
  * Windows: https://git-lfs.github.com/
  * MacOS: `brew install git-lfs`
  * Linux `sudo apt install git-lfs`

## Instructions

1. `dotnet run --project ReproGame`
1. If the bug is present, observe an exception thrown
1. If the bug is fixed, hear piano music and observe success message to STDOUT

## XACT content

The XACT content in this commit has `limit instances` disabled for the `music` category. It was previously set to `1`. To save faffing about with checking out different commits, the old version of the content is committed with the `.old` suffix.

## Switching XACT content and libraries

`toggle.sh` exists to switch out versions of the XACT content, and also libraries. It will find files ending with `.old`, rename corresponding files to end `.new`, and then strip the `.old` suffix. Writing what it does is way more complicated than understanding it intuitively!

It takes one or two arguments: `xact` or `libs`. The former will act on anything in `ReproGame/bin/Debug/net8.0/Content/audio`, and the latter on `ReproGame/bin/Debug/net8.0`. Therefore if you plonk a new version of FAudio with the filename `libFAudio.0.dylib.new` in the build dir, you'll be able to easily switch between it and whichever you have in there currently.
