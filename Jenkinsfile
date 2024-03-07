pipeline{
    agent any
    stages{
        stage("Prepare Laravel"){
            steps{
                sh 'php artisan key:generate'
                sh 'composer require laravel/dusk --dev'
                sh 'php artisan dusk:install'
                sh 'php artisan dusk:chrome-driver'
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
                sh 'docker run --rm --name mylapp_uat -p 8080:8080 -d localhost:5000/adhitya/lapp'
                sh 'php artisan dusk'
            }
            post{
                always{
                    echo "====++++always++++===="
                    sh 'docker stop mylapp_uat'
                }
                success{
                    echo "====++++only when successful++++===="
                }
                failure{
                    echo "====++++only when failed++++===="
                }
            }
        }
        stage("Deploy Laravel Application"){
            steps{
                sh 'docker rm -f mylapp_ops'
                sh 'docker run --name mylapp_ops -p 8080:8080 -d \
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