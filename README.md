# ce-listener

This is a simple CloudEvent listener which can be used for testing and/or debugging purposes.

I just needed a container which can listen receive CloudEvents on a HTTP layer and print the received events.

## Use it

```shell
$ kubectl run -ti --image docker.io/nachtmaar/ce-subscriber:latest ce-listener
$ kubectl logs ce-listener -f
listening on :8080
```

## Build it

```bash
docker build . -t nachtmaar/ce-subscriber:latest
docker push nachtmaar/ce-subscriber:latest
```
