pipeline{
    agent any
    stages{
        stage("Prepare Laravel"){
            steps{
                sh 'composer update'
                sh 'php artisan key:generate'
            }
        }
        stage("Laravel Test"){
            steps{
                sh 'php artisan test'
            }
        }
        stage("Dockerized Laravel"){
            steps{
                sh 'docker build -t adhitya/lapp .'
                sh 'docker tag xhartono/app localhost:5000/adhitya/lapp'
                sh 'docker push localhost:5000/adhitya/lapp'
            }
        }
        stage("Deploy Laravel Application"){
            steps{
                sh 'docker run --name mylapp -p 8080:8080 -d localhost:5000/adhitya/lapp'
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}