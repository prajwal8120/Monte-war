def registry  = 'https://admirals.jfrog.io'
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
                                  "exclusions": [ "*.sha1", "*.md5", "dockeransible"]
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

    }
}