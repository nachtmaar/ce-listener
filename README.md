# ce-listener

This is a simple CloudEvent listener which can be used for testing and/or debugging purposes.

I just needed a container which can listen receive CloudEvents on a HTTP layer and print the received events.

## Use it

```shell
$ kubectl run -ti --image docker.io/nachtmaar/ce-subscriber:latest ce-listener
$ kubectl logs ce-listener -f
listening on :8080
```

Open a shell:

```shell
$ k exec -it ce-listener ash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
/go # 
```

Run a set of commands:

```shell
$ kubectl run --rm -ti --command=true --image docker.io/nachtmaar/ce-subscriber:latest tmp-ce-subscriber -- ash -c "apk add curl ; curl 2&>/dev/null http://eventing-nats.kyma-system.svc.cluster.local:7777/metrics | grep nats_server_jetstream_disabled"
If you don't see a command prompt, try pressing enter.
fetch https://dl-cdn.alpinelinux.org/alpine/v3.16/community/x86_64/APKINDEX.tar.gz
(1/4) Installing brotli-libs (1.0.9-r6)
(2/4) Installing nghttp2-libs (1.47.0-r0)
(3/4) Installing libcurl (7.83.1-r3)
(4/4) Installing curl (7.83.1-r3)
Executing busybox-1.35.0-r17.trigger
OK: 8 MiB in 19 packages
# HELP nats_server_jetstream_disabled JetStream disabled or not
# TYPE nats_server_jetstream_disabled gauge
nats_server_jetstream_disabled{cluster="eventing-nats",domain="",is_meta_leader="true",meta_leader="eventing-nats-0",server_id="NBOOUPNZGMANKBOWTDVXRLPQKDTICTREJS7QWW6NS2WVCW7VAIG72DS6",server_name="eventing-nats-0"} 0
Session ended, resume using 'kubectl attach tmp-ce-subscriber -c tmp-ce-subscriber -i -t' command when the pod is running
pod "tmp-ce-subscriber" deleted
```

## Build it

```bash
docker build . -t nachtmaar/ce-subscriber:latest
docker push nachtmaar/ce-subscriber:latest
```
