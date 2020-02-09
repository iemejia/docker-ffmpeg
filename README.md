# README

A docker image to provide the latest available ffmpeg amd64 build from master.
This image uses the static binary provided
[here](https://johnvansickle.com/ffmpeg/).

## Instructions

Build the image:

    docker build -t iemejia/docker-ffmpeg .

Run the image

    docker run --rm -it -e "TERM=xterm-256color" iemejia/docker-ffmpeg

## Example

Convert a file from mp3 to opus in a local directory:

    docker run \
      -v $HOME/files:/files \
      --rm -it -e "TERM=xterm-256color" \
      iemejia/docker-ffmpeg -i /files/song.mp3 -c:a libopus -b:a 96K /files/song.opus
