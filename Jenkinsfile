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
