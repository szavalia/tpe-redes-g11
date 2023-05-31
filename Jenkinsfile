pipeline {
    agent {
        node {
            label 'docker-agent-node'
        }
    }

    environment {
      CI = 'true'
    }
    
    stages {
        // stage('Fetch') {
        //     steps{ 
        //         echo "Fetching 💡"
        //         sh '''
        //           cd todo-app
        //           yarn
        //         '''
        //     } 
        // }
        // stage('Test') {
        //     steps { 
        //         echo "Testing ️🥊"
        //         sh '''
        //         cd todo-app
        //         yarn test
        //         '''
        //     }
        // }
        // stage('Build') {
        //     steps {
        //         // You can add your build steps here
        //         echo "Building 🛠️"
        //         sh '''
        //         cd todo-app
        //         yarn build
        //         '''
        //     }
        // }
        stage('Deploy') {
            steps {
                echo "Deploying 🚀"
                sh '''
                cd todo-app
                yarn deploy
                '''
            }
        }
    }

    post {
      failure {
        echo "Build failed 😞"
        emailext body: "Build failed 😞", subject: "Build failed 😞", to: 'val-riera@hotmail.com'
      }
    }
}