# qw

Profile-based, multi-window workspaces in terminator with individualized bash histories and working directories.

## Overview

`qw` is a utility that harnesses the power of `terminator` to create a highly customized, multi-window terminal environment. Each profile supports multiple shells (or subwindows), and each shell retains its own dedicated bash history and current working directory. This design ensures that users can seamlessly switch between different work contexts or projects without losing their work state.

## Features

- **Profile-based Workspaces:** Execute `qw <profile_name>` to spawn or switch to a terminal workspace defined by that profile.
- **Persistent Shell States:** Each shell in a `terminator` window maintains its unique bash history and current directory, persisting across sessions.
- **Bash Completion:** Integrated bash completion provides auto-suggestions for `qw` based on available profiles, streamlining the command invocation process.
- **Profile Management:** Commands to list, remove, or rename profiles with ease.

## Prerequisites

Ensure

- **Terminator:** [Terminator](https://gnome-terminator.org/)
- **wmctrl:** [wmctrl](https://github.com/dancor/wmctrl)

are installed on your system.

## Usage

### Spawning or Switching to a Profile

```bash
qw <profile_name> [<rows>x<cols>]
```

If the profile is already active, `qw` will switch to the corresponding `terminator` window. For new profiles, a fresh environment is set up in a dedicated directory. If `<rows>x<cols>` is provided for new profiles, the terminator window will be divided into the specified number of rows and columns. Otherwise, it will use a default layout of `2x2`. Each section in the grid stores the bash history, current directory info, and a temporary workspace for each shell.

### Listing Profiles

```bash
qw --list
```

Outputs a list of all available profiles.

### Removing a Profile
```bash
qw --remove <profile_name>
```

Deletes the designated profile along with its bash histories and working directory data for each shell.

### Renaming a Profile
```bash
qw --rename <old_profile_name> <new_profile_name>
```

Renames the provided profile and updates its associated files and directories to match.

## Installation

1. Clone the Repository:

```bash
git clone https://github.com/zgrmrts/qw.git
```

2. Navigate to the Project Directory:

```bash
cd qw
```

3. Add the Scripts to Your PATH

Add `qw` to your PATH. Put the following in .bashrc and/or .profile:

```bash
source "${PATH_TO_QW}/init_qw.sh"
```

## Contributing

Feedback, issues, and pull requests are always appreciated. Feel free to contribute to the enhancement of qw.

## License

This project falls under the MIT License.





