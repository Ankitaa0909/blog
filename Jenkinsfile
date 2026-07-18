pipeline {

    agent any

    stages {

        stage('Clone Repository') {

            steps {

                git branch: 'main',
                    url: 'https://github.com/Ankitaa0909/blog.git'

            }

        }

        stage('Build Docker Image') {

            steps {

                sh 'docker build -t blog-app .'

            }

        }

        stage('Deploy Application') {

            steps {

                sh '''
                docker rm -f blog-app || true
                docker run -d --name blog-app -p 8081:80 blog-app
                '''

            }

        }

    }

}
