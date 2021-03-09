# Minimal Nginx Reverse Proxy

This is useful for sending requests for many hostnames to one origin. 

## Configuring

You will need to edit the `nginx.conf` file, [lines 31 through 38](https://github.com/fly-apps/nginx/blob/master/nginx.conf#L38).

1. Set your origin URL, this could be a Heroku app, or a Kubernetes ingress address, or just an IP address on a server you run elsewhere.
2. Configure the upstream host header
    a. If you're using Heroku or similar, you will need to change line 35 to `<app>.herokuapp.com`. This tells nginx to always send the same `Host` header to the origin.
    b. If you want to pass the Host header through from the end user request, comment out line 35 and uncomment line 38.

By default, this nginx redirects all http requests to https. If you don't want to do that, comment out lines 48 through 50.

## Debugging

You can also build and run this docker image locally:

```
docker build . -t fly-nginx
```

Then:

```
docker run -p 8080:8080 -t fly-nginx
```

Then test it with curl:

```
curl -D - http://localhost:8080
```

Sometimes it's useful to see the headers nginx is sending. You can change line 31 to `https://debug.fly.dev` to ensure nginx is setting the headers you'd expect. Then rebuild the image, run it again, and try that curl out.