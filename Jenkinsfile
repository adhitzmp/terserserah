pipeline{
    agent any
    stages{
        stage("Prepare Laravel"){
            steps{
                php artisan key:generate
            }
        }
        stage("Laravel Test"){
            steps{
                php artisan test
            }
        }
        stage("Dockerized Laravel"){
            steps{
                docker build -t adhitya/lapp
                docker tag adhitya/app1 localhost:5000/adhitya/lapp
                docker push localhost:5000/adhitya/lapp
            }
        }
        stage("Deploy Laravel Application"){
            steps{
                docker run --name mylapp -p 8080:8080 -d localhost:5000/adhitya/lapp
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