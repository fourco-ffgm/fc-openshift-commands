# Exercise: Inspect Kubernetes Resources

- oc api-resources
- oc api-resources --namespaced
- oc api-resources --namespaced -o name | wc –l
- oc api-resources --namespaced=false -o name | wc –l
- oc api-resources --api-group ''
- oc explain pods
- oc describe pod <podName>
- oc get pod <podName> -o yaml
- oc api-resources --api-group apps
- oc explain deployments
- oc get deploy
- oc get deploy <appName> -o wide
- oc describe deploy <appName>
- oc api-resources --api-group config.openshift.io
- oc explain projects
- oc describe project <project-name>
- oc get  project <project-name> -o json