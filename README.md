# PiMinecraftServer

### Dockerfile for running minecraft server on Raspberry Pi 4

---

- Build image 
```
sudo docker build -t minecraft-server .
```

- Run container
```
sudo docker run -d -p 25565:25565/tcp -v /home/pi/minecraft-world
:/server/world --name minecraft-server minecraft-server
```

- Set container autorestart
```
sudo docker update --restart unless-stopped minecraft-server
```
