node {
  
  stage('Checking out code') {
	checkout scm
}
  stage('Building app') {
	sh './gradlew build'
         archiveArtifacts artifacts: 'dist/nodejs.zip'
} 

  stage('starting app') {
	sh 'npm --version'
        sh 'node --version'
}
   stage('Building Docker Image') {
	sh 'docker build -t $DOCKER_HUB_USR/nodejs-gradle .'
	sh 'docker login -u $DOCKER_HUB_USR -p $DOCKER_HUB_PASSWD'
	sh 'docker push $DOCKER_HUB_USR/nodejs-gradle'
}
  stage('Remove old image') {
	sh 'docker rm -f gradle'
}
 
  stage('Test Docker Imgae') {
	sh 'docker run --name=gradle -d -p 8000:8000 $DOCKER_HUB_USR/nodejs-gradle'
}  


  stage('Deploy Code to Canary') {

        environment {
	  CANARY-REPLICAS=1
}

        kubernetesDeploy(
          kubeconfigId: 'kube_id',
          configs: 'nodejs-deploy-canary.yml',
          enableConfigSubstitution: true
        )

}


  stage('Deploy Code to K8S') {

	input 'Deploy to Production'

	environment {
          CANARY-REPLICAS=0
}

        kubernetesDeploy(
          kubeconfigId: 'kube_id',
          configs: 'nodejs-deploy-canary.yml',
          enableConfigSubstitution: true
        )



	kubernetesDeploy(
	  kubeconfigId: 'kube_id',
	  configs: 'nodejs-deploy.yml',
	  enableConfigSubstitution: true
	)

}
 
} // end
