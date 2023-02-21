def imageName = 'admirals.jfrog.io/monte-libs-release-local/webapp'
def registry  = 'https://admirals.jfrog.io'
def version = 'v1.0.10'
pipeline{
    agent{
        label 'slave-java'
    }
    tools{
        maven 'M2_HOME'
    }

    stages{
        stage("Build Package"){
            steps{
                sh 'mvn clean install'
            }
        }

        stage("War Publish") {
            steps {
                script {
                        echo '<--------------- War Publish Started --------------->'
                         def server = Artifactory.newServer url:registry+"/artifactory" ,  credentialsId:"jfrog-key"
                         def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}";
                         def uploadSpec = """{
                              "files": [
                                {
                                  "pattern": "target/(*)",
                                  "target": "monte-libs-snapshot-local/{1}",
                                  "flat": "false",
                                  "props" : "${properties}",
                                  "exclusions": [ "*.sha1", "*.md5", "target/dockeransible-v1.0.10/*", "target/maven-archiver/*"]
                                }
                             ]
                         }"""
                         def buildInfo = server.upload(uploadSpec)
                         buildInfo.env.collect()
                         server.publishBuildInfo(buildInfo)
                         echo '<--------------- War Publish Ended --------------->'  
                
                }
            }   
        }
        stage(" Docker Build ") {
          steps {
            script {
               echo '<--------------- Docker Build Started --------------->'
               app = docker.build(imageName+":"+version)
               echo '<--------------- Docker Build Ends --------------->'
            }
          }
        }

        stage (" Docker Publish "){
            steps {
                script {
                   echo '<--------------- Docker Publish Started --------------->'  
                    docker.withRegistry(registry, 'jfrog-key'){
                        app.push()
                    }    
                   echo '<--------------- Docker Publish Completed --------------->'  
                }
            }
        }         

    }
}