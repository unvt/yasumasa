# yasumasa
A simple tool to create GeoJSON Text Sequence from GeoJSON Vector Tiles

## Examples
### Use the default value from `constants.rb`
```
ruby yasumasa.rb
```

### Provide `t` and `z`
```
ruby yasumasa.rb experimental_anno 15
```

## Required tools
- Ruby
- curl
- gzcat
- tippecanoe-json-tool
- GNU parallel
