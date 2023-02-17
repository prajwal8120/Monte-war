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
    }
}