from kubernetes import client, config
config.load_kube_config()
v1 = client.CoreV1Api()
nodes = v1.list_node()
for namespace in v1.list_namespace().items:
    print(namespace.metadata.name)
    for pod in v1.list_namespaced_pod(namespace.metadata.name).items:
        print(" " + pod.metadata.name)