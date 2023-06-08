
container_name="$1"
if [ "$(docker container inspect -f '{{.State.Status}}' $container_name)" = "running" ]; then
  exit 0
fi

exit 1