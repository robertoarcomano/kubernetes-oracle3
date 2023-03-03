pipeline {
    agent {
        kubernetes {
            cloud "kubernetes"
            inheritFrom 'kubectl'
        }
    }
    environment {
        KUBECONFIG = credentials('kubeconfig')
    }
    stages {
        stage("First") {
            steps {
                container("kubectl") {
                    sh "apt update"
                    sh "apt install -y wget"
                    sh "wget https://dl.k8s.io/v1.26.2/bin/linux/arm64/kubectl"
                    sh "chmod 755 kubectl"
                    sh("cat tools/update_list.txt|while read YAML; do ./kubectl --kubeconfig $KUBECONFIG -f tools/\$YAML; done")
                }
            }
        }
    }
}
