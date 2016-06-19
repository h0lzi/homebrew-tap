# homebrew-tap
plex-media-player tap
builds plex-media-player from source.
Not 100% done:
mpv how to force build --HEAD --with-shared?
no sound?
## usage:
```

brew tap h0lzi/homebrew-tap
brew install mpv --with-shared --HEAD (until deps fix)
brew install plex-media-player (also supports --HEAD)
brew linkapps plex-media-player
```

Open /Applications Plex Media Player

## Problems:
I don't have sound in my tests. (Will let someone investigate)