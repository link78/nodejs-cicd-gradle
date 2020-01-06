node {
  checkout scm
 
  
  stage('Pushing Image'){
         // This step should not normally be used in your script. Consult the inline help for details.
docker.withRegistry('https://registry.hub.docker.com','Burk1212') {
  IMAGE_NAME="burk1212/nodejs-cd:${BUILD_NUMBER}"
  def customImage = docker.build(IMAGE_NAME)
    
    customImage.push()
        }
  }
     //stage('Remove old image container'){
    
     // sh label: '', script: 'docker rm -f simple' 
      
 // }
  stage('Running latest images on docker'){
    
      sh label: '', script: 'docker run --name=node-cd -d -p 7000:8080 burk1212/nodejs-cd' 
  }
 
  
 
} // end
