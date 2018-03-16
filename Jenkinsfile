pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'cd ./App; npm install -g truffle; truffle compile;'
      }
    }
  }
}