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
        stage('Fetch') {
            steps{ 
                echo "Fetching 💡"
                sh'''
<<<<<<< Updated upstream
                    git clone https://github.com/szavalia/todo-app
=======
                  cd todo-app
                  yarn
>>>>>>> Stashed changes
                '''
            } 
        }
        stage('Test') {
            steps { 
                echo "Testing ️🥊"
                sh '''
                cd todo-app
                yarn
                yarn test
                '''
            }
        }
        stage('Build') {
            steps {
                // You can add your build steps here
                echo "Building 🛠️"
                sh '''
                cd todo-app
                yarn build
                '''
            }
        }
    }
}