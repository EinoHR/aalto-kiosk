cd /usr/mycelium

(
    until ./dbclient; do
        echo "Dbclient crashed with exit code $?.  Respawning.." >&2
        sleep 1
    done
)&

until /usr/lib/jvm/jre-11-openjdk-11.0.18.0.10-1.fc37.x86_64/bin/java -jar mycelium.jar; do
    echo "Java crashed with exit code $?.  Respawning.." >&2
    sleep 1
done