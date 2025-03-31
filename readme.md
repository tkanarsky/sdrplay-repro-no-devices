I'm having trouble connecting my SDRplay RSP1b to my Macbook via the API (v. 3.15)

This is a minimal example reproducing the undesired behavior (GetDevices() returns zero devices)

I've ruled out a hardware issue because SDRConnect detects it fine:

![SDRconnect works fine](https://imgz.org/i6tk7DA8.png)

I've installed SDRplay API from the website.

The daemon is running:
```
tim@tim-macbook lib % ps aux | grep sdrplay
tim              74487   0.0  0.0 410059184    272 s013  R+    4:15AM   0:00.00 grep sdrplay
root             70692   0.0  0.0 410624592   4896   ??  Ss    3:45AM   0:03.75 /Library/SDRplayAPI/3.15.0/bin/sdrplay_apiService
```

I'm running Sequoia 15.3.2.

At this point I'm stumped and would appreciate some help. 

# Building
```
mkdir -p build
cd build
cmake ..
make 
./main
```

What I see:
```
tim@tim-macbook build % ./main 
API version: 3.15
Num devices found: 0
```

Thanks!
