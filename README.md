# Supported tags and respectives `Dockerfile` links

- [`latest` (Dockerfile)](https://github.com/seb-martin/youtrack-dockerized/blob/master/Dockerfile)

# Youtrack

[Youtrack](https://www.jetbrains.com/youtrack/) is an issue tracker designed for devlopment teams.

![](https://raw.githubusercontent.com/seb-martin/youtrack-dockerized/develop/docs/icon_YouTrack.png)


# How to use this image

```sh
docker run -p 8080:8080 -d sebmartin/youtrack
```

Context

```sh
docker run -p 8080:8080 -d sebmartin/youtrack /youtrack
```

Persistent volumes

```sh
docker run -v /path/to/folder:/var/lib/youtrack -p 8080:8080 -d sebmartin/youtrack
```

Data Container

```sh
docker create -v /home/youtrack --name youtrack-data sebmartin/youtrack
docker run --volumes-from youtrack-data --name youtrack-app -p 8080:8080 -d sebmartin/youtrack
```

# Passing JVM and Youtrack parameters

Default parameters : `-Xmx1g`, `-XX:MaxMetaspaceSize=250m`, `-Djava.awt.headless=true` `-Djetbrains.youtrack.disableBrowser=true`.


Overrides default parameters

```sh
docker run -p 8080:8080 --env JAVA_OPTS="-Xmx1g -XX:MaxMetaspaceSize=250m -Djava.awt.headless=true -Djetbrains.youtrack.disableBrowser=true" -d sebmartin/youtrack /youtrack
```

- [JVM parameters](http://docs.oracle.com/javase/8/docs/technotes/tools/unix/java.html)
- [Youtrack Configuration Parameters](https://www.jetbrains.com/help/youtrack/standalone/7.0/YouTrack-Java-Start-Parameters.html)

Mandatory parameters

- `-Xmx1g` : Sets the maximum Java heap size to 1GB.
- `-XX:MaxMetaspaceSize=250m` : Sets the maximum Metaspace memory to 250MB.
- `-Djava.awt.headless=true` : Runs Java in Headless Mode.

Not allowed parameters

- `database.location`
- `database.backup.location`
- `jetbrains.youtrack.logDir`

# Troubleshooting

## Native random generator does not have enough entropy

Problem

```
YouTrack home folder is [/home/youtrack/.youtrack]
Verifying memory requirements...
Checking entropy sources...
===================================
Native random generator does not seem to have enough entropy for YouTrack to start.
You can fix it by switching to PRNG with -Djava.security.egd=/dev/zrandom or by reconfiguring your operation system to provide more random bits.
Application will now exit

```

Solution

```sh
docker run -v /dev/urandom:/dev/random -p 8080:8080 -d sebmartin/youtrack
```


## Not enough disk space left

Problem

```
Can't clear work directory [/var/lib/youtrack/.youtrack/work]: /var/lib/youtrack/.youtrack/work does not exist
YouTrack home folder is [/var/lib/youtrack/.youtrack]
Verifying memory requirements...
Checking entropy sources...
Checking free disk space...
===================================
Not enough disk space left for YouTrack to start. Current work folder is /var/lib/youtrack/.youtrack. You can either free at least 300 MB on current partition or override work folder location with -Djetty.home=<work folder path>
Application will now exit
```

Solution

```sh
chown vagrant:vagrant /path/to/directory
```
