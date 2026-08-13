pipeline
{
    agent any
    stages
    {
        stage('code')
        {
            steps
            {
                git 'https://github.com/akshayverma004/docker-swarm-repo.git'
            }
        }

        stage('build')
        {
            steps
            {
                sh 'docker build -t $image'
            }
        }

        stage('tag')
        {
            steps
            {
                sh 'docker tag $image $registry'
            }
        }

        stage('push')
        {
            steps
            {
                sh 'docker login -u akshauverma004 -p Akshay@328'
            }
        }

        stage('deploy')
        {
            steps
            {
                sh 'docker stack deploy -c docker-compose.yml $stack_name'
            }
        }
    }
}