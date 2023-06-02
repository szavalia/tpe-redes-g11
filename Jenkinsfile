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
        //           yarn install --silent --frozen-lockfile
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
                input(message: 'Deploy to production?', ok: 'Deploy', submitter: 'admin,not-allowed')

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
        emailext body: "Build failed 😞", subject: "Build failed 😞", to: 'szavalia@itba.edu.ar'
      }
      success { 
        echo "Build succeeded 😊"
        emailext body: "Build succeeded 😊", subject: "Build succeeded 😊", to: 'szavalia@itba.edu.ar'
      }
    }
}