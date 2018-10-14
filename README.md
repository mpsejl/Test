# Test Image

## Vintage Basic (http://www.vintage-basic.net/games.html)

## Usage

### Build
`docker build --tag vbgames .`

### Run
`docker run -d --rm -p 7681:7681 vbgames`

### Play
The container exposes a bash shell using ttyd on port 7681. Access at http://<hostname>:7681 .

|Action|Command|
|--|--|
|List Games| `ls` |
|Play Game| `vintbas <game>.bas` |





