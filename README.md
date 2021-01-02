# Dotfiles

These are just my basic dotfiles for running a GUI based debian instance inside of WSL2.

Most of my files inside my .confg dir just source the files here so that way I can keep them up to date.

![Image 1](https://i.imgur.com/LWFFyvE.png)

![Image 2](https://i.imgur.com/l6Q1B9C.png)


The startup.vbs script is ran from windows to launch the WSL2 instance and to then run an ahk script to switch capslock and escape. It then runs the wlaunch script inside my scripts directory which sets some import enviornment variables and starts up BSPWM. 
