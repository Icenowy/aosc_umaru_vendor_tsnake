source lib/kconfig_enum.sh

source ./.config

tsnake_ver=$(kconfig_enum CONFIG_TSNAKE_VER_0_0_0 0.0.0)
