namespace :docker do

  LOCAL_IMAGE_NAME = "local/spark_executor_docker"
  TAG_NAME = "spark_executor_docker"
  DOCKER_REPO = "<add remote docker hostname>"

  desc "Remove orphaned docker images and containers"
  task :clean do
    %x(docker rm `docker ps -aq --no-trunc --filter 'status=exited'`)
    %x(docker rmi `docker images --filter 'dangling=true' -q --no-trunc`)
  end

  desc "Build Docker image"
  namespace :build do
    task :centos do
      sh %(docker build -t #{LOCAL_IMAGE_NAME} -f Dockerfile.centos .)
    end
    task :alpine do
      sh %(docker build -t #{LOCAL_IMAGE_NAME} -f Dockerfile.alpine .)
    end
  end

  task :push do
    image_tag = %x(docker images | grep #{LOCAL_IMAGE_NAME} | grep latest | awk '{printf "%s", $3}')
    puts "image_tag:#{image_tag}"
    push_tag = "#{DOCKER_REPO}/#{TAG_NAME}"
    puts "push_tag:#{push_tag}"
    sh %(docker tag -f #{image_tag} #{push_tag})
    sh %(docker push #{push_tag})
  end

end  
