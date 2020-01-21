# User Interface
## Cinnamon
* Install `sudo apt install cinnamon-desktop-environment lightdm`
* Change theme:
  * Window borders: Ambiance
  * Icons: ubuntu-mono-dark
  * Controls: Ambiance
  * Mouse Pointer: DMZ-White
  * Desktop: cinnamon
* Set up applets:
  * `sudo apt install gir1.2-gtop-2.0`
  * systemmonitor@orcus
  * weather@mockturtle


## Background/Avatar/Sounds/Login
* Copy user avatar (JPG) to `/home/<user>/.face`
* Change desktop background (no tricks this time, just "use as wallpaper") or use script to cycle different wallpapers ;-), these resources might come handy:
  * https://askubuntu.com/questions/66914/how-to-change-desktop-background-from-command-line-in-unity
  * http://tldp.org/LDP/abs/html/randomvar.html
* Disable startup sound (drums)
  * Boot to login screen
  * Click mute button (top-right), this setting is persistent
* Login security:
  * Check https://wiki.ubuntu.com/LightDM
  * Edit `/etc/lightdm/lightdm.conf.d/10-ubuntu.conf`
    ```ini
    [SeatDefaults]
    user-session=ubuntu
    greeter-show-manual-login=true
    greeter-hide-users=true
    allow-guest=false
    ```
* Change login background and disable sound
  * Edit `/usr/share/glib-2.0/schemas/10_unity_greeter_tweaks.gschema.override`
    ```ini
    [com.canonical.unity-greeter]
    play-ready-sound = false
    draw-user-backgrounds=false
    background='/usr/share/backgrounds/earth_lights.jpg'
    draw-grid=false
    ```
  * Update schema via `sudo glib-compile-schemas /usr/share/glib-2.0/schemas/`


## Terminal

* Change terminal theme (Ctrl+Alt+T)
* TODO working dir change doesn't `cd` into it...<br/>Prepare terminal start up script, similar to:
  ```bash
  #!/bin/bash
  gnome-terminal --tab -t "vito"  --working-directory="~/workspace/utilities/vito"
  gnome-terminal --tab -t "vcp"  --working-directory="~/workspace/utilities/vitocpp"
  ```


# Applications
## Google Chrome & Earth
```bash
  # Chrome
  sudo apt install gdebi-core
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo gdebi google-chrome-stable_current_amd64.deb

  # Earth
  wget https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
  sudo gdebi google-earth-pro-stable_current_amd64.deb
```

## Audio, Video, Image Processing
```bash
  sudo apt install -y audacious vlc dia gimp cheese geeqie inkscape imagemagick easytag shutter
  # avidemux is no longer in the official repositories
```


## GPS Processing
```bash
  sudo apt install gpsprune
```

# Development
## Software Tools

```bash
  sudo apt install -y libopenblas-base libopenblas-dev
  sudo apt install -y cmake cmake-curses-gui git gitg meld build-essential checkinstall
  # No like-y:
  sudo apt install -y subversion rapidsvn

  # Dependencies for my PVT: TODO update
  sudo apt install -y ffmpeg libavcodec-dev libavformat-dev libavutil-dev libavdevice-dev libswscale-dev libcurl4-openssl-dev libconfig++-dev
  sudo apt install -y libopencv-dev python-opencv python3-opencv

  sudo apt install -y libeigen3-dev libatlas-base-dev libatlas3-base libboost-all-dev
  # libatlas-dev is no longer available
  
  # Handy tools
  sudo apt install -y screenruler wireshark unrar freecad k3b arduino fritzing
  ## Fix permissions of k3b's writer, wodim (or - at least - Audio CD burning will fail):
  ## See bug report https://bugzilla.redhat.com/show_bug.cgi?id=1580021
  sudo chmod u+s /usr/bin/wodim

  # C++ performance analysis
  sudo apt install -y google-perftools libgoogle-perftools-dev

  #TODO visual studio code

  sudo apt install -y qtcreator
  # Then setup indentation, coding style and comment shortcut in qtcreator

```


## Python
```bash
  sudo apt install -y python-dev python-pip
  sudo apt install -y python3-dev python3-pip
#  sudo -H pip2 install -U pip numpy matplotlib scipy Pillow
  sudo -H pip3 install -U pip numpy matplotlib scipy Pillow


  # Install virtual environment
  #sudo pip2 install virtualenv virtualenvwrapper
  sudo apt install -y python3-venv
  sudo pip3 install virtualenv virtualenvwrapper
  ## Add to start up
  #echo "# Virtual Environment Wrapper"  >> ~/.bashrc
  #echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
  #source ~/.bashrc

  ############ For Python 2 ############
  # create virtual environment
  #mkvirtualenv imgproc-sandbox-p2 -p python2
  #workon imgproc-sandbox-p2
  ## now install python libraries within this virtual environment
  #pip install numpy scipy matplotlib scikit-image scikit-learn ipython imutils
```

