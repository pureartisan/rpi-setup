## Qt - errors

`libEGL warning: GLX/DRI2 is not supported/failed to authenticate etc`

```
sudo find / -name "libEGL*"
sudo find / -name "libGLESv2*"
```

make sure a link exists in `/usr/lib/arm-linux-gnueabihf/` for all four items
```
sudo ln -fs /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so
sudo ln -fs /opt/vc/lib/libEGL.so /usr/lib/arm-linux-gnueabihf/libEGL.so.1
sudo ln -fs /opt/vc/lib/libGLESv2.so /usr/lib/arm-linux-gnueabihf/libGLESv2.so
sudo ln -fs /opt/vc/lib/libGLESv2.so /usr/lib/arm-linux-gnueabihf/libGLESv2.so.2
```

finall run
```
sudo ldconfig
```