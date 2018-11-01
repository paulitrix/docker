pipeline {
    agent any
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


   	 }


	post {
      		always {
         	 	sh 'docker stack deploy -c  docker-compose.yml hello'
         	 	sh 'docker service ps  hello_web'
			sh 'docker container ls -q'
     		 }
	}

}