## MATLAB
* Install from disk (external USB drive) or disk image:
  ```bash
  sudo mkdir -p /mnt/dvdimg
  sudo mount -o loop <path/to/dvd.iso> /mnt/dvdimg
  sudo /mnt/dvdimg/install
  sudo umount /mnt/dvdimg
  ```
* Setup menu launcher
  ```bash
  cinnamon-menu-editor
  # Command: /usr/local/MATLAB/.../bin/matlab -desktop
  ```
* Set up deprecated gcc/g++ for mex compilation (check supported versions, R2017a requires gcc-4.9
  ```bash
  # Ubuntu 18.04 doesn't have 4.9 :-/
  sudo apt install gcc-4.8 g++-4.8

  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10
  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 20

  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10
  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 20

  sudo update-alternatives --config gcc
  sudo update-alternatives --config g++

  /usr/local/MATLAB/R2017a/bin/matlab -desktop

  >> cd ~/Software/MATLAB/mex-test
  >> !gcc --version
  >> mex arrayproduct.c
  
  # Restore gcc versions!
  ```

## LaTeX
```bash
  sudo apt install -y texlive texlive-base texlive-bibtex-extra texlive-binaries texlive-extra-utils texlive-font-utils texlive-fonts-extra texlive-fonts-recommended texlive-lang-german texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-pictures texlive-pstricks texlive-science texlive-xetex texlive-generic-extra kile okular 
  # Settings > Configure Kile > Tools > Build > ViewPDF > select Okular as default PDF viewer

  # Okular can play embedded videos (previous versions used phonon-backend-vlc):
  sudo apt install phonon4qt5-backend-vlc
```

## GTest

```bash
  sudo apt install libgtest-dev
  cd /usr/src/gtest
  sudo cmake .
  sudo make -j
  sudo cp *.a /usr/lib
  sudo mkdir /usr/local/lib/gtest
  sudo ln -s /usr/lib/libgtest.a /usr/local/lib/gtest/libgtest.a
  sudo ln -s /usr/lib/libgtest_main.a /usr/local/lib/gtest/libgtest_main.a
```

## Others
* Teamviewer - Install Debian package from https://www.teamviewer.com/download/linux/
* pdftk - TODO move to latex
* dropbox Follow: https://linuxconfig.org/how-to-install-and-integrate-dropbox-with-ubuntu-18-04-bionic-beaver-desktop


## SSH
* Copy config and keys into `/home/<user>/.ssh`
* `chmod` 644 on all public keys, 644 on `config`, 600 on all private keys


## NVIDIA
* CUDA
  * Get suitable CUDA, e.g. 10.0(!)
  * Follow their install instructions to install `cuda-10-0`
  * Also install `cuda-nvcc-10-0` (eplicitly state the version!)
  * Edit `~/.bashrc`:
    ```bash
    export PATH="$PATH:/usr/local/cuda/bin"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"
    ```
  * Test CUDA installation
    ```bash
    sudo apt-get install cuda-samples
    # Verify you have the NVIDIA compiler
    nvcc -V
    # Copy the samples to a location writable by your user (e.g. somewhere in your home or  /tmp)
    # Do NOT `chown` or modify the samples in `/usr/local/cuda/samples` as this is bad style and leads to an unclean system.
    # Do NOT run `make` with `sudo` unless required for `make install`.
    cp -R /usr/local/cuda/samples ~/cuda-samples
    # Go to your new folder and build the samples.
    cd YOUR_FOLDER && make -j
    # Check if the `deviceQuery` binary runs as expected.
    ./deviceQuery
    ```
* cuDNN
  * Download runtime, developer and doc from https://developer.nvidia.com/rdp/cudnn-download
  * Install
  ```bash
  sudo dpkg -i <runtime>.deb
  sudo dpkg -i <dev>.deb
  sudo dpkg -i <doc>.deb
  ```
  * Test cuDNN
  ```bash
  cp -r /usr/src/cudnn_samples_v6/ .
  cd cudnn_samples_v6/mnistCUDNN
  make
  ./mnistCUDNN
  ```
  * Troubleshoot - cannot build MNIST example:
    * Most likely due to missing type definitions.
    * Edit `/usr/include/cudnn.h` and `#include "driver_types.h"` to `#include <driver_types.h>`


#TODO What to back up:
## What to backup:
#* Home directory: .face, .ssh/, .bashrc, mount_hvergelmir.sh, .RapidSVN, .smb-credentials, ...
#* fstab
#* Games (dosbox + ioquake3/pak0)

