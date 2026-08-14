pipeline
{
    agent any

    stages
    {
        stage('code')
        {
            steps
            {
                git branch: 'main', url: 'https://github.com/akshayverma004/docker-swarm-repo.git'
            }
        }

        stage('build')
        {
            steps
            {
                sh 'docker build -t $image .'
            }
        }

        stage('tag')
        {
            steps
            {
                sh 'docker tag $image $registry/$image'
            }
        }

        stage('push')
        {
            steps
            {
                sh 'docker login -u akshayverma004 -p Akshay@328'
                sh 'docker push $registry'
            }
        }

        stage('deploy')
        {
            steps
            {
                sh 'docker stack deploy -c docker-compose.yml cloudOrvix'
            }
        }
    }
}