#  source <(k3d completion zsh) # only exists in v3, which we are currently not using

k3d_cluster=$(k3d l | grep running | head -n 1 | cut -d'|' -f 2 | awk '{$1=$1};1')
if [ -n "${k3d_cluster}" ]; then
				export KUBECONFIG=$(k3d get-kubeconfig -n "${k3d_cluster}")
fi

