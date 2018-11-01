pipeline {
    agent any

    environment {
          DEPLOY_URL = "https://54.196.235.168/"
          COMPOSE_FILE = "docker-compose.yml"
          DEPLOY_STACK_NAME = "hello"
        }

         stages{
                stage('build') {
                         steps {
                                sh 'echo "Hi There!"'
                         }
                }

                stage('Verify Tools') {
                         steps {
                                parallel(
                                        docker: { sh "docker -v" },
                                        os: { sh "uname -a" }
                                )
                         }
                 }

                 stage('Stack Deploy') {
                          steps {
                              sh 'docker stack deploy -c ${env.COMPOSE_FILE} ${env.DEPLOY_STACK_NAME}'
                              sh 'docker service ps ${env.DEPLOY_STACK_NAME}"_web"'
                              sh 'docker container ls -q'

                          }
                  }

         }


        post {
                always {
                        sh "docker-compose down || true"

                 }
        }

}

