## Using foremost to recover lost files

A simple command to use formost to recover accidentally deleted files from an external drive

```shell
sudo foremost -i /dev/sdXX -o '<path/to/output/directory>'
```

If you are only looking for specific types of files use this

```shell
sudo foremost -t jpg, mp4 -i /dev/sdXX -o '<path/to/output/directory>'
```
