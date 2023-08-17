#!/usr/bin/env bash
# to be run as --init-file inside terminator shells

# Since, this is run as --init-file for bash, we first run the original init file i.e. .bashrc
source "${HOME}/.bashrc"

# get the directory using answer in https://stackoverflow.com/a/246128/5106317
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR=$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)

export QW_ENV_ROOT="${HOME}/.qw/env"
QW_WINDOW_ROOT_DIR="${QW_ENV_ROOT}/${QW_PROFILE}/${QW_WINDOW}"
mkdir -p "${QW_WINDOW_ROOT_DIR}"
# every window have its own bash history
HISTFILE="${QW_WINDOW_ROOT_DIR}/bash_history"
# make history large
HISTSIZE=100000
HISTFILESIZE=100000
# save immediately after every command
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
# save working directory after every shell command
QW_PWDFILE="${QW_WINDOW_ROOT_DIR}/pwd"
PROMPT_COMMAND="pwd>${QW_PWDFILE};${PROMPT_COMMAND}"

# restore wd, if any exists for this profile ...
if [[ -r ${QW_PWDFILE} ]]; then
  cd "$(cat "${QW_PWDFILE}")" 2>/dev/null
else
  # ... or create a directory for the profile
  QW_NEW_WD="${QW_ENV_ROOT}/${QW_PROFILE}/working_dir"
  mkdir -p "${QW_NEW_WD}" 2>/dev/null
  cd "${QW_NEW_WD}" 2>/dev/null
  echo "${QW_NEW_WD}" >"${QW_PWDFILE}"
fi
source "${SCRIPT_DIR}/qw-completion.bash"
