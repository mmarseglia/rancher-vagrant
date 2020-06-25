clean:
	rm -rf rm cluster.rkestate cluster.yml kube_config_cluster.yml ubuntu-xenial-16.04-cloudimg-console.log

shellcheck:
	shellcheck *.sh
