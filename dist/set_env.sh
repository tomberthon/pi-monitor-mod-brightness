echo $'REDIS_HOST=$DB_PORT_6379_TCP_ADDR/n$(cat $1)' > $1
echo $'REDIS_PORT=6379/n$(cat $1)' > $1
echo $'# Environment variables added on Docker run/n/n$(cat $1)' > $1
