(
    cd ~/

    if [ -f "mycelium" ]; then
        echo "Folder 'mycelium' already exists, continuing."
    else
        git clone https://github.com/EinoHR/mycelium
    fi

    cd mycelium
    git fetch --all
    git reset --hard origin/main

    chmod +x mycelium.sh
    chmod +x dbclient
) &> /var/home/mycelium/myceliumupdate.log

~/mycelium/mycelium.sh