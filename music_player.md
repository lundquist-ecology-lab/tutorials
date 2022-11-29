This is a quick and fun project utilizing a Raspberry Pi (or any other
Linux-based server) to play a portion of a song out of connected speakers 
at a particular time interval. 

## Step 1: Download an .mp3 of a song that you want to play. For this project
I downloaded [Crab Rave](https://www.youtube.com/watch?v=LDU_Txk06tM&ab_channel=MonstercatInstinct), 
but any song will work for this.

## Step 2: Download the [SoX cli](https://sox.sourceforge.net/) media player.

On Debian

```
sudo apt install sox
```
## Step 3: Write a short script to play a portion of the song that you want to play

```
#!/bin/sh

play /home/USERNAME/Music/crab_rave.mp3 trim 01:10 fade 3 15 3 norm
```
The above code using SoX to play crab_rave.mp3 for 15 seconds from 01:10 and will
also fade in for 3 seconds, and fade out for 3 seconds.

## Step 4: Playing the song can then be automated using `systemd` services and timers.

As root:

* Create and edit a service file, /usr/lib/systemd/system/rave.service

```[Unit]
Description=Play Crab Rave

[Service]
ExecStart=sh /home/USER/Music/rave.sh

[Install]
WantedBy=multi-user.target
```

* Create and edit a timer file, /usr/lib/systemd/system/rave.timer

```
[Unit]
Description=Plays crab rave every 6 hours

[Timer]
OnCalendar=0/6:00:00

[Install]
WantedBy=multi-user.target
```
This timer will play the song every 6 hours from system startup

## Step 5: Enable the timer

```
sudo systemctl enable rave.timer

sudo systemctl start rave.timer
```

You can check on the timer by using `sudo systemctl list-timers` command

Step 6: Hook your Pi to an audio device and that's it! Your song will now play
every six hours. 

I personally use this as an alarm for my [Pacman Frog](https://en.wikipedia.org/wiki/Ceratophrys) automatic water mister,
but I am sure there are some other cool uses for this.

