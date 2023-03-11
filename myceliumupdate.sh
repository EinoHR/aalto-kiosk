cd ~/

if [ -f "mycelium" ]; then
    echo "Folder 'mycelium' already exists, continuing."
else
    git clone https://github.com/EinoHR/mycelium
fi

cd mycelium
git fetch

chmod +x mycelium.sh
chmod +x dbclient

./mycelium.sh