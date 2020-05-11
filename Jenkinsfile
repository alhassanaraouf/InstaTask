pipeline {
  
  agent any
  stages {
    stage('Information') {
      steps {
        sh 'node -v'
        sh 'npm -v'
      }

    }
    stage('Clone Sources') {
      steps {
        git 'https://github.com/dobromir-hristov/todo-app'
      }
    }
    stage('Dependencies') {
      steps {
        sh 'npm install'
      }
    }
    stage('Unit Test') {
      steps {
        sh 'npm run test:unit'
      }
    }
    stage('E2E Test') {
      steps {
        sh 'npm run test:e2e --headless'
      }
    }
    stage('Lint') {
      steps {
        sh 'npm run lint'
      }
    }
    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }
    stage('info') {
      steps {
        sh 'pwd'
        sh 'ls'
      }
    }
    stage('get dockerfile') {
      steps {
        git 'https://github.com/alhassanaraouf/InstaTask'
	sh 'cp ./Dockerfile ./dist/'
      }
    }
    stage('Artifacts') {
      steps {
        sh 'tar -czf dist.tar.gz ./dist'
        archiveArtifacts artifacts: 'dist.tar.gz', fingerprint: true
      }
    }
    stage('Build Docker') {
      steps {
        sh 'docker build -t instatask ./dist'
      }
    }
    }
}
