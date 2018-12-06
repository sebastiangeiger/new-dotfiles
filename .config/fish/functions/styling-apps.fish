# Defined in /var/folders/3h/fz7frrg92f7c1k4yb00mcxnh0000gq/T//fish.hdRJkw/styling-apps.fish @ line 1
function styling-apps
	fixops apps list --team styling --format json | jq .rows[].name | sed "s/\"\(.*\)\"/\1/"
end
