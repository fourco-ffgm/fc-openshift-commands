# Exercise: Managing application build

```bash
oc new-app --name vertx-site \
--build-env MAVEN_MIRROR_URL=https://repo.maven.apache.org/maven2/ \
--env JAVA_APP_JAR=vertx-site-1.0.0-SNAPSHOT-fat.jar \
-i redhat-openjdk18-openshift:1.8 \
--context-dir builds-applications/apps/vertx-site \
https://github.com/RedHatTraining/DO288-apps.git
```

- oc get po
- oc expose svc/vertx-site
- oc get route
curl <url-to-the-app>