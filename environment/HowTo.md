# Handy bash commands
* Get graphics card info: `lspci  -v -s  $(lspci | grep VGA | cut -d" " -f 1)`
* Count processors:
  * `cat /proc/cpuinfo | grep processor`
  * `nproc`
* List users + disk usage: `du -khs * | sort -hr`
* Tidy/Neatify an XML file
  ```bash
  sudo apt install tidy
  cat ugly.xml  | tidy -utf8 -xml -w 255 -i -c -q -asxml > pretty.xml
  ```
* TODO locate where env variables came from: https://unix.stackexchange.com/questions/813/how-to-determine-where-an-environment-variable-came-from
* TODO move to ../pdf  # 2 page PDF
  pdfnup --nup 2x1 input.pdf
*  # Rotate PDF
  pdf90 input.pdf
*  # Concatenate PDFs - requires pdftk, which was removed: https://askubuntu.com/questions/1028522/how-can-i-install-pdftk-in-ubuntu-18-04-bionic
  pdftk 1.pdf 2.pdf 3.pdf cat output 123.pdf
* # Sync/Backup
  rsync -r --exclude=.svn /home/user/progname/ /home/user/progname.copy
* # Archive Subversion Folder without .svn:
  tar --exclude='.svn' -c -f - /path/to/sourcedir/* | (cd /path/to/destdir ; tar xfp -)
* TODO move to ../image-video # Video from image folder (2 pass encoding): (weird aspect ratios sometimes)
  mencoder mf://*.jpg -mf w=5400:h=2700:fps=15:type=jpg -ovc xvid -xvidencopts pass=1:bitrate=2000 -of avi -o /dev/null
  mencoder mf://*.jpg -mf w=5400:h=2700:fps=15:type=jpg -ovc xvid -xvidencopts pass=2:bitrate=2000 -of avi -o output-xvid.avi
* # https://askubuntu.com/questions/610903/how-can-i-create-a-video-file-from-a-set-of-jpg-images
  ffmpeg -framerate 25 -i image-%05d.jpg -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p output.mp4
* # Init resolution for my old LG monitor
  xrandr --newmode "1920x1080_59.80"  172.22  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
  xrandr --addmode VGA-0 1920x1080_59.80
  xrandr --output VGA-0 --mode 1920x1080_59.80 
* # Normalize MP3 Gain for all mp3s in a directory:
  ```bash
  if [ $# != 1 ]
  then 
    echo 'ERROR: Usage ./normalize.sh directory' 
    exit 1 
  fi

  if [ ! -d $1 ]
  then
    echo 'ERROR: Usage ./normalize.sh directory'
    exit 1
  fi

  cd $1
  find . -type f -name '*.mp3' -o -name '*.MP3' -print0 | xargs -0 mp3gain -r -c -f
  ```
* Overwrite a disk (safely erase/wipe)
  * see https://askubuntu.com/questions/17640/how-can-i-securely-erase-a-hard-drive
  * `sudo shred -v -n1 -z /dev/sdSOMETHING`
* Automatically grab screenshot from webcam (used in a "daily progress" script)
  filename=`date +%Y%m%d%H%M%S.jpeg`
  streamer -c /dev/video0 -b 32 -s 1024x768 -o $filename
* Linux 'Games'
TODO steam dosbox support?
TODO sokoban
TODO configure mame
```bash
  # Blobby Volley
  sudo apt install blobby

  # DOSBox
  sudo apt install dosbox
  dosbox
  # Edit ~/.dosbox/dosbox-xxx.conf
  #   Change keyboardlayout=de
  #   Add auto-mount to [autoexec]: (use the C drive!)
  #     MOUNT C /home/<user>/path/to/dosbox
  #     C:
  # Press Ctrl+F10 to unlock mouse!
```

## Games


### Steam

* Go to https://store.steampowered.com
* Download installer (deb)
* Run it (if it doesn't open due to `no match: ssfn*`, check https://askubuntu.com/questions/966373/steam-doesnt-open-on-ubuntu-17-10)


### Quake

```bash
  # Follow the steps from https://ioquake3.org/get-it/
  wget https://ioquake3.org/files/1.36/installer/ioquake3-1.36-7.1.x86_64.run
  wget https://ioquake3.org/files/1.36/data/ioquake3-q3a-1.32-9.run

  sudo ./ioquake3-1.36-7.1.x86_64.run
  sudo ./ioquake3-q3a-1.32-9.run
  cd /usr/local/games/ioquake3/baseq3/
  sudo ln -s /home/snototter/Games/Quake/pak0.pk3 .
  # Ready to play
```
