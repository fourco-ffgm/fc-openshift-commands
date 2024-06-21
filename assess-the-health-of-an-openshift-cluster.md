# Exercise: Assess the Health of an OpenShift Cluster

user with admin rights.

- oc get operators
- oc get cluster-operators
- oc describe clusteroperators openshift-apiserver
- oc get pods -n openshift-apiserver-operator

```bash
oc get pods -n openshift-apiserver-operator
openshift-apiserver-operator-5bbf48ddc8-np774 \
-o json | jq .status
```

- oc adm top pods -A –sum
- oc get pods -n openshift-etcd --show-labels
- oc adm top pods etcd-master0 -n openshift-etcd –containers
- oc get all -n openshift-monitoring --show-kind
- oc logs alertmanager-main-0 -n openshift-monitoring
- oc get events -n openshift-kube-controller-manager
- oc get nodes
- oc adm top node

```bash
oc get node master0 -o jsonpath=\
'Allocatable: {.status.allocatable.cpu}{"\n"}'\
'Capacity: {.status.capacity.cpu}{"\n"}'
```

- oc describe node master0
- oc adm node-logs master0 -u crio --tail 1
- oc adm node-logs master0 -u kubelet --tail 2
- oc debug node/master0
  chroot /host
- systemctl status kubelet
- systemctl is-active crio
- oc adm must-gather --dest-dir /home/fourco/must-gather <!-- takes too long -->

```bash
oc adm inspect clusteroperator/openshift-apiserver \
--dest-dir /home/fourco/inspect --since 3m
```

- cat inspect/cluster-scoped-resources/operator.openshift.io/openshiftapiservers/cluster.yaml
- rm –rf must-gather inspect