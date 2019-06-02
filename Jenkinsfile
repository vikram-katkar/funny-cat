#!/usr/bin/groovy

pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

stages {

		stage("Test - Unit tests") {
			steps { runUnittests() }
		}

        stage("Build") {
            steps { buildApp() }
		}

        stage("Deploy - Dev") {
            steps { deploy('dev') }
		}

	}
}


def runUnittests() {
	sh "npm install && npm cache clean --force"
	sh "npm run test"
}

def buildApp() {
	dir ('./' ) {
		def appImage = docker.build("pirate007/funny-cat:${BUILD_NUMBER}")
	}
}


def deploy(environment) {

	def containerName = 'app'
	def port = '80'

	sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
	sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
	sh "docker run -d -p ${port}:3000 --name ${containerName} pirate007/funny-cat:${BUILD_NUMBER}"
  
}
