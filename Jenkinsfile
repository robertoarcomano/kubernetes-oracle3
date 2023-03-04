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
                    script {
                        sh "apt update"
                        sh "apt install -y wget"
                        sh "wget https://dl.k8s.io/v1.26.2/bin/linux/arm64/kubectl"
                        sh "chmod 755 kubectl"
                        def ns = ['automation', 'backup', 'bookstack', 'database', 'elk', 'monitoring', 'tools', 'website']
                        for (int i = 0; i < ns.size(); ++i) {
                            echo "Applying NS ${ns[i]} "
                            sh("cat ${ns[i]}/update_list.txt|while read YAML; do ./kubectl --kubeconfig $KUBECONFIG apply -f ${ns[i]}/\$YAML; done")
                        }
                    }
                }
            }
        }
    }
}
