pipeline {
  agent any

  options {
    timestamps()
    buildDiscarder(logRotator(numToKeepStr: '20'))
  }

  environment {
    VENV = '.venv'
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Setup Python') {
      steps {
        sh '''
          python3 -m venv ${VENV}
          . ${VENV}/bin/activate
          python -m pip install --upgrade pip
          pip install -r requirements.txt
        '''
      }
    }
    stage('Run Robot (headless)') {
      steps {
        sh '''
          . ${VENV}/bin/activate
          # headless via SeleniumLibrary options
          robot --outputdir results -P . tests
        '''
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'results/**', fingerprint: true
      junit allowEmptyResults: true, testResults: 'results/output.xml'
    }
    failure {
      echo 'Tests failed — check results/log.html'
    }
  }
}
