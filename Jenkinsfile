pipeline {
    agent any

    // Triggered by changes in the Git repository
    triggers {
        pollSCM('* * * * *')  // Poll every minute or use webhook for immediate triggers
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Cloning the repository
                git branch: 'jenkins', url: 'https://github.com/yashbhatt1304/JenkinsPipeline.git'
            }
        }

        stage('Build') {
            steps {
                // Example: running a build command, replace with your build tool
                echo '-------Building app-------'
                sh """
                pip3 install pytest flask
                """
            }
        }

        stage('Test') {
            steps {
                // Example: running a test command, replace with your test tool
                echo '-------Testing app-------'
                sh """
                cd /var/lib/jenkins/workspace/Jenkins-Pipeline/Calculator_flask/
                python3 -m pytest app_test.py --disable-warnings -q
                """
            }
        }
        
        stage('Deploy') {
            steps {
                echo '-------Deploying App-------'
                sshagent(['EC2']) {
                    sh """
                    scp -o StrictHostKeyChecking=no -r /var/lib/jenkins/workspace/Jenkins-Pipeline/ ubuntu@3.34.127.225:/home/ubuntu/
                    ssh -o StrictHostKeyChecking=no ubuntu@3.34.127.225 ./Jenkins-Pipeline/script.sh
                    """
                }
            }
        }
    }

    post {
        // If the build or test fails, notify the team or handle failure logic
        failure {
            echo 'Build or Tests Failed!'
        }

        success {
            echo 'Build and Tests Passed!'
        }
    }
}
