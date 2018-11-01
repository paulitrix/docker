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
					jenkins: { sh "jenkins -v" }		
				)
         		 }
   		 }

		stage ('Deploy App') {
         	 		 sh 'docker stack deploy --compose-file docker-compose.yml hello'
   		 }      

   	 }

}
