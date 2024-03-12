
if [[ -d "$HOME/.config/postgresql/" ]]
then
  export PGPASSFILE="$HOME/.config/postgresql/pgpass"
  export PSQLRC="$XDG_CONFIG_HOME/postgresql/rc"
fi
