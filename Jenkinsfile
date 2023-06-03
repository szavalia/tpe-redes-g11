pipeline {
    agent {
        node {
            label 'docker-agent-node'
        }
    }
    
    stages {
        stage('Fetch') {
            steps{ 
                echo "Fetching 💡"
                checkout([$class: 'GitSCM', 
                                                branches: [[name: '*/main']],
                                                userRemoteConfigs: [[url: 'https://github.com/szavalia/todo-app']]])
                echo "Fetched all"
                    
            }
        }
        stage('Install dependencies'){
            environment {
                   PACKAGE_JSON_HASH = ''                                 //can be used in this stage only
              }
            steps{
                dir("${WORKSPACE}"){
                    
                    echo "checking for cache"
                    script{
                            def currentPackageJson = sh(script: "cat package.json", returnStdout: true).trim()
                            //get the hash of the file and use it as key for the cache
                            env.PACKAGE_JSON_HASH = sh(script: "echo -n '${currentPackageJson}' | sha256sum | awk '{ print \$1 }'", returnStdout: true).trim()    
                    }
                    echo env.PACKAGE_JSON_HASH
                    cache('node_modules' , env.PACKAGE_JSON_HASH) {
                                echo "updating node-modules"
                                // if not found on cache, then install node-modules
                                sh "yarn install"
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
