#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_confirmation "Perform APT update?"
if answer_is_yes; then
    update
fi

ask_for_confirmation "Perform APT upgrade?"
if answer_is_yes; then
    upgrade
fi

ask_for_confirmation "Install Build essentials?"
if answer_is_yes; then
    ./build-essentials.sh
fi

./git.sh

ask_for_confirmation "Setup NVM?"
if answer_is_yes; then
    ./../nvm.sh
fi

ask_for_confirmation "Install Broswers?"
if answer_is_yes; then
    ./browsers.sh
fi

ask_for_confirmation "Install Compression Tools?"
if answer_is_yes; then
    ./compression_tools.sh
fi

ask_for_confirmation "Install Image Tools?"
if answer_is_yes; then
    ./image_tools.sh
fi

./misc.sh
./misc_tools.sh

ask_for_confirmation "NPM install/update?"
if answer_is_yes; then
    ./../npm.sh
fi

./tmux.sh

ask_for_confirmation "Configure Vim?"
if answer_is_yes; then
    ./../vim.sh
fi

./cleanup.sh
