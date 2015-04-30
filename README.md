# Will it block?

Run rails app with single puma thread

```
bundle exec puma -C config/puma.rb
```

## GET /

Create a stream of "foo" messages every second over a socket via the hijack api (exposed in pages controller via tubesocket gem)


```
curl -N http://localhost:3000/
```

## GET /delayed

Create a standard HTTP request which will block a thread for 5 seconds

```
curl -N http://localhost:3000/
```

## Results

Regular HTTP requests will block a Puma thread. Sockets managed by tubesock happen in a separate thread so puma isn't blocked