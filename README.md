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
