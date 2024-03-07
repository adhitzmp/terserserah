pipeline{
    agent any
    stages{
        stage("Prepare Laravel"){
            steps{
                sh 'php artisan key:generate'
                sh 'composer require laravel/dusk --dev'
                sh 'php artisan dusk:install'
                sh 'php artisan dusk:chrome:driver'
            }
        }
        stage("Laravel Test"){
            steps{
                sh 'php artisan test'
                sh 'composer update'
            }
        }
        stage("Dockerized Laravel"){
            steps{
                sh 'docker build -t adhitya/lapp .'
                sh 'docker tag adhitya/lapp localhost:5000/adhitya/lapp'
                sh 'docker push localhost:5000/adhitya/lapp'
            }
        }
        stage("User Acceptance Test"){
            steps{
                sh 'php artisan dusk'
            }
        }
        stage("Deploy Laravel Application"){
            steps{
                sh 'docker run --name mylapp -p 8085:8080 -d \
                    localhost:5000/adhitya/lapp'
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