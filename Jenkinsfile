pipeline {
    agent {
        node {
            label 'docker-agent-node'
        }
    }
    
    stages {
        stage('Fetch and install dependencies') {
            steps{ 
                echo "Fetching 💡"
                def sourceRepo = checkout([$class: 'GitSCM', 
                                                branches: [[name: '*/master']],
                                                userRemoteConfigs: [[url: 'https://github.com/szvalia/todo-app']]])

                def dependenciesChanged = false;
                for (changeSet in sourceRepo) {
                    for (change in changeSet.getAffectedFiles()) {
                        if (change.getPath().startsWith('package.json')) {
                            dependenciesChanged = true
                            break
                        }
                    }
                    if (dependenciesChanged) {
                        break
                    }
                }

                if (dependenciesChanged) {
                    echo "Changes detected in package.json. Performing clean install..."
                    // Clean install as package.json has changed
                    sh "cd ${WORKSPACE} && rm -rf node_modules"
                    sh "cd ${WORKSPACE} && yarn install"
                } else {
                    echo "No changes to package.json. Restoring cache..."
                    // Use cache to restore node_modules if available
                    cache('node_modules') {
                        // No changes, use cached node_modules
                        sh "cd ${WORKSPACE} && yarn install"
                    }
                }

            }
        }
        stage('Test') {
            steps { 
                echo "Testing ️🥊"
                sh "cd ${WORKSPACE} && yarn test"
            }
        }
        stage('Build') {
            steps {
                // You can add your build steps here
                echo "Building 🛠️"
                sh "cd ${WORKSPACE} && yarn build"
            }
        }
    }
}